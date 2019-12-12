import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_highlight/theme_map.dart';

import 'package:platypus/providers/home.dart';

class HighlightThemesDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, homeProvider, __) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        child: DropdownButtonFormField(
          onChanged: (newCodeHighlightTheme) {
            homeProvider.codeHighlightTheme = newCodeHighlightTheme;
          },
          value: homeProvider.codeHighlightTheme,
          decoration: InputDecoration(
            labelText: 'Theme',
          ),
          items: <DropdownMenuItem>[
            ...themeMap.keys.map(
              (theme) => DropdownMenuItem(
                child: Text(theme),
                value: theme,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
