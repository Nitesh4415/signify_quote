import 'package:flutter/material.dart';


/// [InfoButton] opens up the [AboutPanel] when pressed.
class InfoButton extends StatelessWidget {
  const InfoButton({
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 15),
      ),
      child: Icon(
        Icons.info_outline,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }
}
