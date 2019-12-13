import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:platypus/providers/home.dart';
import 'package:platypus/utils/utils.dart';

class FontFamilyDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, homeProvider, __) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        child: DropdownButtonFormField(
          onChanged: (newCodeFontFamily) {
            homeProvider.codeFontFamily = newCodeFontFamily;
          },
          value: homeProvider.codeFontFamily,
          decoration: InputDecoration(
            labelText: 'Font Family',
          ),
          items: <DropdownMenuItem>[
            ...extractedGoogleFonts.keys.map(
              (extractedGoogleFont) => DropdownMenuItem(
                child: Text(extractedGoogleFont),
                value: extractedGoogleFont,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
