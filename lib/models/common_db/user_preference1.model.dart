class UserPreference1 {
  String? name;
  String? c1;

  UserPreference1({
    this.name,
    this.c1,
  });

  factory UserPreference1.fromXmlString(String xmlString) {
    final regex = RegExp(r'<(\w+)>(.*?)<\/\w+>');
    final matches = regex.allMatches(xmlString);

    final map = <String, dynamic>{};
    for (final match in matches) {
      final key = match.group(1);
      final value = match.group(2);
      if (key != null) map[key] = value;
    }

    return UserPreference1.fromMap(map);
  }

  String toXmlString() {
    final buffer = StringBuffer();
    buffer.write('<UserPreference1>');
    buffer.write('<Name>$name</Name>');
    buffer.write('<C1>$c1</C1>');
    buffer.write('</UserPreference1>');
    return buffer.toString();
  }

  factory UserPreference1.fromMap(Map<String, dynamic> map) {
    return UserPreference1(
      name: map['Name'],
      c1: map['C1'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Name': name,
      'C1': c1,
    };
  }
}
