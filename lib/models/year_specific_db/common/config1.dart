class Config {
  String? recType;
  String? type;
  int? noOfFld;

  Config({
    this.recType,
    this.type,
    this.noOfFld,
  });

  factory Config.fromXmlString(String xmlString) {
    final regex = RegExp(r'<(\w+)>(.*?)<\/\w+>');
    final matches = regex.allMatches(xmlString);

    final map = <String, dynamic>{};
    for (final match in matches) {
      final key = match.group(1);
      final value = match.group(2);
      if (key != null) map[key] = value;
    }

    return Config.fromMap(map);
  }

  String toXmlString() {
    final buffer = StringBuffer();
    buffer.write('<Config>');
    buffer.write('<RecType>$recType</RecType>');
    buffer.write('<Type>$type</Type>');
    buffer.write('<NoOfFld>$noOfFld</NoOfFld>');
    buffer.write('</Config>');
    return buffer.toString();
  }


  factory Config.fromMap(Map<String, dynamic> map) {
    return Config(
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
