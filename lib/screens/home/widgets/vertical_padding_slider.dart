import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:platypus/providers/home.dart';

class VerticalPaddingSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, homeProvider, __) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: <Widget>[
            Text('Vertical Padding'),
            Slider(
              onChanged: (newVerticalPaddingBetweenCodeAndBackground) {
                homeProvider.verticalPaddingBetweenCodeAndBackground =
                    newVerticalPaddingBetweenCodeAndBackground;
              },
              value: homeProvider.verticalPaddingBetweenCodeAndBackground,
              min: 0,
              max: 50,
            )
          ],
        ),
      ),
    );
  }
}
