class Transaction8 {
  DateTime? formRecDate;
  String? formNo;
  String? autoVchNo;
  String? createdBy;
  DateTime? creationTime;
  String? authorizedBy;
  DateTime? authorizationDate;
  String? modifiedBy;
  DateTime? modificationTime;

  Transaction8({
    this.formRecDate,
    this.formNo,
    this.autoVchNo,
    this.createdBy,
    this.creationTime,
    this.authorizedBy,
    this.authorizationDate,
    this.modifiedBy,
    this.modificationTime,
  });

  factory Transaction8.fromXmlString(String xmlString) {
    final regex = RegExp(r'<(\w+)>(.*?)<\/\w+>');
    final matches = regex.allMatches(xmlString);

    final map = <String, dynamic>{};
    for (final match in matches) {
      final key = match.group(1);
      final value = match.group(2);
      if (key != null) map[key] = value;
    }

    return Transaction8.fromMap(map);
  }

  String toXmlString() {
    final buffer = StringBuffer();
    buffer.write('<Transaction8>');
    buffer.write('<FormRecDate>$formRecDate</FormRecDate>');
    buffer.write('<FormNo>$formNo</FormNo>');
    buffer.write('<AutoVchNo>$autoVchNo</AutoVchNo>');
    buffer.write('<CreatedBy>$createdBy</CreatedBy>');
    buffer.write('<CreationTime>$creationTime</CreationTime>');
    buffer.write('<AuthorizedBy>$authorizedBy</AuthorizedBy>');
    buffer.write('<AuthorizationDate>$authorizationDate</AuthorizationDate>');
    buffer.write('<ModifiedBy>$modifiedBy</ModifiedBy>');
    buffer.write('<ModificationTime>$modificationTime</ModificationTime>');
    buffer.write('</Transaction8>');
    return buffer.toString();
  }

  factory Transaction8.fromMap(Map<String, dynamic> map) {
    return Transaction8(
      formRecDate: map['FormRecDate'] != null
          ? DateTime.parse(map['FormRecDate'])
          : null,
      formNo: map['FormNo'],
      autoVchNo: map['AutoVchNo'],
      createdBy: map['CreatedBy'],
      creationTime: map['CreationTime'] != null
          ? DateTime.parse(map['CreationTime'])
          : null,
      authorizedBy: map['AuthorizedBy'],
      authorizationDate: map['AuthorizationDate'] != null
          ? DateTime.parse(map['AuthorizationDate'])
          : null,
      modifiedBy: map['ModifiedBy'],
      modificationTime: map['ModificationTime'] != null
          ? DateTime.parse(map['ModificationTime'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'FormRecDate': formRecDate?.toIso8601String(),
      'FormNo': formNo,
      'AutoVchNo': autoVchNo,
      'CreatedBy': createdBy,
      'CreationTime': creationTime?.toIso8601String(),
      'AuthorizedBy': authorizedBy,
      'AuthorizationDate': authorizationDate?.toIso8601String(),
      'ModifiedBy': modifiedBy,
      'ModificationTime': modificationTime?.toIso8601String(),
    };
  }
}
