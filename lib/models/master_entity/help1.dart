class Help1 {
  int? recType;
  String? nameAlias;
  int? code;
  int? nameOrAlias;

  Help1({
    this.recType,
    this.nameAlias,
    this.code,
    this.nameOrAlias,
  });

  factory Help1.fromXmlString(String xmlString) {
    final regex = RegExp(r'<(\w+)>(.*?)<\/\w+>');
    final matches = regex.allMatches(xmlString);

    final map = <String, dynamic>{};
    for (final match in matches) {
      final key = match.group(1);
      final value = match.group(2);
      if (key != null) map[key] = value;
    }

    return Help1.fromMap(map);
  }

  String toXmlString() {
    final buffer = StringBuffer();
    buffer.write('<Help1>');
    buffer.write('<RecType>$recType</RecType>');
    buffer.write('<NameAlias>$nameAlias</NameAlias>');
    buffer.write('<Code>$code</Code>');
    buffer.write('<NameOrAlias>$nameOrAlias</NameOrAlias>');
    buffer.write('</Help1>');
    return buffer.toString();
  }

  factory Help1.fromMap(Map<String, dynamic> map) {
    return Help1(
        recType: map['RecType'],
        nameAlias: map['NameAlias'],
        code: map['Code'],
        nameOrAlias: map['NameOrAlias']);
  }

  Map<String, dynamic> toMap() {
    return {
      'RecType': recType,
      'NameAlias': nameAlias,
      'Code': code,
      'NameOrAlias': nameAlias,
    };
  }
}
