import 'package:flutter/material.dart';

class BottomSheetView extends StatefulWidget {
  const BottomSheetView({super.key});

  @override
  State<BottomSheetView> createState() => _BottomSheetViewState();
}

class _BottomSheetViewState extends State<BottomSheetView> {
  TextEditingController addNewBook = TextEditingController();
  @override
  void initState() {
    addNewBook = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    addNewBook.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      padding: const EdgeInsets.all(10.0),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: const [
              Icon(
                Icons.cancel,
                color: Colors.black,
                fill: 0,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'Add New Book',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            controller: addNewBook,
            decoration: const InputDecoration(
                label: Text("Enter Book name"),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue))),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const BeveledRectangleBorder(),
                minimumSize: const Size(double.maxFinite, 72)),
            onPressed: () {
              print(addNewBook.text);
            },
            child: const Text('Add New Book'),
          ),
        ],
      ),
    );
  }
}
