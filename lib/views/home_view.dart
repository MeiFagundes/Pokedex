import 'package:flutter/material.dart';
import 'package:pokedex/utils/url_util.dart';
import 'package:pokedex/views/shared/custom_icons_icons.dart';
import 'package:pokedex/views/shared/text_styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
      ),
    );
  }
}
