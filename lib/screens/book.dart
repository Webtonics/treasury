import 'package:flutter/material.dart';
import 'package:treasury/screens/hover/add_transaction.dart';
import 'package:treasury/widgets/page/transactions.dart';

import '../widgets/search_view.dart';

class BookView extends StatefulWidget {
  const BookView({super.key, required this.book});
  final String book;
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
      backgroundColor: const Color.fromARGB(255, 227, 224, 224),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
        backgroundColor: Colors.white,
        // title:
        title: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black54),
              borderRadius: BorderRadius.circular(7.0),
            ),
            child: const Icon(
              Icons.house,
              shadows: [],
            ),
          ),
          title: Text(
            widget.book,
            style: const TextStyle(color: Colors.black, fontSize: 17),
          ),
          subtitle: const Text(
            "Add Book Activity ",
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //Section 1
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

          //Section 2
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //sort
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.sort,
                    color: Colors.blue[900],
                  ),
                ),
                //Select Date
                Card(
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(3)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.calendar_month_rounded),
                        Text("Select Date"),
                        Icon(Icons.arrow_drop_down_outlined)
                      ],
                    ),
                  ),
                ),
                //Entry Type
                Card(
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(3)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        // Icon(Icons.calendar_month_rounded),
                        Text("Entry Type"),
                        Icon(Icons.arrow_drop_down_outlined)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          spacer(5),

          //Section 3

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.black26))),
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
                          style: Theme.of(context).textTheme.titleMedium,
                        )
                      ],
                    ),
                  ),
                  spacer(4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Total
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total In (+)",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          spacer(4),
                          Text(
                            "Total Out (-)",
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                      //2100
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total In (+)",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          spacer(4),
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
          ),
          spacer(8),

          //Section 4:Transactions
          Expanded(
            child: ListView.builder(
                itemCount: 14,
                itemBuilder: (context, index) {
                  return Column(
                    children: const [
                      TransactionView(
                          date: '09 June 2023',
                          type: 'Income',
                          name: 'Omeje Charity',
                          amount: '700',
                          balance: '2100',
                          entryTime: '1:57'),
                      TransactionView(
                          date: '10 June 2023',
                          type: 'Income',
                          name: 'Felix',
                          amount: '1200',
                          balance: '3300',
                          entryTime: '6:37')
                    ],
                  );
                }),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.all(8),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // add button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InTransactions(
                      bookname: widget.book.toString(),
                    ),
                  ),
                );
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) {}));
              },
              icon: const Icon(Icons.add),
              label: const Text("income"),
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.minPositive, 50),
                  maximumSize: const Size(double.infinity, 50)),
            ),

            //remove button
            ElevatedButton.icon(
              onPressed: () async {
                // await _db.addUser(uid, email, displayName);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OutTransactions(
                      bookname: widget.book.toString(),
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.remove),
              label: const Text("Expense"),
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.minPositive, 50),
                  maximumSize: const Size(double.infinity, 50)),
            ),
          ],
        ),
      ),
    );
  }
}

class InTransactions extends StatelessWidget {
  const InTransactions({super.key, required this.bookname});

  final String bookname;

  @override
  Widget build(BuildContext context) {
    return AddTransaction(
      appBarTitle: 'Add Cash in Entry',
      bookName: bookname,
    );
  }
}

class OutTransactions extends StatelessWidget {
  const OutTransactions({super.key, required this.bookname});
  final String bookname;

  @override
  Widget build(BuildContext context) {
    return AddTransaction(
      appBarTitle: 'Remove Cash from Entry',
      bookName: bookname,
    );
  }
}
