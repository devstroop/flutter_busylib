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

  factory Company.fromXml(Map<String, dynamic> xml) {
    return Company(
      name: xml['Name'],
      printName: xml['PrintName'],
      address1: xml['Address1'],
      address2: xml['Address2'],
      address3: xml['Address3'],
      address4: xml['Address4'],
      begFY: xml['BegFY'],
      curFY: xml['CurFY'],
      booksStart: xml['BooksStart'],
      freezeDate: xml['FreezDate'],
      lstNo: xml['LSTNo'],
      cstNo: xml['CSTNo'],
      createdOn: xml['CreatedOn'],
      major: xml['Major'],
      minor: xml['Minor'],
      received: xml['Received'],
    );
  }

  Map<String, dynamic> toXml() {
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
