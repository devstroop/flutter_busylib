class UserLog {
  String? computerName;
  String? busyUserName;
  String? date;

  UserLog({
    this.computerName,
    this.busyUserName,
    this.date,
  });

  factory UserLog.fromXmlString(String xmlString) {
    final regex = RegExp(r'<(\w+)>(.*?)<\/\w+>');
    final matches = regex.allMatches(xmlString);

    final map = <String, dynamic>{};
    for (final match in matches) {
      final key = match.group(1);
      final value = match.group(2);
      if (key != null) map[key] = value;
    }

    return UserLog.fromMap(map);
  }

  String toXmlString() {
    final buffer = StringBuffer();
    buffer.write('<UserLog>');
    buffer.write('<ComputerName>$computerName</ComputerName>');
    buffer.write('<BUSYUserName>$busyUserName</BUSYUserName>');
    buffer.write('<Date>$date</Date>');
    buffer.write('</UserLog>');
    return buffer.toString();
  }

  factory UserLog.fromMap(Map<String, dynamic> map) {
    return UserLog(
      computerName: map['ComputerName'],
      busyUserName: map['BUSYUserName'],
      date: map['Date'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ComputerName': computerName,
      'BUSYUserName': busyUserName,
      'Date': date,
    };
  }
}
