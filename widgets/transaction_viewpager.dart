import 'package:flutter/material.dart';
import 'package:nagad_clone/database/data_lists.dart';
import 'package:nagad_clone/models/transactions.dart';
import 'package:nagad_clone/widgets/transactions_all_widget.dart';

class TransactionViewpager extends StatefulWidget {
  TransactionViewpager(this.transactionsYear);
  TransactionsYear transactionsYear;

  @override
  State<TransactionViewpager> createState() => _TransactionViewpagerState();
}

class _TransactionViewpagerState extends State<TransactionViewpager> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const TabBar(
          labelColor: Colors.deepOrange,
          unselectedLabelColor: Colors.black87,
          indicatorColor: Colors.deepOrange,
          tabs: [
            Tab(
              text: "ALL",
            ),
            Tab(
              text: "IN",
            ),
            Tab(
              text: "OUT",
            ),
          ],
        ),
        body: TabBarView(
          children: [
            TransactionAllWidget(
              list: allTransactionList,
              transactionsYear: widget.transactionsYear,
            ),
            TransactionAllWidget(
              list: inTransactionList,
              transactionsYear: widget.transactionsYear,
            ),
            TransactionAllWidget(
              list: outTransactionList,
              transactionsYear: widget.transactionsYear,
            ),
          ],
        ),
      ),
    );
  }
}
