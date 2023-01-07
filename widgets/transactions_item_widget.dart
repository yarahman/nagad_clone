import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nagad_clone/models/transactions.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';

import '../styles/AppTheme.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Transactions item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //dialod
        YYAlertDialogWithDivider(context, item);
        //customDialod(context);
      },
      child: Card(
        margin: const EdgeInsets.fromLTRB(0.0, 3, 0.5, 0),
        elevation: 0.0,
        color: Colors.white60,
        child: Container(
          margin: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Image.asset(
                    item.tIcon,
                    height: 15,
                    width: 15,
                    fit: BoxFit.fitWidth,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                                    child: Text(
                                      item.tTitle,
                                      style: AppTheme.tTitleText,
                                      textAlign: TextAlign.start,
                                    ),
                                  )),
                              Image.asset(
                                getCurrencyIcon(item.tType),
                                height: 12,
                                width: 12,
                              ),
                              Text(
                                item.tAmt,
                                style: getStyle(item.tType),
                                textAlign: TextAlign.start,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                                    child: Text(
                                      item.tBody,
                                      style: AppTheme.nbodyText,
                                      textAlign: TextAlign.start,
                                    ),
                                  )),
                              Text(
                                item.tTime,
                                style: AppTheme.tTimeText,
                                textAlign: TextAlign.start,
                              )
                            ],
                          ),
                        ],
                      )),
                ],
              ),
              //Row(children: [Expanded(child: Padding(padding: const EdgeInsets.fromLTRB(0, 8, 0, 8), child: Text(item.nBody, style: AppTheme.nbodyText, textAlign: TextAlign.start,),))],)
            ],
          ),
        ),
      ),
    );
  }

  getStyle(String tType) {
    if (tType == "IN") {
      return AppTheme.inAmtText;
    } else {
      return AppTheme.outAmtText;
    }
  }

  String getCurrencyIcon(String tType) {
    if (tType == "IN") {
      return "assets/ic_transactions_in_taka.png";
    } else {
      return "assets/ic_transactions_out_taka.png";
    }
  }
}

// Popup Widget
YYDialog YYAlertDialogWithDivider(BuildContext context, Transactions item) {
  var yyDialog = YYDialog();

  return yyDialog.build(context)
    ..width = double.infinity
    ..margin = EdgeInsets.symmetric(horizontal: 40)
    ..borderRadius = 0
    ..widget(
      Padding(
          padding: EdgeInsets.all(0.0),
          child: Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/pop_up background.png"),
                  fit: BoxFit.cover),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: InkWell(
                        onTap: () {
                          yyDialog.dismiss();
                        },
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Image.asset(
                    'assets/takaa.png',
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  "${item.tTitle}",
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 21,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )),
    )
    ..text(
      padding: EdgeInsets.only(top: 10.0),
      alignment: Alignment.center,
      text: "Account Number",
      color: Color(0xff6b6a6a),
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
    )
    ..text(
      padding: EdgeInsets.only(top: 6.0),
      alignment: Alignment.center,
      text: "${item.tBody}",
      color: Color(0x73000000),
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    )
    ..text(
      padding: EdgeInsets.only(top: 10.0),
      alignment: Alignment.center,
      text: "Amount",
      color: Color(0xff6b6a6a),
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
    )
    ..text(
      padding: EdgeInsets.only(top: 6.0),
      alignment: Alignment.center,
      text: "${item.tAmt} TK.",
      color: Color(0x73000000),
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    )
    ..text(
      padding: EdgeInsets.only(top: 10.0),
      alignment: Alignment.center,
      text: "Transaction ID",
      color: Color(0xff6b6a6a),
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
    )
    ..text(
      padding: EdgeInsets.only(top: 6.0),
      alignment: Alignment.center,
      text: item.tId.toString(),
      color: Color(0x73000000),
      fontSize: 17.0,
      fontWeight: FontWeight.bold,
    )
    ..text(
      padding: EdgeInsets.only(top: 10.0),
      alignment: Alignment.center,
      text: "Date and Time",
      color: Color(0xff6b6a6a),
      fontSize: 13.0,
      fontWeight: FontWeight.normal,
    )
    ..text(
      padding: EdgeInsets.only(top: 6.0),
      alignment: Alignment.center,
      text: item.tTime,
      color: Color(0x73000000),
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    )
    ..widget(Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Row(
            children: [
              Image.asset(
                "assets/ic_phone.png",
                width: 16,
                height: 16,
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                "Call",
                style: TextStyle(
                    color: Color(0xff6b6a6a),
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Row(
            children: [
              Image.asset(
                "assets/ic_message.png",
                width: 16,
                height: 16,
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                "SMS",
                style: TextStyle(
                    color: Color(0xff6b6a6a),
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
        )
      ],
    ))
    ..show();
}

Widget customDialod(BuildContext context) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 32),
    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/profile_background.png"),
            ),
          ),
          color: Colors.deepOrange,
          height: 180,
          alignment: Alignment.center,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/ic_nagad.png',
                height: 80,
                width: 80,
              ),
              Text(
                "Cash Out",
                style: TextStyle(
                    color: Color(0xff6b6a6a),
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Account Number",
          style: TextStyle(
              color: Color(0xff6b6a6a),
              fontSize: 12,
              fontWeight: FontWeight.w200),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          "2222-22222",
          style: TextStyle(
              color: Color(0xff6b6a6a),
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Amount",
          style: TextStyle(
              color: Color(0xff6b6a6a),
              fontSize: 12,
              fontWeight: FontWeight.w200),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          "580 TK.",
          style: TextStyle(
              color: Color(0xff6b6a6a),
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Transaction ID",
          style: TextStyle(
              color: Color(0xff6b6a6a),
              fontSize: 12,
              fontWeight: FontWeight.w200),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          "2222-22222",
          style: TextStyle(
              color: Color(0xff6b6a6a),
              fontSize: 14,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Date and Time",
          style: TextStyle(
              color: Color(0xff6b6a6a),
              fontSize: 12,
              fontWeight: FontWeight.w200),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          "Yesterday, 04:19 PM",
          style: TextStyle(
              color: Color(0xff6b6a6a),
              fontSize: 15,
              fontWeight: FontWeight.w600),
        ),
        Row(
          children: [
            Container(
              child: Row(
                children: [
                  Image.asset(
                    "assets/ic_phone.png",
                    width: 24,
                    height: 24,
                  ),
                  Text(
                    "Call",
                    style: TextStyle(
                        color: Color(0xff6b6a6a),
                        fontSize: 15,
                        fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              child: Row(
                children: [
                  Image.asset(
                    "assets/ic_phone.png",
                    width: 24,
                    height: 24,
                  ),
                  Text(
                    "Call",
                    style: TextStyle(
                        color: Color(0xff6b6a6a),
                        fontSize: 15,
                        fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    ),
  );
}
