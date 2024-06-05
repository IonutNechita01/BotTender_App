import 'dart:async';
import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:bottender_app/device/device_action.dart';
import 'package:bottender_app/ingredient/ingredient_detail_screen.dart';
import 'package:bottender_app/main.dart';
import 'package:bottender_app/models/ingredient_model/ingredient_model.dart';
import 'package:bottender_app/redux/app_state.dart';
import 'package:bottender_app/utils/others/constants.dart';
import 'package:bottender_app/utils/others/firebase_utils.dart';
import 'package:bottender_app/utils/standards/standard_loading_modal.dart';
import 'package:bottender_app/utils/standards/standard_modal.dart';
import 'package:bottender_app/utils/style/color.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ShowIngredientDetailModalAction extends ReduxAction<AppState> {
  @override
  AppState? reduce() {
    StandardModal.showStandardModal<dynamic>(
      context: navigatorKey.currentContext!,
      child: const IngredientDetailScreen(),
    );
    return null;
  }
}

class SetSelectedIngredientAction extends ReduxAction<AppState> {
  final IngredientModel ingredient;
  final bool isEditable;

  SetSelectedIngredientAction({
    required this.ingredient,
    this.isEditable = true,
  });

  @override
  AppState reduce() {
    return state.copyWith.ingredientState
        .call(selectedIngredient: ingredient, isEditable: isEditable);
  }
}

class AddImageToIngredientAction extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    final hasPermission = await checkPermission();
    if (!hasPermission) {
      StandardModal.showStandardModal<dynamic>(
        context: navigatorKey.currentContext!,
        title: 'Permission Denied',
        description:
            '''You need to allow the app to access your camera and gallery to add an image.''',
      );
      return null;
    }
    StandardModal.showStandardModal<dynamic>(
      context: navigatorKey.currentContext!,
      title: 'Add Image',
      description: 'Select an image from your gallery or take a photo.',
      rightButtonText: 'Camera',
      midleButtonText: 'Gallery',
      leftButtonText: 'Cancel',
      onRightButtonTap: () async {
        await showImagePicker(ImageSource.camera);
        StandardModal.hideStandardModal();
      },
      onMidleButtonTap: () async {
        await showImagePicker(ImageSource.gallery);
        StandardModal.hideStandardModal();
      },
    );
    return null;
  }

  Future<bool> checkPermission() async {
    var statuses = <Permission, PermissionStatus>{};
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      final androidVersion = androidInfo.version.sdkInt;
      if (androidVersion > 32) {
        statuses = await [
          Permission.camera,
          Permission.photos,
        ].request();
        return statuses[Permission.camera]!.isGranted &&
            statuses[Permission.photos]!.isGranted;
      }
      statuses = await [
        Permission.camera,
        Permission.storage,
      ].request();
      return statuses[Permission.camera]!.isGranted &&
          statuses[Permission.storage]!.isGranted;
    }
    return true;
  }

  Future<void> showImagePicker(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) {
      return;
    }
    final croppedImage = await ImageCropper().cropImage(
      uiSettings: [
        AndroidUiSettings(
          lockAspectRatio: true,
          hideBottomControls: true,
          toolbarTitle: 'Crop Image',
          activeControlsWidgetColor: AppThemeColor.primary,
          toolbarColor: AppThemeColor.primary,
          toolbarWidgetColor: AppThemeColor.cardBackground,
        ),
      ],
      sourcePath: image.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      maxHeight: 512,
      maxWidth: 512,
    );
    if (croppedImage == null) {
      return;
    }
    final tempImage = File(croppedImage.path);
    dispatch(UpdateTempImageAction(tempImage: tempImage));
  }
}

class UpdateTempImageAction extends ReduxAction<AppState> {
  final File tempImage;

  UpdateTempImageAction({required this.tempImage});

  @override
  AppState reduce() {
    return state.copyWith.ingredientState.call(tempImage: tempImage);
  }
}

class ClearTempImagePathAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    if (state.ingredientState.tempImage != null) {
      await state.ingredientState.tempImage!.delete();
    }
    return state.copyWith.ingredientState.call(tempImage: null);
  }
}

