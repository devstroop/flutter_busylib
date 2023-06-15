import 'package:flutter_busylib/utils/http.util.dart';

class BusyService {
  final String baseUrl;
  final String compCode;
  final String username;
  final String password;

  const BusyService(
      {required this.baseUrl,
      required this.compCode,
      required this.username,
      required this.password});

  Future openCompany() async {
    final parameters = {
      'SC': '51', // Open company
      'CompCode': compCode,
      'UserName': username,
      'Pwd': password,
    };

    final response =
        await HttpUtil.get(url: baseUrl, headers: parameters);
    return response.body;
  }

  Future closeCompany() async {
    final parameters = {
      'SC': '52', // Close company
    };
    final response =
        await HttpUtil.get(url: baseUrl, headers: parameters);
    return response.body;
  }

  Future<String> getRecordsetFromXML(String query) async {
    final parameters = {
      'SC': '1', // Get Recordset
      'UserName': username,
      'Pwd': password,
      'Qry': query,
    };

    final response =
        await HttpUtil.get(url: baseUrl, headers: parameters);
    return response.body;
  } // OK

  Future<String> addVoucherFromXml(
      String voucherType, String voucherXml) async {
    final parameters = {
      'SC': '2', // Add Voucher
      'UserName': username,
      'Pwd': password,
      'VchType': voucherType,
      'VchXML': voucherXml,
    };

    final response =
        await HttpUtil.get(url: baseUrl, headers: parameters);
    return response.body;
  } // OK

  Future<String> modifyVoucherFromXmlByKey(
      String voucherType, String voucherXml, int modifyKey) async {
    Map<String, String> parameters = {
      'SC': '3', // Modify Vch By Key
      'UserName': username,
      'Pwd': password,
      'VchType': voucherType,
      'VchXML': voucherXml,
      'ModifyKey': '$modifyKey',
    };

    final response =
        await HttpUtil.get(url: baseUrl, headers: parameters);
    return response.body;
  } // OK

  Future<String> modifyVoucherFromXmlByVoucherCode(
      String voucherType, String voucherXml, int voucherCode) async {
    Map<String, String> parameters = {
      'SC': '4', // Modify Vch By VchCode
      'UserName': username,
      'Pwd': password,
      'VchType': voucherType,
      'VchXML': voucherXml,
      'VoucherCode': '$voucherCode',
    };

    final response =
        await HttpUtil.get(url: baseUrl, headers: parameters);
    return response.body;
  } // OK

  Future<String> addMasterFromXml(String masterType, String masterXml) async {
    final parameters = {
      'SC': '5',
      'UserName': username,
      'Pwd': password,
      'MasterType': masterType,
      'MasterXML': masterXml,
    };

    final response =
        await HttpUtil.get(url: baseUrl, headers: parameters);
    return response.body;
  } // OK

  Future<String> modifyMasterFromXmlByCode(
      String masterCode, String masterXml) async {
    final parameters = {
      'SC': '6', // Modify master by Code
      'UserName': username,
      'Pwd': password,
      'MasterCode': masterCode,
      'MasterXML': masterXml,
    };

    final response =
        await HttpUtil.get(url: baseUrl, headers: parameters);
    return response.body;
  } // OK

  Future<String> modifyMasterFromXmlByName(
      String masterName, String masterType, String masterXml) async {
    final parameters = {
      'SC': '7', // Modify a master through XML string (by its Name)
      'UserName': username,
      'Pwd': password,
      'MasterName': masterName,
      'MasterType': masterType,
      'MasterXML': masterXml,
    };

    final response =
        await HttpUtil.get(url: baseUrl, headers: parameters);
    return response.body;
  } // OK
}
