import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:platypus/providers/home.dart';

class FontSizeSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, homeProvider, __) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: <Widget>[
            Text('Font Size'),
            Slider(
              onChanged: (newCodeFontSize) {
                homeProvider.codeFontSize = newCodeFontSize;
              },
              value: homeProvider.codeFontSize,
              min: 16,
              max: 32,
            )
          ],
        ),
      ),
    );
  }
}
