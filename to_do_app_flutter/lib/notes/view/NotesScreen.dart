import 'package:flutter/material.dart';
import 'package:to_do_app_flutter/notes/view/NotesWidget.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 16, right: 16),
          child: Text(
            'Notes',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        NotesWidget()
      ],
    );
  }
}
