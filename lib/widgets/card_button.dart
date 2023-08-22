import 'package:flutter/material.dart';
import 'package:treasury/screens/help.dart';

class CardButton extends StatelessWidget {
  const CardButton(
      {super.key,
      required this.title,
      required this.fontsize,
      required this.cardcolor,
      required this.fontcolor});

  final String title;
  final double fontsize;
  final Color cardcolor;
  final Color fontcolor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(0),
        // padding: const EdgeInsets.only(left: 3, right: 5),
        child: GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const HelpScreen(),
          )),
          child: Card(
            elevation: 2,
            color: cardcolor,
            child: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: fontcolor,
                        fontSize: fontsize,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  const Icon(Icons.keyboard_arrow_right_rounded)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
