import 'package:bottender_app/utils/standards/standard_buttons.dart';
import 'package:bottender_app/utils/standards/standard_card.dart';
import 'package:bottender_app/utils/standards/standard_icon.dart';
import 'package:bottender_app/utils/standards/standard_image.dart';
import 'package:bottender_app/utils/standards/standard_padding.dart';
import 'package:bottender_app/utils/standards/standard_spacing.dart';
import 'package:bottender_app/utils/style/color.dart';
import 'package:bottender_app/utils/style/dimensions.dart';
import 'package:bottender_app/utils/style/fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HorizontalPhotoModel {
  final String title;
  final String imageUrl;
  final void Function(int) onTap;
  final bool isDeleteble;
  final void Function(int)? onDelete;

  HorizontalPhotoModel(
      {required this.title,
      required this.imageUrl,
      required this.onTap,
      this.isDeleteble = false,
      this.onDelete,});
}

class StandardHorizontalPhotoScroller extends StatelessWidget {
  final List<HorizontalPhotoModel> items;
  final int? maxItems;
  final int maxItemsOnScreen;
  final bool canAddToList;
  final void Function()? onAddToItems;

  const StandardHorizontalPhotoScroller(
      {required this.items,
      this.maxItems,
      this.canAddToList = false,
      this.onAddToItems,
      this.maxItemsOnScreen = 3,
      super.key,});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount:
                canAddToList && (maxItems == null || items.length < maxItems!)
                    ? items.length + 1
                    : items.length,
            itemBuilder: (context, index) {
              if (index == items.length && items.length < maxItems!) {
                return _addButton();
              }
              return _buildItem(
                  item: items[index],
                  index: index,
                  context: context,
                  maxItemsOnScreen: maxItemsOnScreen,);
            },
            separatorBuilder: (context, index) {
              return StandardSpacing.regular();
            },
          ),
        ),
      ],
    );
  }

  Widget _addButton() {
    return Container(
      margin: const EdgeInsets.all(StandardSpacingSize.small),
      child: InkWell(
        onTap: onAddToItems,
        child: StandardPadding.all(
          padding: StandardSpacingSize.small,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const StandardIcon(icon: FontAwesomeIcons.plus),
              StandardSpacing.regular(),
              const Flexible(
                child: Text(
                  'Press to add a new value',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(
      {required HorizontalPhotoModel item,
      required int index,
      required BuildContext context,
      required int maxItemsOnScreen,}) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - StandardSpacingSize.regular) /
          maxItemsOnScreen,
      child: StandardCard(
          padding: 0,
          color: AppThemeColor.cardBackground,
          child: Column(
            children: [
              StandardSpacing.regular(),
              Expanded(
                flex: 3,
                child: InkWell(
                  onTap: () => item.onTap(index),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(StandardBorder.smallRadiusSize),),
                    child: StandardImage(
                      url: item.imageUrl,
                      padding: 0,
                    ),
                  ),
                ),
              ),
              StandardSpacing.regular(),
              Expanded(
                child: Row(
                  children: [
                    StandardSpacing.medium(),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          item.title,
                          style: StandardTextStyles().callout.bold,
                        ),
                      ),
                    ),
                    if (item.isDeleteble)
                      StandardIconButton(
                          size: StandardIconSize().extraSmallIcon,
                          icon: FontAwesomeIcons.trashCan,
                          onTap: () => item.onDelete!(index),),
                    StandardSpacing.medium(),
                  ],
                ),
              ),
              StandardSpacing.medium(),
            ],
          ),),
    );
  }
}
