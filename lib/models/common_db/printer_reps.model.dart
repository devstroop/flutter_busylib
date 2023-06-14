class PrinterReps {
  String? repID;
  String? name;
  String? subRepID;
  String? scriptLine;
  int? srNo;

  PrinterReps({
    this.repID,
    this.name,
    this.subRepID,
    this.scriptLine,
    this.srNo,
  });

  factory PrinterReps.fromXmlString(String xmlString) {
    final regex = RegExp(r'<(\w+)>(.*?)<\/\w+>');
    final matches = regex.allMatches(xmlString);

    final map = <String, dynamic>{};
    for (final match in matches) {
      final key = match.group(1);
      final value = match.group(2);
      if (key != null) map[key] = value;
    }

    return PrinterReps.fromMap(map);
  }

  String toXmlString() {
    final buffer = StringBuffer();
    buffer.write('<PrinterReps>');
    buffer.write('<RepID>$repID</RepID>');
    buffer.write('<Name>$name</Name>');
    buffer.write('<SubRepID>$subRepID</SubRepID>');
    buffer.write('<ScriptLine>$scriptLine</ScriptLine>');
    buffer.write('<SrNo>$srNo</SrNo>');
    buffer.write('</PrinterReps>');
    return buffer.toString();
  }

  factory PrinterReps.fromMap(Map<String, dynamic> map) {
    return PrinterReps(
      repID: map['RepID'],
      name: map['Name'],
      subRepID: map['SubRepID'],
      scriptLine: map['ScriptLine'],
      srNo: map['SrNo'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'RepID': repID,
      'Name': name,
      'SubRepID': subRepID,
      'ScriptLine': scriptLine,
      'SrNo': srNo,
    };
  }
}
