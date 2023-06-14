class MasterAddressInfo {
  int? masterCode;
  String? address1;
  String? address2;
  String? cst;
  String? lst;
  String? tinNo;

  MasterAddressInfo({
    this.masterCode,
    this.address1,
    this.address2,
    this.cst,
    this.lst,
    this.tinNo,
  });

  factory MasterAddressInfo.fromXmlString(String xmlString) {
    final regex = RegExp(r'<(\w+)>(.*?)<\/\w+>');
    final matches = regex.allMatches(xmlString);

    final map = <String, dynamic>{};
    for (final match in matches) {
      final key = match.group(1);
      final value = match.group(2);
      if (key != null) map[key] = value;
    }

    return MasterAddressInfo.fromMap(map);
  }

  String toXmlString() {
    final buffer = StringBuffer();
    buffer.write('<MasterAddressInfo>');
    buffer.write('<masterCode>$masterCode</masterCode>');
    buffer.write('<address1>$address1</address1>');
    buffer.write('<address2>$address2</address2>');
    buffer.write('<cst>$cst</cst>');
    buffer.write('<lst>$lst</lst>');
    buffer.write('<tinNo>$tinNo</tinNo>');
    buffer.write('</MasterAddressInfo>');
    return buffer.toString();
  }

  factory MasterAddressInfo.fromMap(Map<String, dynamic> map) {
    return MasterAddressInfo(
      masterCode: map['MasterCode'],
      address1: map['Address1'],
      address2: map['Address2'],
      cst: map['Cst'],
      lst: map['Lst'],
      tinNo: map['TinNo'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'MasterCode': masterCode,
      'Address1': address1,
      'Address2': address2,
      'Cst': cst,
      'Lst': lst,
      'TinNo': tinNo,
    };
  }
}
