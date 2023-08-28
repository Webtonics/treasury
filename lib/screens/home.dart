import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:treasury/constants/images.dart';
import 'package:treasury/helper/db_helper.dart';
import 'package:treasury/services/auth/auth_service.dart';
import 'package:treasury/widgets/bottom_sheet_draw.dart';
import 'package:treasury/widgets/card_button.dart';
import '../widgets/page/booklist.dart';

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

  final DatabaseHelper _databaseHelper = DatabaseHelper();

  // get username
  // Future<String> name() async {
  //   final username = await _databaseHelper.getName();
  //   return username;
  // }

  // final Stream<QuerySnapshot> users =
  //     FirebaseFirestore.instance.collection('books').snapshots();
  @override
  Widget build(BuildContext context) {
    // final userName = name();
    // print(name());
    // print(name());
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
            "Welcome",
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          // subtitle: Text(
          //   // "Emmanuel olooolo",
          //   userName,
          //
          // ),
          subtitle: FutureBuilder<Object>(
            future: _databaseHelper.getName(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final displayName =
                    snapshot.data ?? ''; // Default to an empty string
                return Text(
                  '$displayName',
                  style: const TextStyle(color: Colors.black54, fontSize: 17),
                );
              }
            },
          ),
          trailing: const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Colors.black54,
          ),
        ),

        actions: [
          IconButton(
              onPressed: () {
                AuthService.firebase().logOut();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/', (route) => false);
              },
              icon: Icon(
                Icons.logout_outlined,
                // Icons.person_add_alt_outlined,
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
                child: BookList(),
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
