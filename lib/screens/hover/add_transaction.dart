import 'package:flutter/material.dart';
import 'package:treasury/screens/help.dart';
import 'package:treasury/screens/home.dart';
import 'package:treasury/widgets/button.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({
    super.key,
    required this.appBarTitle,
  });

  // final double amount;
  final String appBarTitle;

  // _AddTransactionState(this.amount, this.appBarTitle);

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  // String get appBarTitle => appBarTitle;
  TextEditingController _amount = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    String appBarTitle = "Add Cash in Entry";
    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              height: 12,
            ),

            // button
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ButtonWidget(
                        onTap: () {
                          print(_amount.text);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HelpScreen()));
                        },
                        labeltitle: "SAVE",
                        colors: Colors.white,
                        labelColor: Colors.blue[900],
                        icon: Icons.add),
                    ButtonWidget(
                      onTap: () async {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                      },
                      labeltitle: "CANCEL",
                      colors: const Color.fromRGBO(13, 71, 161, 1),
                      icon: Icons.add,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
