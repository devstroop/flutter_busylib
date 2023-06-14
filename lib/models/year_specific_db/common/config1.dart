class Config1 {
  String? recType;
  String? type;
  int? noOfFld;

  Config1({
    this.recType,
    this.type,
    this.noOfFld,
  });

  factory Config1.fromXmlString(String xmlString) {
    final regex = RegExp(r'<(\w+)>(.*?)<\/\w+>');
    final matches = regex.allMatches(xmlString);

    final map = <String, dynamic>{};
    for (final match in matches) {
      final key = match.group(1);
      final value = match.group(2);
      if (key != null) map[key] = value;
    }

    return Config1.fromMap(map);
  }

  String toXmlString() {
    final buffer = StringBuffer();
    buffer.write('<Config1>');
    buffer.write('<RecType>$recType</RecType>');
    buffer.write('<Type>$type</Type>');
    buffer.write('<NoOfFld>$noOfFld</NoOfFld>');
    buffer.write('</Config1>');
    return buffer.toString();
  }


  factory Config1.fromMap(Map<String, dynamic> map) {
    return Config1(
      recType: map['RecType'],
      type: map['Type'],
      noOfFld: map['NoOfFld'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'RecType': recType,
      'Type': type,
      'NoOfFld': noOfFld,
    };
  }
}
