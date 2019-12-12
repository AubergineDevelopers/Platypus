import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:platypus/providers/home.dart';

class HorizontalPaddingSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, homeProvider, __) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: <Widget>[
            Text('Horizontal Padding'),
            Slider(
              onChanged: (newHorizontalPaddingBetweenCodeAndBackground) {
                homeProvider.horizontalPaddingBetweenCodeAndBackground =
                    newHorizontalPaddingBetweenCodeAndBackground;
              },
              value: homeProvider.horizontalPaddingBetweenCodeAndBackground,
              min: 0,
              max: 50,
            )
          ],
        ),
      ),
    );
  }
}
