class VatInfo {
  DateTime? date;
  double? amount;
  String? recType;
  int? srNo;

  VatInfo({
    this.date,
    this.amount,
    this.recType,
    this.srNo,
  });

  factory VatInfo.fromXmlString(String xmlString) {
    final regex = RegExp(r'<(\w+)>(.*?)<\/\w+>');
    final matches = regex.allMatches(xmlString);

    final map = <String, dynamic>{};
    for (final match in matches) {
      final key = match.group(1);
      final value = match.group(2);
      if (key != null) map[key] = value;
    }

    return VatInfo.fromMap(map);
  }

  String toXmlString() {
    final buffer = StringBuffer();
    buffer.write('<VatInfo>');
    buffer.write('<Date>$date</Date>');
    buffer.write('<Amount>$amount</Amount>');
    buffer.write('<RecType>$recType</RecType>');
    buffer.write('<SrNo>$srNo</SrNo>');
    buffer.write('</VatInfo>');
    return buffer.toString();
  }


  factory VatInfo.fromMap(Map<String, dynamic> map) {
    return VatInfo(
      date: map['Date'] != null ? DateTime.parse(map['Date']) : null,
      amount:
          map['Amount'] != null ? double.parse(map['Amount'].toString()) : null,
      recType: map['RecType'],
      srNo: map['SrNo'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Date': date,
      'Amount': amount,
      'RecType': recType,
      'SrNo': srNo,
    };
  }
}
