import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:treasury/constants/images.dart';
import 'package:treasury/screens/book.dart';
import 'package:treasury/widgets/bottom_sheet_draw.dart';
import 'package:treasury/widgets/card_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget spacer(double height) {
    return SizedBox(
      height: height,
    );
  }

  // final Stream<QuerySnapshot> users =
  //     FirebaseFirestore.instance.collection('books').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        backgroundColor: Colors.white,
        // title:
        title: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
                borderRadius: BorderRadius.circular(7.0)),
            child: const Icon(
              Icons.house,
              shadows: [],
            ),
          ),
          title: const Text(
            "Company Name",
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          subtitle: const Text(
            "Tap to switch business",
            style: TextStyle(color: Colors.black54, fontSize: 11),
          ),
          trailing: const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Colors.black54,
          ),
        ),

        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person_add_alt_outlined,
                color: Colors.blue[900],
              ))
        ],
      ),
      body: Column(
        children: [
          //container
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                  color: Colors.blue[900],
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Basics of Treasury",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      spacer(5),
                      const Text(
                        "Tap to switch business",
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                      spacer(5),
                      const CardButton(
                          title: "Know more",
                          fontsize: 11,
                          cardcolor: Colors.white,
                          fontcolor: Colors.black)
                    ],
                  ),
                  Column(
                    children: const [
                      Image(
                        image: AssetImage(image),
                        height: 70,
                        width: 100,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          spacer(10),
          // Your books

          Padding(
            padding: const EdgeInsets.all(11.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Text("Your Books"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.sort),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(Icons.search)
                  ],
                )
              ],
            ),
          ),

          // List
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ListView.builder(
                  // shrinkWrap: true,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            // allowSnapshotting: false,
                            builder: (context) => const BookView()));
                      },
                      leading: Icon(
                        Icons.group,
                        color: Colors.blue[900],
                      ),
                      title: const Text("Field Trip"),
                      subtitle: const Text("updated on jun 11 2023"),
                      trailing: const Text(
                        "2100",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      // trailing: Row(
                      //   children: const [
                      //     Text("2100"),
                      //     Icon(Icons.drag_indicator_outlined)
                      //   ],
                      // ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            elevation: 2, padding: const EdgeInsets.all(12)),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: false,
            builder: (_) => const BottomSheetView(),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text("Add New Book"),
      ),
    );
  }
}
