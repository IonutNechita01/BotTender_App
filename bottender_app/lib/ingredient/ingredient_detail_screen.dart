import 'package:bottender_app/ingredient/ingredient_action.dart';
import 'package:bottender_app/redux/app_state.dart';
import 'package:bottender_app/redux/store.dart';
import 'package:bottender_app/utils/others/constants.dart';
import 'package:bottender_app/utils/others/enums.dart';
import 'package:bottender_app/utils/standards/standard_dropdown.dart';
import 'package:bottender_app/utils/standards/standard_field.dart';
import 'package:bottender_app/utils/standards/standard_field_validations.dart';
import 'package:bottender_app/utils/standards/standard_image.dart';
import 'package:bottender_app/utils/standards/standard_loading_modal.dart';
import 'package:bottender_app/utils/standards/standard_modal.dart';
import 'package:bottender_app/utils/standards/standard_spacing.dart';
import 'package:bottender_app/utils/style/fonts.dart';
import 'package:bottender_app/utils/widgets/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider_for_redux/provider_for_redux.dart';

class IngredientDetailScreen extends StatefulWidget {
  const IngredientDetailScreen({super.key});

  @override
  State<IngredientDetailScreen> createState() => _IngredientDetailScreenState();
}

class _IngredientDetailScreenState extends State<IngredientDetailScreen> {
  final formField = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final barcodeController = TextEditingController();
  final typeController = TextEditingController();
  final subtypeController = TextEditingController();
  final quantityController = TextEditingController();
  final ingredient = store.state.ingredientState.selectedIngredient;
  final isEditable = store.state.ingredientState.isEditable;

  @override
  void initState() {
    nameController.text = ingredient.name;
    barcodeController.text = ingredient.barcode;
    typeController.text = ingredient.type;
    subtypeController.text = ingredient.subtype;
    quantityController.text = ingredient.quantity.toString();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    barcodeController.dispose();
    typeController.dispose();
    subtypeController.dispose();
    quantityController.dispose();
    store.dispatch(ClearTempImagePathAction());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReduxSelector<AppState, dynamic>(
      selector: (context, state) => [
        state.ingredientState.tempImage,
        state.ingredientState.selectedIngredient,
      ],
      builder: (context, store, state, dispatch, model, child) => AppLayout(
        safeArea: false,
        title: 'Ingredient Detail',
        bottomButtonLabel: 'Save',
        bottomButtonFunction: saveIngredient,
        secondBottomButtonLabel: 'Cancel',
        secondBottomButtonFunction: StandardModal.hideStandardModal,
        child: SingleChildScrollView(
          child: Form(
            key: formField,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isEditable
                      ? '''Fill in the details of the ingredient below, then click save.'''
                      : 'Here are the details of the ingredient you scan.',
                  style: StandardTextStyles().callout.regular,
                ),
                StandardSpacing.medium(),
                Text(
                  'Ingredient Image',
                  style: StandardTextStyles().headline.regular,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: isEditable
                          ? () => dispatch(AddImageToIngredientAction())
                          : null,
                      child: state.ingredientState.tempImage != null
                          ? StandardFileImage(
                              file: state.ingredientState.tempImage!,
                              height: MediaQuery.of(context).size.height * 0.2,
                            )
                          : StandardImage(
                              url: ingredient.imageUrl,
                              height: MediaQuery.of(context).size.height * 0.2,
                            ),
                    ),
                  ],
                ),
                StandardSpacing.medium(),
                StandardField(
                  readOnly: !isEditable,
                  controller: nameController,
                  label: 'Ingredient Name',
                  validator: StandardFieldValidations.validateEmpty,
                ),
                StandardSpacing.medium(),
                StandardField(
                  readOnly: !isEditable,
                  keyboardType: TextInputType.number,
                  controller: barcodeController,
                  label: 'Barcode',
                  validator: StandardFieldValidations.validateNumber,
                ),
                StandardSpacing.medium(),
                StandardField(
                  keyboardType: TextInputType.number,
                  controller: quantityController,
                  label: 'Quantity',
                  validator: StandardFieldValidations.validateNumber,
                ),
                StandardSpacing.medium(),
                StandardDropdown(
                    readOnly: !isEditable,
                    onSelected: (_) => setState(() {
                          subtypeController.text = '';
                        }),
                    items: IngredientType.values.map((e) => e.name).toList(),
                    controller: typeController,
                    hindText: 'Type',),
                StandardSpacing.medium(),
                StandardDropdown(
                    readOnly: !isEditable,
                    hindText: 'Subtype',
                    items: IngredientSubtypes
                            .ingredientSubtypes[typeController.text] ??
                        [],
                    controller: subtypeController,),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> saveIngredient() async {
    final isValid = validateForm();
    if (!isValid) {
      return;
    }
    StandardLoadingModal.showStandardLoadingModal(context: context);
    final ingredient = store.state.ingredientState.selectedIngredient.copyWith(
      name: nameController.text,
      barcode: barcodeController.text,
      type: typeController.text,
      subtype: subtypeController.text,
      quantity: double.parse(quantityController.text),
    );
    await store.dispatch(SaveIngredientAction(ingredient));
  }

  bool validateForm() {
    if (store.state.ingredientState.tempImage == null &&
        store.state.ingredientState.selectedIngredient.imageUrl ==
            'assets/images/ingredient_icon.png') {
      StandardModal.showStandardModal<dynamic>(
        context: context,
        title: 'Image Required',
        description: 'Please add an image for the ingredient.',
      );
      return false;
    }
    if (typeController.text == '') {
      StandardModal.showStandardModal<dynamic>(
        context: context,
        title: 'Type Required',
        description: 'Please select a type for the ingredient.',
      );
      return false;
    }
    if (subtypeController.text == '') {
      StandardModal.showStandardModal<dynamic>(
        context: context,
        title: 'Subtype Required',
        description: 'Please select a subtype for the ingredient.',
      );
      return false;
    }
    final isValid = formField.currentState!.validate();
    if (!isValid) {
      StandardModal.showStandardModal<dynamic>(
        context: context,
        title: 'Invalid Fields',
        description: 'Please fill in all the required fields.',
      );
      return false;
    }
    return true;
  }
}
