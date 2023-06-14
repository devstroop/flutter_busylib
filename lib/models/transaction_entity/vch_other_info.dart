class VchOtherInfo {
  String? transport;
  String? station;
  String? form31No;
  bool? form31Issued;
  DateTime? goodsRemovalTime;

  VchOtherInfo({
    this.transport,
    this.station,
    this.form31No,
    this.form31Issued,
    this.goodsRemovalTime,
  });

  factory VchOtherInfo.fromXmlString(String xmlString) {
    final regex = RegExp(r'<(\w+)>(.*?)<\/\w+>');
    final matches = regex.allMatches(xmlString);

    final map = <String, dynamic>{};
    for (final match in matches) {
      final key = match.group(1);
      final value = match.group(2);
      if (key != null) map[key] = value;
    }

    return VchOtherInfo.fromMap(map);
  }

  String toXmlString() {
    final buffer = StringBuffer();
    buffer.write('<VchOtherInfo>');
    buffer.write('<Transport>$transport</Transport>');
    buffer.write('<Station>$station</Station>');
    buffer.write('<Form31No>$form31No</Form31No>');
    buffer.write('<Form31Issued>$form31Issued</Form31Issued>');
    buffer.write('<GoodsRemovalTime>$goodsRemovalTime</GoodsRemovalTime>');
    buffer.write('</VchOtherInfo>');
    return buffer.toString();
  }

  factory VchOtherInfo.fromMap(Map<String, dynamic> map) {
    return VchOtherInfo(
      transport: map['Transport'],
      station: map['Station'],
      form31No: map['Form31No'],
      form31Issued: map['Form31Issued'],
      goodsRemovalTime: map['GoodsRemovalTime'] != null
          ? DateTime.parse(map['GoodsRemovalTime'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Transport': transport,
      'Station': station,
      'Form31No': form31No,
      'Form31Issued': form31Issued,
      'GoodsRemovalTime': goodsRemovalTime,
    };
  }
}
