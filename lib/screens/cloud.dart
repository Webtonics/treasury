import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TestCloud extends StatelessWidget {
  TestCloud({super.key});

  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Testing Cloud"),
      ),
      body: //,
          StreamBuilder(
        stream: users,
        builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            //show dialog
            return const Text("Unexpected");
          }
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return const Center(
                child: CircularProgressIndicator(),
              );

            default:
              return const CircularProgressIndicator();
          }

          final data = snapshot.requireData;

          return ListView.builder(
              itemCount: data.size,
              itemBuilder: (context, index) {
                return Text(data.docs[index]['name']);
              });
        }),
      ),
    );
  }
}
