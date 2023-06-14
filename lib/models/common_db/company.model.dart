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
