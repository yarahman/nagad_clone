import 'package:flutter/material.dart';
import 'package:nagad_clone/models/transactions.dart';
import 'package:nagad_clone/styles/AppTheme.dart';
import 'package:nagad_clone/widgets/transaction_viewpager.dart';

class TransactionBody extends StatefulWidget {
  const TransactionBody({Key? key}) : super(key: key);

  @override
  State<TransactionBody> createState() => _TransactionBodyState();
}

class _TransactionBodyState extends State<TransactionBody> {
  List<String> yearName = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  int currentYearNameIndex = 0;

  TransactionsYear selectedYear() {
    if (currentYearNameIndex == 0) {
      return TransactionsYear.JANUARY;
    } else if (currentYearNameIndex == 1) {
      return TransactionsYear.FEBRUARY;
    } else if (currentYearNameIndex == 2) {
      return TransactionsYear.MARCH;
    } else if (currentYearNameIndex == 3) {
      return TransactionsYear.APRIL;
    } else if (currentYearNameIndex == 4) {
      return TransactionsYear.MAY;
    } else if (currentYearNameIndex == 5) {
      return TransactionsYear.JUNE;
    } else if (currentYearNameIndex == 6) {
      return TransactionsYear.JULY;
    } else if (currentYearNameIndex == 7) {
      return TransactionsYear.AUGUST;
    } else if (currentYearNameIndex == 8) {
      return TransactionsYear.SEPTEMBER;
    } else if (currentYearNameIndex == 9) {
      return TransactionsYear.OCTOBER;
    } else if (currentYearNameIndex == 10) {
      return TransactionsYear.NOVEMBER;
    } else if (currentYearNameIndex == 11) {
      return TransactionsYear.DECEMBER;
    }
    return TransactionsYear.JANUARY;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepOrange.shade600, Colors.red.shade800],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Transactions",
          style: AppTheme.actionBarText,
        ),
      ),
      body: Column(
        children: [
          Card(
            elevation: 1,
            margin: const EdgeInsets.all(09),
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (currentYearNameIndex > 0) {
                        setState(() {
                          currentYearNameIndex--;
                          selectedYear();
                        });
                      }
                    },
                    child: Icon(Icons.arrow_back_ios_new_sharp,
                        color: Colors.black, size: 19),
                  ),
                  Expanded(
                      child: Text(
                    "${yearName[currentYearNameIndex]} 2022", // change the year what you want
                    style: AppTheme.monthText,
                    textAlign: TextAlign.center,
                  )),
                  GestureDetector(
                    onTap: () {
                      if (currentYearNameIndex < 11) {
                        setState(() {
                          currentYearNameIndex++;
                          selectedYear();
                        });
                      }
                    },
                    child: Icon(Icons.arrow_forward_ios_sharp,
                        color: Colors.black, size: 19),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TransactionViewpager(
              selectedYear(),
            ),
          ),
        ],
      ),
    );
  }
}