class SaveIngredientAction extends ReduxAction<AppState> {
  final IngredientModel ingredient;

  SaveIngredientAction(this.ingredient);

  @override
  Future<AppState?> reduce() async {
    try {
      if (!state.ingredientState.isEditable) {
        await saveIngredientToBotTender(ingredient);
        dispatch(SetIngredientOnDeviceAction(ingredient: ingredient));
        StandardLoadingModal.hideStandardLoadingModal();
        StandardModal.hideStandardModal();
        return state.copyWith.ingredientState.call(
          selectedIngredient: const IngredientModel.initial(),
        );
      }
      final url = await saveImageToDatabase();
      var newIngredient = ingredient.copyWith(imageUrl: url);
      newIngredient = await saveIngredientToDatabase(newIngredient);
      await dispatchAndWait(ClearTempImagePathAction());
      dispatch(SetIngredientOnDeviceAction(ingredient: newIngredient));
      await saveIngredientToBotTender(newIngredient);
      StandardLoadingModal.hideStandardLoadingModal();
      StandardModal.hideStandardModal();
      return state.copyWith.ingredientState.call(
        selectedIngredient: const IngredientModel.initial(),
      );
    } catch (e) {
      StandardLoadingModal.hideStandardLoadingModal();
      StandardModal.hideStandardModal();
      StandardModal.showStandardModal<dynamic>(
        context: navigatorKey.currentContext!,
        title: 'Error',
        description: 'Failed to save ingredient. Please try again.',
      );
      return null;
    }
  }

  Future<void> saveIngredientToBotTender(IngredientModel newIngredient) async {
    final response = await state.devicesState.connectedDevice
        ?.send(path: Endpoints.addIngredient, data: newIngredient.toJson());
    if (response == null || response['status'] != Response.success) {
      throw Exception();
    }
  }

  Future<IngredientModel> saveIngredientToDatabase(
    IngredientModel newIngredient,
  ) async {
    try {
      final ingredientId =
          db.collection(FirebaseCollections.ingredient).doc().id;
      final updatedIngredient = newIngredient.copyWith(id: ingredientId);
      await db
          .collection(FirebaseCollections.ingredient)
          .doc(ingredientId)
          .set(updatedIngredient.toMap());
      return updatedIngredient;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> saveImageToDatabase() async {
    try {
      final image = state.ingredientState.tempImage!;
      final ref = storage.ref().child(
            '${FirebaseStoragePath.ingredient}/${ingredient.name.replaceAll(' ', '_').toLowerCase()}.${image.path.split('.').last}',
          );
      final task = await ref.putFile(image);
      final url = await task.ref.getDownloadURL();
      return url;
    } catch (e) {
      rethrow;
    }
  }
}

class RemoveIngredientAction extends ReduxAction<AppState> {
  final int position;

  RemoveIngredientAction({required this.position});

  @override
  Future<AppState?> reduce() async {
    try {
      StandardLoadingModal.showStandardLoadingModal(
        context: navigatorKey.currentContext!,
      );
      final ingredient = state
          .devicesState.connectedDevice!.availableIngredients
          .firstWhere((element) => element.position == position);
      final response = await state.devicesState.connectedDevice
          ?.send(path: Endpoints.removeIngredient, data: ingredient.toJson());
      if (response == null || response['status'] != Response.success) {
        throw Exception();
      }
      final availableIngredients = [
        ...state.devicesState.connectedDevice!.availableIngredients
          ..removeWhere((element) => element.position == position),
      ];
      final newDevice = state.devicesState.connectedDevice!.copyWith(
        availableIngredients: availableIngredients,
      );
      StandardLoadingModal.hideStandardLoadingModal();
      return state.copyWith.devicesState.call(connectedDevice: newDevice);
    } catch (e) {
      StandardLoadingModal.hideStandardLoadingModal();
      StandardModal.showStandardModal<dynamic>(
        context: navigatorKey.currentContext!,
        title: 'Error',
        description: 'Failed to remove ingredient. Please try again.',
      );
      return null;
    }
  }
}
