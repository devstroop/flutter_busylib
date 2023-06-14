class Transaction9 {
  int? srNo;
  DateTime? date;
  String? billCode;
  double? amount;

  Transaction9({
    this.srNo,
    this.date,
    this.billCode,
    this.amount,
  });

  factory Transaction9.fromXmlString(String xmlString) {
    final regex = RegExp(r'<(\w+)>(.*?)<\/\w+>');
    final matches = regex.allMatches(xmlString);

    final map = <String, dynamic>{};
    for (final match in matches) {
      final key = match.group(1);
      final value = match.group(2);
      if (key != null) map[key] = value;
    }

    return Transaction9.fromMap(map);
  }

  String toXmlString() {
    final buffer = StringBuffer();
    buffer.write('<Transaction9>');
    buffer.write('<SrNo>$srNo</SrNo>');
    buffer.write('<Date>$date</Date>');
    buffer.write('<BillCode>$billCode</BillCode>');
    buffer.write('<Amount>$amount</Amount>');
    buffer.write('</Transaction9>');
    return buffer.toString();
  }

  factory Transaction9.fromMap(Map<String, dynamic> map) {
    return Transaction9(
      srNo: map['SrNo'],
      date: DateTime.parse(map['Date']),
      billCode: map['BillCode'],
      amount: map['Amount'].toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'SrNo': srNo,
      'Date': date.toString(),
      'BillCode': billCode,
      'Amount': amount,
    };
  }
}
