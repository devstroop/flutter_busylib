class Transaction5 {
  String? masterCode1;
  String? tranType;
  String? shortNar;

  Transaction5({
    this.masterCode1,
    this.tranType,
    this.shortNar,
  });

  factory Transaction5.fromXmlString(String xmlString) {
    final regex = RegExp(r'<(\w+)>(.*?)<\/\w+>');
    final matches = regex.allMatches(xmlString);

    final map = <String, dynamic>{};
    for (final match in matches) {
      final key = match.group(1);
      final value = match.group(2);
      if (key != null) map[key] = value;
    }

    return Transaction5.fromMap(map);
  }

  String toXmlString() {
    final buffer = StringBuffer();
    buffer.write('<Transaction5>');
    buffer.write('<MasterCode1>$masterCode1</MasterCode1>');
    buffer.write('<TranType>$tranType</TranType>');
    buffer.write('<ShortNar>$shortNar</ShortNar>');
    buffer.write('</Transaction5>');
    return buffer.toString();
  }


  factory Transaction5.fromMap(Map<String, dynamic> map) {
    return Transaction5(
      masterCode1: map['MasterCode1'],
      tranType: map['TranType'],
      shortNar: map['ShortNar'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'MasterCode1': masterCode1,
      'TranType': tranType,
      'ShortNar': shortNar,
    };
  }
}
