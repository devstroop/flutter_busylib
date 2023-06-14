class UserPreference {
  String? name;
  String? superUser;
  bool? canModifyMaster;
  bool? canModifyVoucher;
  bool? canEditCompany;
  String? dosDrvName;
  String? winDrvName;
  int? pageLen;
  int? linesPerPage;

  UserPreference({
    this.name,
    this.superUser,
    this.canModifyMaster,
    this.canModifyVoucher,
    this.canEditCompany,
    this.dosDrvName,
    this.winDrvName,
    this.pageLen,
    this.linesPerPage,
  });

  factory UserPreference.fromXmlString(String xmlString) {
    final regex = RegExp(r'<(\w+)>(.*?)<\/\w+>');
    final matches = regex.allMatches(xmlString);

    final map = <String, dynamic>{};
    for (final match in matches) {
      final key = match.group(1);
      final value = match.group(2);
      if (key != null) map[key] = value;
    }

    return UserPreference.fromMap(map);
  }

  String toXmlString() {
    final buffer = StringBuffer();
    buffer.write('<UserPreference>');
    buffer.write('<Name>$name</Name>');
    buffer.write('<SuperUser>$superUser</SuperUser>');
    buffer.write('<CanModifyMaster>$canModifyMaster</CanModifyMaster>');
    buffer.write('<CanModifyVoucher>$canModifyVoucher</CanModifyVoucher>');
    buffer.write('<CanEditCompany>$canEditCompany</CanEditCompany>');
    buffer.write('<DosDrvName>$dosDrvName</DosDrvName>');
    buffer.write('<WinDrvName>$winDrvName</WinDrvName>');
    buffer.write('<PageLen>$pageLen</PageLen>');
    buffer.write('<LinesPerPage>$linesPerPage</LinesPerPage>');
    buffer.write('</UserPreference>');
    return buffer.toString();
  }

  factory UserPreference.fromMap(Map<String, dynamic> map) {
    return UserPreference(
      name: map['Name'],
      superUser: map['SuperUser'],
      canModifyMaster: map['CanModifyMaster'],
      canModifyVoucher: map['CanModifyVoucher'],
      canEditCompany: map['CanEditCompany'],
      dosDrvName: map['DosDrvName'],
      winDrvName: map['WinDrvName'],
      pageLen: map['PageLen'],
      linesPerPage: map['LinesPerPage'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Name': name,
      'SuperUser': superUser,
      'CanModifyMaster': canModifyMaster,
      'CanModifyVoucher': canModifyVoucher,
      'CanEditCompany': canEditCompany,
      'DosDrvName': dosDrvName,
      'WinDrvName': winDrvName,
      'PageLen': pageLen,
      'LinesPerPage': linesPerPage,
    };
  }
}
