import 'package:flutter/material.dart';
import 'package:treasury/helper/db_helper.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({
    super.key,
    required this.appBarTitle,
  });

  // final double amount;
  final String appBarTitle;

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  // final String appBarTitle = appBarTitle;
  // final String book = appBartitle.toString();
  TextEditingController _amount = TextEditingController();

  Future<String> getBook() async {
    final String bookName = widget.appBarTitle.toString();
    print(bookName);
    final String? bookId = await _databaseHelper.getBookIdByName(bookName);
    if (bookId != null) {
      // Do something with the bookId
      print('Book ID: $bookId');
      return bookId.toString();
    } else {
      print('Book not found.');
      return bookName;
    }
  }

  // static String get appBartitle => null;
  @override
  void initState() {
    _amount = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _amount.dispose();
    super.dispose();
  }

  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    // String appBarTitle = "Add Cash in Entry";
    return Scaffold(
      appBar: AppBar(title: Text(widget.appBarTitle.toString())),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //row: date and time

            //Textformfield
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _amount,
                decoration: const InputDecoration(
                  label: Text("Amount * "),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 16, 69, 112))),
                ),
              ),
            ),

            const SizedBox(
              height: 32,
            ),

            // button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      // Replace with the actual book name
                      await getBook();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(12),
                      minimumSize: const Size(double.infinity, 50),
                      // maximumSize: const Size(double.infinity, 10)
                    ),
                    child: Text(
                      // "    Save    ",
                      widget.appBarTitle.toString(),
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(12),
                      minimumSize: const Size(double.infinity, 50),
                      // maximumSize: const Size(double.infinity, 10)
                    ),
                    child: const Text(
                      "Cancel",
                      style:
                          TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
