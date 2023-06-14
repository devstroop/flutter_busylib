class Company {
  String? name;
  String? printName;
  String? address1;
  String? address2;
  String? address3;
  String? address4;
  String? begFY;
  String? curFY;
  String? booksStart;
  String? freezeDate;
  String? lstNo;
  String? cstNo;
  String? createdOn;
  String? major;
  String? minor;
  String? received;

  Company({
    this.name,
    this.printName,
    this.address1,
    this.address2,
    this.address3,
    this.address4,
    this.begFY,
    this.curFY,
    this.booksStart,
    this.freezeDate,
    this.lstNo,
    this.cstNo,
    this.createdOn,
    this.major,
    this.minor,
    this.received,
  });

  factory Company.fromXmlString(String xmlString) {
    final regex = RegExp(r'<(\w+)>(.*?)<\/\w+>');
    final matches = regex.allMatches(xmlString);

    final map = <String, dynamic>{};
    for (final match in matches) {
      final key = match.group(1);
      final value = match.group(2);
      if(key!=null) {
        map[key] = value;
      }
    }

    return Company.fromMap(map);
  }

  String toXmlString() {
    final buffer = StringBuffer();
    buffer.write('<Company>');
    buffer.write('<Name>$name</Name>');
    buffer.write('<PrintName>$printName</PrintName>');
    buffer.write('<Address1>$address1</Address1>');
    buffer.write('<Address2>$address2</Address2>');
    buffer.write('<Address3>$address3</Address3>');
    buffer.write('<Address4>$address4</Address4>');
    buffer.write('<BegFY>$begFY</BegFY>');
    buffer.write('<CurFY>$curFY</CurFY>');
    buffer.write('<BooksStart>$booksStart</BooksStart>');
    buffer.write('<FreezDate>$freezeDate</FreezDate>');
    buffer.write('<LSTNo>$lstNo</LSTNo>');
    buffer.write('<CSTNo>$cstNo</CSTNo>');
    buffer.write('<CreatedOn>$createdOn</CreatedOn>');
    buffer.write('<Major>$major</Major>');
    buffer.write('<Minor>$minor</Minor>');
    buffer.write('<Received>$received</Received>');
    buffer.write('</Company>');
    return buffer.toString();
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      name: map['Name'],
      printName: map['PrintName'],
      address1: map['Address1'],
      address2: map['Address2'],
      address3: map['Address3'],
      address4: map['Address4'],
      begFY: map['BegFY'],
      curFY: map['CurFY'],
      booksStart: map['BooksStart'],
      freezeDate: map['FreezDate'],
      lstNo: map['LSTNo'],
      cstNo: map['CSTNo'],
      createdOn: map['CreatedOn'],
      major: map['Major'],
      minor: map['Minor'],
      received: map['Received'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Name': name,
      'PrintName': printName,
      'Address1': address1,
      'Address2': address2,
      'Address3': address3,
      'Address4': address4,
      'BegFY': begFY,
      'CurFY': curFY,
      'BooksStart': booksStart,
      'FreezDate': freezeDate,
      'LSTNo': lstNo,
      'CSTNo': cstNo,
      'CreatedOn': createdOn,
      'Major': major,
      'Minor': minor,
      'Received': received,
    };
  }
}
