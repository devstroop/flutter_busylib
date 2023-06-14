import 'dart:convert';

import 'package:http/http.dart' as http;

import '../types/http_method.type.dart';

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


  Future<http.Response> executeAPIRequest({
    HttpMethod method = HttpMethod.get,
    String? path,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Encoding? encoding,
  }) async {
    final url = Uri.parse(baseUrl + (path ?? ''));
    final response = method == HttpMethod.get
        ? await http.post(url, headers: headers, body: body, encoding: encoding)
        : await http.get(url, headers: headers);

    final resultHeader = response.headers['Result'];
    if (resultHeader == 'F') {
      final descriptionHeader = response.headers['Description'];
      throw Exception(descriptionHeader);
    } else if (resultHeader == 'T') {
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Invalid status code in response');
      }
    } else {
      throw Exception('Unspecified \'Result\' in response header');
    }
  }

  Future openCompany() async {
    final parameters = {
      'SC': '51', // Open company
      'CompCode': compCode,
      'UserName': username,
      'Pwd': password,
    };

    final response = await executeAPIRequest(
        headers: parameters
    );
    return response.body;
  }

  Future closeCompany() async {
    final parameters = {
      'SC': '52', // Close company
    };
    final response = await executeAPIRequest(
        headers: parameters
    );
    return response.body;
  }

  Future<String> getRecordsetFromXML(String query) async {
    final parameters = {
      'SC': '1', // Get Recordset
      'UserName': username,
      'Pwd': password,
      'Qry': query,
    };

    final response = await executeAPIRequest(headers: parameters);
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

    final response = await executeAPIRequest(headers: parameters);
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

    final response = await executeAPIRequest(headers: parameters);
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

    final response = await executeAPIRequest(headers: parameters);
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

    final response = await executeAPIRequest(headers: parameters);
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

    final response = await executeAPIRequest(headers: parameters);
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

    final response = await executeAPIRequest(headers: parameters);
    return response.body;
  } // OK
  // Voucher

}
