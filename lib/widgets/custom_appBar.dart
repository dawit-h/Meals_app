import 'package:flutter/material.dart';

PreferredSizeWidget custom_app_bar(
    {String title = "Meals App", List<Widget>? actions}) {
  return AppBar(
    actions: actions,
    title: Text(title),
  );
}
