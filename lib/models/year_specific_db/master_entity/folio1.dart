class Folio1 {
  int? code;
  Map<String, dynamic>? d1_150;

  Folio1({
    this.code,
    this.d1_150,
  });

  factory Folio1.fromXmlString(String xmlString) {
    final regex = RegExp(r'<(\w+)>(.*?)<\/\w+>');
    final matches = regex.allMatches(xmlString);

    final map = <String, dynamic>{};
    for (final match in matches) {
      final key = match.group(1);
      final value = match.group(2);
      if (key != null) map[key] = value;
    }

    return Folio1.fromMap(map);
  }

  String toXmlString() {
    final buffer = StringBuffer();
    buffer.write('<Folio1>');
    buffer.write('<Code>$code</Code>');
    buffer.write('<D1_150>$d1_150</D1_150>');

    buffer.write('</Folio1>');
    return buffer.toString();
  }

  factory Folio1.fromMap(Map<String, dynamic> map) {
    return Folio1(
      code: map['Code'],
      d1_150: map['D1_150'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Code': code,
      'D1_150': d1_150,
    };
  }
}
