class Transaction4 {
  int? srNo;
  String? masterCode1;
  String? masterCode2;
  double? d1;
  double? d2;
  double? d3;

  Transaction4({
    this.srNo,
    this.masterCode1,
    this.masterCode2,
    this.d1,
    this.d2,
    this.d3,
  });

  factory Transaction4.fromXmlString(String xmlString) {
    final regex = RegExp(r'<(\w+)>(.*?)<\/\w+>');
    final matches = regex.allMatches(xmlString);

    final map = <String, dynamic>{};
    for (final match in matches) {
      final key = match.group(1);
      final value = match.group(2);
      if (key != null) map[key] = value;
    }

    return Transaction4.fromMap(map);
  }

  String toXmlString() {
    final buffer = StringBuffer();
    buffer.write('<Transaction4>');
    buffer.write('<SrNo>$srNo</SrNo>');
    buffer.write('<MasterCode1>$masterCode1</MasterCode1>');
    buffer.write('<MasterCode2>$masterCode2</MasterCode2>');
    buffer.write('<D1>$d1</D1>');
    buffer.write('<D2>$d2</D2>');
    buffer.write('<D3>$d3</D3>');

    buffer.write('</Transaction4>');
    return buffer.toString();
  }

  factory Transaction4.fromMap(Map<String, dynamic> map) {
    return Transaction4(
      srNo: map['SrNo'],
      masterCode1: map['MasterCode1'],
      masterCode2: map['MasterCode2'],
      d1: map['D1'],
      d2: map['D2'],
      d3: map['D3'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'SrNo': srNo,
      'MasterCode1': masterCode1,
      'MasterCode2': masterCode2,
      'D1': d1,
      'D2': d2,
      'D3': d3,
    };
  }
}
