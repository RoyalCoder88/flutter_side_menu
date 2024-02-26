import 'package:flutter/material.dart';
import 'package:flutter_side_menu/src/data/side_menu_item_data.dart';

class SideMenuData {
  const SideMenuData({
    this.customChild,
    this.header,
    this.footer,
    this.items,
    this.withSpacing,
    this.spacingFlex,
    this.customWidgetFlex,
  }) : assert(customChild != null || items != null);

  final Widget? customChild, header, footer;
  final List<SideMenuItemData>? items;
  //! DORIN CUSTOM PARAMS
  final bool? withSpacing;
  final int? spacingFlex;
  final int? customWidgetFlex;
}
