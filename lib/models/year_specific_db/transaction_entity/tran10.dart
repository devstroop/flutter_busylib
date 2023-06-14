class Transaction10 {
  String? recType;
  String? masterCode1;
  String? masterCode2;

  Transaction10({
    this.recType,
    this.masterCode1,
    this.masterCode2,
  });

  factory Transaction10.fromXmlString(String xmlString) {
    final regex = RegExp(r'<(\w+)>(.*?)<\/\w+>');
    final matches = regex.allMatches(xmlString);

    final map = <String, dynamic>{};
    for (final match in matches) {
      final key = match.group(1);
      final value = match.group(2);
      if (key != null) map[key] = value;
    }

    return Transaction10.fromMap(map);
  }

  String toXmlString() {
    final buffer = StringBuffer();
    buffer.write('<Transaction10>');
    buffer.write('<RecType>$recType</RecType>');
    buffer.write('<MasterCode1>$masterCode1</MasterCode1>');
    buffer.write('<MasterCode2>$masterCode2</MasterCode2>');
    buffer.write('</Transaction10>');
    return buffer.toString();
  }

  factory Transaction10.fromMap(Map<String, dynamic> map) {
    return Transaction10(
      recType: map['RecType'],
      masterCode1: map['MasterCode1'],
      masterCode2: map['MasterCode2'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'RecType': recType,
      'MasterCode1': masterCode1,
      'MasterCode2': masterCode2,
    };
  }
}
