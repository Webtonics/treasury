import 'package:flutter/material.dart';

class TransactionView extends StatelessWidget {
  const TransactionView(
      {super.key,
      required this.date,
      required this.type,
      required this.name,
      required this.balance,
      required this.entryTime,
      required this.amount});

  final String date;

  final String type;

  final String name;

  final String amount;

  final String balance;

  final String entryTime;

  Widget spacer(double height) {
    return SizedBox(
      height: height,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            date,
            style: TextStyle(
              color: Colors.brown[400],
              fontSize: 11,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          decoration: const BoxDecoration(color: Colors.white),
          height: 95,
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.black26))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          //income or expense
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: Text(
                              type,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),

                          spacer(5),

                          // Name
                          Text(
                            name,
                            style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          // to amount
                          Text(
                            amount,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 19),
                          ),
                          spacer(5),

                          // to balance
                          Text(balance,
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ],
                  ),
                ),
                spacer(5),
                //Entry by you
                Text("Entry by You $entryTime",
                    style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        fontWeight: FontWeight.w700)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
