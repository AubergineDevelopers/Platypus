import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:platypus/providers/home.dart';
import 'package:platypus/utils/utils.dart';

class ThreeCirclesPositionDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, homeProvider, __) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        child: DropdownButtonFormField(
          value: homeProvider.windowThreeCirclesPosition.toString(),
          onChanged: (newWindowThreeCirclesPosition) {
            homeProvider.windowThreeCirclesPosition =
                newWindowThreeCirclesPosition;
          },
          decoration: InputDecoration(labelText: 'Window Circles Position'),
          items: <DropdownMenuItem>[
            ...windowThreeCirclesPositions.keys.map(
              (windowThreeCirclesPosition) => DropdownMenuItem(
                child: Text(
                  windowThreeCirclesPosition,
                ),
                value: windowThreeCirclesPosition,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
