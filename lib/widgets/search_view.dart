import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 191, 185, 185),
      // appBar: AppBar(
      //   actions: const [

      //   ],
      // ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search by remark or amount",
                  prefixIcon: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(Icons.arrow_circle_left_outlined))),
            ),
          ),
          //cards
          Row(
            children: const [
              Card(
                child: Icon(Icons.filter_list_sharp),
              )
            ],
          )
        ],
      ),
    );
  }
}
