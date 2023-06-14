class Transaction3 {
  int? refCode;
  int? recType;
  String? method;
  String? vchCode;
  DateTime? dueDate;
  String? status;
  String? type;

  Transaction3({
    this.refCode,
    this.recType,
    this.method,
    this.vchCode,
    this.dueDate,
    this.status,
    this.type,
  });

  factory Transaction3.fromXmlString(String xmlString) {
    final regex = RegExp(r'<(\w+)>(.*?)<\/\w+>');
    final matches = regex.allMatches(xmlString);

    final map = <String, dynamic>{};
    for (final match in matches) {
      final key = match.group(1);
      final value = match.group(2);
      if (key != null) map[key] = value;
    }

    return Transaction3.fromMap(map);
  }

  String toXmlString() {
    final buffer = StringBuffer();
    buffer.write('<Transaction3>');
    buffer.write('<RefCode>$refCode</RefCode>');
    buffer.write('<RecType>$recType</RecType>');
    buffer.write('<Method>$method</Method>');
    buffer.write('<VchCode>$vchCode</VchCode>');
    buffer.write('<DueDate>$dueDate</DueDate>');
    buffer.write('<Status>$status</Status>');
    buffer.write('<Type>$type</Type>');
    buffer.write('</Transaction3>');
    return buffer.toString();
  }

  factory Transaction3.fromMap(Map<String, dynamic> map) {
    return Transaction3(
      refCode: map['RefCode'],
      recType: map['RecType'],
      method: map['Method'],
      vchCode: map['VchCode'],
      dueDate: DateTime.parse(map['DueDate']),
      status: map['Status'],
      type: map['Type'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'RefCode': refCode,
      'RecType': recType,
      'Method': method,
      'VchCode': vchCode,
      'DueDate': dueDate,
      'Status': status,
      'Type': type,
    };
  }
}
