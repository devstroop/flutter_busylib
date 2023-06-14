class OEDDet {
  double? oedRate;
  double? oedAmount;
  double? cessRate;
  double? cessAmount;

  OEDDet({
    this.oedRate,
    this.oedAmount,
    this.cessRate,
    this.cessAmount,
  });

  factory OEDDet.fromXmlString(String xmlString) {
    final regex = RegExp(r'<(\w+)>(.*?)<\/\w+>');
    final matches = regex.allMatches(xmlString);

    final map = <String, dynamic>{};
    for (final match in matches) {
      final key = match.group(1);
      final value = match.group(2);
      if (key != null) map[key] = value;
    }

    return OEDDet.fromMap(map);
  }

  String toXmlString() {
    final buffer = StringBuffer();
    buffer.write('<OEDDet>');
    buffer.write('<OEDRate>$oedRate</OEDRate>');
    buffer.write('<OEDAmount>$oedAmount</OEDAmount>');
    buffer.write('<CessRate>$cessRate</CessRate>');
    buffer.write('<CessAmount>$cessAmount</CessAmount>');
    buffer.write('</OEDDet>');
    return buffer.toString();
  }

  factory OEDDet.fromMap(Map<String, dynamic> map) {
    return OEDDet(
      oedRate: map['OEDRate'] != null
          ? double.parse(map['OEDRate'].toString())
          : null,
      oedAmount: map['OEDAmount'] != null
          ? double.parse(map['OEDAmount'].toString())
          : null,
      cessRate: map['CessRate'] != null
          ? double.parse(map['CessRate'].toString())
          : null,
      cessAmount: map['CessAmount'] != null
          ? double.parse(map['CessAmount'].toString())
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'OEDRate': oedRate,
      'OEDAmount': oedAmount,
      'CessRate': cessRate,
      'CessAmount': cessAmount,
    };
  }
}
