class Transaction1 {
  String? vchCode;
  String? vchType;
  DateTime? date;
  String? vchNo;
  String? vchSeriesCode;
  String? autoVchNo;
  bool? external;
  String? createdBy;
  DateTime? creationTime;
  String? authorizedBy;
  DateTime? authorizationTime;
  String? modifiedBy;
  DateTime? modificationTime;

  Transaction1({
    this.vchCode,
    this.vchType,
    this.date,
    this.vchNo,
    this.vchSeriesCode,
    this.autoVchNo,
    this.external,
    this.createdBy,
    this.creationTime,
    this.authorizedBy,
    this.authorizationTime,
    this.modifiedBy,
    this.modificationTime,
  });

  factory Transaction1.fromXmlString(String xmlString) {
    final regex = RegExp(r'<(\w+)>(.*?)<\/\w+>');
    final matches = regex.allMatches(xmlString);

    final map = <String, dynamic>{};
    for (final match in matches) {
      final key = match.group(1);
      final value = match.group(2);
      if (key != null) map[key] = value;
    }

    return Transaction1.fromMap(map);
  }

  String toXmlString() {
    final buffer = StringBuffer();
    buffer.write('<Transaction1>');
    buffer.write('<VchCode>$vchCode</VchCode>');
    buffer.write('<VchType>$vchType</VchType>');
    buffer.write('<Date>$date</Date>');
    buffer.write('<VchNo>$vchNo</VchNo>');
    buffer.write('<VchSeriesCode>$vchSeriesCode</VchSeriesCode>');
    buffer.write('<AutoVchNo>$autoVchNo</AutoVchNo>');
    buffer.write('<External>$external</External>');
    buffer.write('<CreatedBy>$createdBy</CreatedBy>');
    buffer.write('<CreationTime>$creationTime</CreationTime>');
    buffer.write('<AuthorizedBy>$authorizedBy</AuthorizedBy>');
    buffer.write('<AuthorizationTime>$authorizationTime</AuthorizationTime>');
    buffer.write('<ModifiedBy>$modifiedBy</ModifiedBy>');
    buffer.write('<ModificationTime>$modificationTime</ModificationTime>');
    buffer.write('</Transaction1>');
    return buffer.toString();
  }

  factory Transaction1.fromMap(Map<String, dynamic> map) {
    return Transaction1(
      vchCode: map['VchCode'],
      vchType: map['VchType'],
      date: DateTime.parse(map['Date']),
      vchNo: map['VchNo'],
      vchSeriesCode: map['VchSeriesCode'],
      autoVchNo: map['AutoVchNo'],
      external: map['External'],
      createdBy: map['CreatedBy'],
      creationTime: DateTime.parse(map['CreationTime']),
      authorizedBy: map['AuthorizedBy'],
      authorizationTime: DateTime.parse(map['AuthorizationTime']),
      modifiedBy: map['ModifiedBy'],
      modificationTime: DateTime.parse(map['ModificationTime']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'VchCode': vchCode,
      'VchType': vchType,
      'Date': date,
      'VchNo': vchNo,
      'VchSeriesCode': vchSeriesCode,
      'AutoVchNo': autoVchNo,
      'External': external,
      'CreatedBy': createdBy,
      'CreationTime': creationTime,
      'AuthorizedBy': authorizedBy,
      'AuthorizationTime': authorizationTime,
      'ModifiedBy': modifiedBy,
      'ModificationTime': modificationTime,
    };
  }
}
