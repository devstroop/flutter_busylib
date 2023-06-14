class MasterSupport {
  int? masterCode;
  String? date;
  String? masterType;
  String? cm1_2;

  MasterSupport({
    this.masterCode,
    this.date,
    this.masterType,
    this.cm1_2,
  });

  factory MasterSupport.fromXmlString(String xmlString) {
    final regex = RegExp(r'<(\w+)>(.*?)<\/\w+>');
    final matches = regex.allMatches(xmlString);

    final map = <String, dynamic>{};
    for (final match in matches) {
      final key = match.group(1);
      final value = match.group(2);
      if (key != null) map[key] = value;
    }

    return MasterSupport.fromMap(map);
  }

  String toXmlString() {
    final buffer = StringBuffer();
    buffer.write('<MasterSupport>');
    buffer.write('<masterCode>$masterCode</masterCode>');
    buffer.write('<Date>$date</Date>');
    buffer.write('<MasterType>$masterType</MasterType>');
    buffer.write('<MasterType>$masterType</MasterType>');
    buffer.write('</MasterSupport>');
    return buffer.toString();
  }

  factory MasterSupport.fromMap(Map<String, dynamic> map) {
    return MasterSupport(
      masterCode: map['MasterCode'],
      date: map['Date'],
      masterType: map['MasterType'],
      cm1_2: map['Cm1_2'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'MasterCode': masterCode,
      'Date': date,
      'MasterType': masterType,
      'Cm1_2': cm1_2,
    };
  }
}
