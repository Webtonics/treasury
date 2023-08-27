import 'package:flutter/material.dart';

class AddNewBook extends StatelessWidget {
  const AddNewBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      height: double.infinity,
      width: double.infinity,
      child: const Text(" You dont have a book yet. Add New Book"),
    );
  }
}
