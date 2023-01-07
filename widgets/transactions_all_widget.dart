import 'package:flutter/material.dart';
import 'package:nagad_clone/widgets/transactions_item_widget.dart';

import '../models/transactions.dart';

class TransactionAllWidget extends StatefulWidget {
  const TransactionAllWidget(
      {Key? key, required this.list, required this.transactionsYear})
      : super(key: key);

  final List<Transactions> list;
  final TransactionsYear transactionsYear;

  @override
  State<TransactionAllWidget> createState() => _TransactionAllWidgetState();
}

class _TransactionAllWidgetState extends State<TransactionAllWidget> {
  List<Transactions> getCurrentMonthItems() {
    List<Transactions> decemberTrans = [];
    for (var i = 0; i < widget.list.length; i++) {
      if (widget.list[i].year == widget.transactionsYear) {
        decemberTrans.add(widget.list[i]);
      }
    }
    return decemberTrans;
  }

  @override
  void initState() {
    getCurrentMonthItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(
            Duration(seconds: 1),
            () {
              setState(() {});
            },
          );
        },
        child: ListView.builder(
          // Let the ListView know how many items it needs to build.
          itemCount: getCurrentMonthItems().length,
          // Provide a builder function. This is where the magic happens.
          // Convert each item into a widget based on the type of item it is.
          itemBuilder: (context, index) {
            final item = getCurrentMonthItems()[index];
            return TransactionListItem(item: item);
          },
        ),
      ),
    );
  }
}
