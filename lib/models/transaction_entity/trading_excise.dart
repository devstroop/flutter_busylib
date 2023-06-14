class TradingExcise {
  String? method;
  String? vchNo;
  String? itemCode;
  double? assValue;
  double? dutyRate;
  String? dutyType;

  TradingExcise({
    this.method,
    this.vchNo,
    this.itemCode,
    this.assValue,
    this.dutyRate,
    this.dutyType,
  });

  factory TradingExcise.fromXmlString(String xmlString) {
    final regex = RegExp(r'<(\w+)>(.*?)<\/\w+>');
    final matches = regex.allMatches(xmlString);

    final map = <String, dynamic>{};
    for (final match in matches) {
      final key = match.group(1);
      final value = match.group(2);
      if (key != null) map[key] = value;
    }

    return TradingExcise.fromMap(map);
  }

  String toXmlString() {
    final buffer = StringBuffer();
    buffer.write('<TradingExcise>');
    buffer.write('<Method>$method</Method>');
    buffer.write('<VchNo>$vchNo</VchNo>');
    buffer.write('<ItemCode>$itemCode</ItemCode>');
    buffer.write('<AssValue>$assValue</AssValue>');
    buffer.write('<DutyRate>$dutyRate</DutyRate>');
    buffer.write('<DutyType>$dutyType</DutyType>');
    buffer.write('</TradingExcise>');
    return buffer.toString();
  }

  factory TradingExcise.fromMap(Map<String, dynamic> map) {
    return TradingExcise(
      method: map['Method'],
      vchNo: map['VchNo'],
      itemCode: map['ItemCode'],
      assValue: map['AssValue'] != null
          ? double.parse(map['AssValue'].toString())
          : null,
      dutyRate: map['DutyRate'] != null
          ? double.parse(map['DutyRate'].toString())
          : null,
      dutyType: map['DutyType'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Method': method,
      'VchNo': vchNo,
      'ItemCode': itemCode,
      'AssValue': assValue,
      'DutyRate': dutyRate,
      'DutyType': dutyType,
    };
  }
}
