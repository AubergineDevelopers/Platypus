import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:platypus/providers/home.dart';

class ToggleLineNumbersRaisedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, homeProvider, __) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 4,
        ),
        child: RaisedButton(
          onPressed: () {
            homeProvider.showLineNumbers = !homeProvider.showLineNumbers;
            if (!homeProvider.isPreview && homeProvider.showLineNumbers) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('Switch to preview to view the line-numbers'),
                  action: SnackBarAction(
                    onPressed: () {
                      homeProvider.isPreview = true;
                    },
                    label: 'Switch',
                  ),
                ),
              );
            }
          },
          child: Text('Toggle Line Numbers'),
        ),
      ),
    );
  }
}
