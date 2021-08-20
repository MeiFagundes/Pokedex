import 'package:flutter/material.dart';
import 'package:pokedex/utils/url_util.dart';
import 'package:pokedex/views/shared/custom_icons_icons.dart';
import 'package:pokedex/views/shared/text_styles.dart';

class AppBars {
  static final defaultAppbar = AppBar(
    title: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Icon(CustomIcons.pokeball),
        ),
        Text(
          'Pokedex',
          style: TextStyles.title,
        ),
      ],
    ),
    actions: [
      IconButton(
        icon: const Icon(Icons.home),
        tooltip: 'meifagundes.com',
        onPressed: () {
          UrlUtil.openURI(UrlUtil.urlHome);
        },
      ),
    ],
  );
}
