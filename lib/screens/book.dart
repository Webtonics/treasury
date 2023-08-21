import 'package:flutter/material.dart';

import '../widgets/search_view.dart';

class BookView extends StatefulWidget {
  const BookView({super.key});

  @override
  State<BookView> createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {
  Widget spacer(double height) {
    return SizedBox(
      height: height,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 191, 185, 185),
      appBar: AppBar(
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
            "Book Name",
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
          subtitle: const Text(
            "Add Member, Book Activity etc",
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
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.picture_as_pdf_outlined,
              color: Colors.blue[900],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SearchView()));
            },
            child: Container(
              margin: const EdgeInsets.only(top: 3, bottom: 2),
              decoration: const BoxDecoration(
                border: Border.symmetric(),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.blue[900],
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  const Text("Search by remark or amount")
                ],
              ),
            ),
          ),
          Row(
            children: const [
              //sort
              //Select Date
              //Entry Type
            ],
          ),
          spacer(5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Container(
                    // padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Net Balance",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          "2100",
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Total
                      Column(
                        children: [
                          Text(
                            "Total In (+)",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            "Total Out (-)",
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                      //2100
                      Column(
                        children: [
                          Text(
                            "Total In (+)",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Text(
                            "Total Out (-)",
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
