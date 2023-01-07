class Transactions {
  final String tId;
  final String tIcon;
  final String tTitle;
  final String tBody;
  final String tTime;
  final String tAmt;
  final String tAmtIcon;
  final String tType;
  final TransactionsYear year;

  Transactions({
    required this.tId,
    required this.tIcon,
    required this.tTitle,
    required this.tBody,
    required this.tTime,
    required this.tAmt,
    required this.tAmtIcon,
    required this.tType,
    required this.year,
  });
}

enum TransactionsYear {
  JANUARY,
  FEBRUARY,
  MARCH,
  APRIL,
  MAY,
  JUNE,
  JULY,
  AUGUST,
  SEPTEMBER,
  OCTOBER,
  NOVEMBER,
  DECEMBER,
}
