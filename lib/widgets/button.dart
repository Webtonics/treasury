import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      // this.on
      required this.labeltitle,
      this.colors,
      required this.icon,
      this.labelColor,
      required this.onTap});
  final String labeltitle;
  final Color? colors;
  final IconData icon;
  final Color? labelColor;
  // final Function onTap() {}
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: colors,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
            minimumSize: const Size(double.maxFinite, 60),
            side: const BorderSide(
              color: Color.fromRGBO(13, 71, 161, 1),
            )),
        // icon: Icon(icon),
        child: Text(
          labeltitle,
          style: TextStyle(color: labelColor),
        ),
      ),
    );
  }
}
