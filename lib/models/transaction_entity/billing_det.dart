class BillingDet {
  String? vchCode;
  String? partyName;
  String? address1;

  BillingDet({
    this.vchCode,
    this.partyName,
    this.address1,
  });

  factory BillingDet.fromXmlString(String xmlString) {
    final regex = RegExp(r'<(\w+)>(.*?)<\/\w+>');
    final matches = regex.allMatches(xmlString);

    final map = <String, dynamic>{};
    for (final match in matches) {
      final key = match.group(1);
      final value = match.group(2);
      if (key != null) map[key] = value;
    }

    return BillingDet.fromMap(map);
  }

  String toXmlString() {
    final buffer = StringBuffer();
    buffer.write('<BillingDet>');
    buffer.write('<VchCode>$vchCode</VchCode>');
    buffer.write('<PartName>$partyName</PartyName>');
    buffer.write('<Address1>$address1</Address1>');

    buffer.write('</BillingDet>');
    return buffer.toString();
  }

  factory BillingDet.fromMap(Map<String, dynamic> map) {
    return BillingDet(
      vchCode: map['VchCode'],
      partyName: map['PartyName'],
      address1: map['Address1'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'VchCode': vchCode,
      'PartyName': partyName,
      'Address1': address1,
    };
  }
}
