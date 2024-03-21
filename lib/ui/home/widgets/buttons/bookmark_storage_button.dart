import 'package:flutter/material.dart';

import '../../../../utils/ui_strings.dart';


/// [BookmarkStorageButton] navigates to [SavedQuotesScreen] on-pressed.
class BookmarkStorageButton extends StatelessWidget {
  const BookmarkStorageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(
          context,
          UiStrings.savedQuotesScreenRoute,
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 15),
      ),
      child: Icon(
        Icons.bookmarks,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}
