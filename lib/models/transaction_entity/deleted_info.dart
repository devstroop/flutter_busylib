class DeletedInfo {
  String? identity;
  String? deletedBy;
  DateTime? deletionTime;

  DeletedInfo({
    this.identity,
    this.deletedBy,
    this.deletionTime,
  });

  factory DeletedInfo.fromXmlString(String xmlString) {
    final regex = RegExp(r'<(\w+)>(.*?)<\/\w+>');
    final matches = regex.allMatches(xmlString);

    final map = <String, dynamic>{};
    for (final match in matches) {
      final key = match.group(1);
      final value = match.group(2);
      if (key != null) map[key] = value;
    }

    return DeletedInfo.fromMap(map);
  }

  String toXmlString() {
    final buffer = StringBuffer();
    buffer.write('<DeletedInfo>');
    buffer.write('<Identity>$identity</Identity>');
    buffer.write('<DeletedBy>$deletedBy</DeletedBy>');
    buffer.write('<DeletionTime>$deletionTime</DeletionTime>');
    buffer.write('</DeletedInfo>');
    return buffer.toString();
  }

  factory DeletedInfo.fromMap(Map<String, dynamic> map) {
    return DeletedInfo(
      identity: map['Identity'],
      deletedBy: map['DeletedBy'],
      deletionTime: map['DeletionTime'] != null
          ? DateTime.parse(map['DeletionTime'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Identity': identity,
      'DeletedBy': deletedBy,
      'DeletionTime': deletionTime?.toString(),
    };
  }
}
