import 'package:http/http.dart' as http;

class BusyService {
  static const String baseUrl = 'https://api.busy.com/';

  static Future<http.Response> executeRequest(String endpoint, Map<String, dynamic> parameters) async {
    final url = Uri.parse(baseUrl + endpoint);
    final response = await http.post(url, body: parameters);
    return response;
  }

  static Future<String> getXmlFromRecordset(String query, String username, String password) async {
    const endpoint = 'get-xml-from-recordset';
    final parameters = {
      'Qry': query,
      'UserName': username,
      'Pwd': password,
    };

    final response = await executeRequest(endpoint, parameters);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to get XML from recordset');
    }
  }

  static Future<String> addVoucherFromXml(String voucherType, String voucherXml, String username, String password) async {
    const endpoint = 'add-voucher-from-xml';
    final parameters = {
      'VchType': voucherType,
      'VchXML': voucherXml,
      'UserName': username,
      'Pwd': password,
    };

    final response = await executeRequest(endpoint, parameters);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to add voucher from XML');
    }
  }

  static Future<String> modifyVoucherFromXmlByVoucherNo(String voucherType, String voucherXml, int modifyKey, String username, String password) async {
    const endpoint = 'modify-voucher-from-xml-by-voucher-no';
    final parameters = {
      'VchType': voucherType,
      'VchXML': voucherXml,
      'ModifyKey': modifyKey,
      'UserName': username,
      'Pwd': password,
    };

    final response = await executeRequest(endpoint, parameters);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to modify voucher from XML');
    }
  }

  static Future<String> modifyVoucherFromXmlByVoucherCode(String voucherType, String voucherXml, int voucherCode, String username, String password) async {
    const endpoint = 'modify-voucher-from-xml-by-voucher-code';
    final parameters = {
      'VchType': voucherType,
      'VchXML': voucherXml,
      'VoucherCode': voucherCode,
      'UserName': username,
      'Pwd': password,
    };

    final response = await executeRequest(endpoint, parameters);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to modify voucher from XML');
    }
  }

  static Future<String> addMasterFromXml(String masterType, String masterXml, String username, String password) async {
    const endpoint = 'add-master-from-xml';
    final parameters = {
      'MasterType': masterType,
      'MasterXML': masterXml,
      'UserName': username,
      'Pwd': password,
    };

    final response = await executeRequest(endpoint, parameters);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to add master from XML');
    }
  }

  static Future<String> modifyMasterFromXmlByCode(String masterCode, String masterXml, String username, String password) async {
    const endpoint = 'modify-master-from-xml-by-code';
    final parameters = {
      'MasterCode': masterCode,
      'MasterXML': masterXml,
      'UserName': username,
      'Pwd': password,
    };

    final response = await executeRequest(endpoint, parameters);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to modify master from XML');
    }
  }

  static Future<String> modifyMasterFromXmlByName(String masterName, String masterType, String masterXml, String username, String password) async {
    const endpoint = 'modify-master-from-xml-by-name';
    final parameters = {
      'MasterName': masterName,
      'MasterType': masterType,
      'MasterXML': masterXml,
      'UserName': username,
      'Pwd': password,
    };

    final response = await executeRequest(endpoint, parameters);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to modify master from XML');
    }
  }

  static Future<String> getVchXml(int voucherCode, String username, String password) async {
    const endpoint = 'get-vch-xml';
    final parameters = {
      'VoucherCode': voucherCode,
      'UserName': username,
      'Pwd': password,
    };

    final response = await executeRequest(endpoint, parameters);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to get voucher XML');
    }
  }

  static Future<String> getMasterXml(int masterCode, String username, String password) async {
    const endpoint = 'get-master-xml';
    final parameters = {
      'MasterCode': masterCode,
      'UserName': username,
      'Pwd': password,
    };

    final response = await executeRequest(endpoint, parameters);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to get master XML');
    }
  }
}
