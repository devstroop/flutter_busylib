class Master1 {
  int? code;
  String? masterType;
  String? name;
  String? alias;
  String? parentGrp;
  String? printName;
  int? stamp;
  String? creationDate;
  String? createdBy;
  String? modificationTime;
  String? modifiedBy;

  Master1({
    this.code,
    this.masterType,
    this.name,
    this.alias,
    this.parentGrp,
    this.printName,
    this.stamp,
    this.creationDate,
    this.createdBy,
    this.modificationTime,
    this.modifiedBy,
  });

  factory Master1.fromXmlString(String xmlString) {
    final regex = RegExp(r'<(\w+)>(.*?)<\/\w+>');
    final matches = regex.allMatches(xmlString);

    final map = <String, dynamic>{};
    for (final match in matches) {
      final key = match.group(1);
      final value = match.group(2);
      if (key != null) map[key] = value;
    }

    return Master1.fromMap(map);
  }

  String toXmlString() {
    final buffer = StringBuffer();
    buffer.write('<Master1>');
    buffer.write('<Code>$code</Code>');
    buffer.write('<MasterType>$masterType</MasterType>');
    buffer.write('<Name>$name</Name>');
    buffer.write('<Alias>$alias</Alias>');
    buffer.write('<ParentGrp>$parentGrp</ParentGrp>');
    buffer.write('<PrintName>$printName</PrintName>');
    buffer.write('<Stamp>$stamp</Stamp>');
    buffer.write('<CreationDate>$creationDate</CreationDate>');
    buffer.write('<CreatedBy>$createdBy</CreatedBy>');
    buffer.write('<ModificationTime>$modificationTime</ModificationTime>');
    buffer.write('<ModifiedBy>$modifiedBy</ModifiedBy>');
    buffer.write('</Master1>');
    return buffer.toString();
  }

  factory Master1.fromMap(Map<String, dynamic> map) {
    return Master1(
      code: map['Code'],
      masterType: map['MasterType'],
      name: map['Name'],
      alias: map['Alias'],
      parentGrp: map['ParentGrp'],
      printName: map['PrintName'],
      stamp: map['Stamp'],
      creationDate: map['CreationDate'],
      createdBy: map['CreatedBy'],
      modificationTime: map['ModificationTime'],
      modifiedBy: map['ModifiedBy'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Code': code,
      'MasterType': masterType,
      'Name': name,
      'ParentGrp': parentGrp,
      'PrintName': printName,
      'Stamp': stamp,
      'CreationDate': creationDate,
      'CreatedBy': createdBy,
      'ModificationTime': modificationTime,
      'ModifiedBy': modifiedBy,
    };
  }
}
