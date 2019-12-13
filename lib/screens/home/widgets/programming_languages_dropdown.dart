import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:platypus/providers/home.dart';
import 'package:platypus/utils/utils.dart';

class ProgrammingLanguagesDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, homeProvider, __) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        child: DropdownButtonFormField(
          value: homeProvider.codeProgrammingLanguage,
          onChanged: (newCodeProgrammingLanguage) {
            homeProvider.codeProgrammingLanguage = newCodeProgrammingLanguage;
            if (!homeProvider.isPreview) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content:
                      Text('Switch to preview to view syntax highlighting'),
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
          decoration: InputDecoration(labelText: 'Language'),
          items: <DropdownMenuItem>[
            ...programmingLanguages.keys.map(
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
