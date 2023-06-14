class Transaction2 {
  int? recType;
  double? cashFlow;
  String? shortNar;
  String? clrDate;

  Transaction2({
    this.recType,
    this.cashFlow,
    this.shortNar,
    this.clrDate,
  });

  factory Transaction2.fromXmlString(String xmlString) {
    final regex = RegExp(r'<(\w+)>(.*?)<\/\w+>');
    final matches = regex.allMatches(xmlString);

    final map = <String, dynamic>{};
    for (final match in matches) {
      final key = match.group(1);
      final value = match.group(2);
      if (key != null) map[key] = value;
    }

    return Transaction2.fromMap(map);
  }

  String toXmlString() {
    final buffer = StringBuffer();
    buffer.write('<Transaction2>');
    buffer.write('<RecType>$recType</RecType>');
    buffer.write('<CashFlow>$cashFlow</CashFlow>');
    buffer.write('<ShortNar>$shortNar</ShortNar>');
    buffer.write('<ClrDate>$clrDate</ClrDate>');
    buffer.write('</Transaction2>');
    return buffer.toString();
  }

  factory Transaction2.fromMap(Map<String, dynamic> map) {
    return Transaction2(
      recType: map['RecType'],
      cashFlow: map['CashFlow'],
      shortNar: map['ShortNar'],
      clrDate: map['ClrDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'RecType': recType,
      'CashFlow': cashFlow,
      'ShortNar': shortNar,
      'ClrDate': clrDate,
    };
  }
}
