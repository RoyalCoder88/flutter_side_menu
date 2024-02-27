import 'package:flutter/material.dart';
import 'package:flutter_side_menu/src/data/side_menu_data.dart';
import 'package:flutter_side_menu/src/data/side_menu_item_data.dart';
import 'package:flutter_side_menu/src/item/export.dart';

class SideMenuBody extends StatelessWidget {
  const SideMenuBody({
    Key? key,
    required this.minWidth,
    required this.isOpen,
    required this.data,
  }) : super(key: key);
  final double minWidth;
  final bool isOpen;
  final SideMenuData data;
  // final AnimationController _ctrlAnimCustomWidget = AnimationController(
  //     vsync: this, duration: const Duration(milliseconds: 1000));
  // final Animation<double> _animCustomWidget = CurvedAnimation(
  //   parent: _ctrlAnimCustomWidget,
  //   curve: Curves.easeIn,
  // );

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max, children: [
      if (data.header != null) data.header!,
      if (data.customChild != null)
        Expanded(flex: data.customWidgetFlex!, child: data.customChild!),
      data.withSpacing!
          ? Spacer(
              flex: data.spacingFlex!,
            )
          : const SizedBox.shrink(),
      if (data.items != null)
        Expanded(
          child: AnimatedScale(
            scale: isOpen ? 1 : data.menuItemsMinSize!,
            duration: data.scaleMenuItemAnimDuration ??
                const Duration(milliseconds: 500),
            child: Container(
              color: Colors.transparent,
              child: ListView.builder(
                controller: ScrollController(),
                itemCount: data.items!.length,
                //reverse: true,
                //shrinkWrap: true,
                itemBuilder: (context, index) {
                  final SideMenuItemData item = data.items![index];
                  if (item is SideMenuItemDataTile) {
                    return SideMenuItemTile(
                      minWidth: minWidth,
                      isOpen: isOpen,
                      data: item,
                    );
                  } else if (item is SideMenuItemDataTitle) {
                    return SideMenuItemTitle(
                      data: item,
                    );
                  } else if (item is SideMenuItemDataDivider) {
                    return SideMenuItemDivider(
                      data: item,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        ),
      if (data.footer != null)
        AnimatedScale(
            scale: isOpen ? 1 : data.footeMinScale!, //data.menuItemsMinSize!
            duration: data.scaleMenuItemAnimDuration ??
                const Duration(milliseconds: 500),
            child: data.footer!),
    ]);
  }
}
