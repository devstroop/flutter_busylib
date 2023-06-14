class Help2 {
  String? recType1;
  String? recType2;
  String? recType3;
  String? name;

  Help2({
    this.recType1,
    this.recType2,
    this.recType3,
    this.name,
  });

  factory Help2.fromXmlString(String xmlString) {
    final regex = RegExp(r'<(\w+)>(.*?)<\/\w+>');
    final matches = regex.allMatches(xmlString);

    final map = <String, dynamic>{};
    for (final match in matches) {
      final key = match.group(1);
      final value = match.group(2);
      if (key != null) map[key] = value;
    }

    return Help2.fromMap(map);
  }

  String toXmlString() {
    final buffer = StringBuffer();
    buffer.write('<Help2>');
    buffer.write('<RecType1>$recType1</RecType1>');
    buffer.write('<RecType2>$recType2</RecType2>');
    buffer.write('<RecType3>$recType3</RecType3>');
    buffer.write('<Name>$name</Name>');
    buffer.write('</Help2>');
    return buffer.toString();
  }

  factory Help2.fromMap(Map<String, dynamic> map) {
    return Help2(
      recType1: map['RecType1'],
      recType2: map['RecType2'],
      recType3: map['RecType3'],
      name: map['Name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'RecType1': recType1,
      'RecType2': recType2,
      'RecType3': recType3,
      'Name': name,
    };
  }
}
