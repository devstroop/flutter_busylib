class StdNar {
  String? vchType;
  String? nar1;
  String? nar2;

  StdNar({
    this.vchType,
    this.nar1,
    this.nar2,
  });

  factory StdNar.fromXmlString(String xmlString) {
    final regex = RegExp(r'<(\w+)>(.*?)<\/\w+>');
    final matches = regex.allMatches(xmlString);

    final map = <String, dynamic>{};
    for (final match in matches) {
      final key = match.group(1);
      final value = match.group(2);
      if (key != null) map[key] = value;
    }

    return StdNar.fromMap(map);
  }

  String toXmlString() {
    final buffer = StringBuffer();
    buffer.write('<StdNar>');
    buffer.write('<VchType>$vchType</VchType>');
    buffer.write('<Nar1>$nar1</Nar1>');
    buffer.write('<Nar2>$nar2</Nar2>');
    buffer.write('</StdNar>');
    return buffer.toString();
  }

  factory StdNar.fromMap(Map<String, dynamic> map) {
    return StdNar(
      vchType: map['VchType'],
      nar1: map['Nar1'],
      nar2: map['Nar2'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'VchType': vchType,
      'Nar1': nar1,
      'Nar2': nar2,
    };
  }
}
