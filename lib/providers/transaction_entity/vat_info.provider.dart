import 'package:flutter_busylib/models/transaction_entity/vat_info.dart';

import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class VatInfoProvider {
  final BusyService service;

  VatInfoProvider(this.service);

  Future<List<VatInfo>> getAllList({int limit = 10}) async {
    List<VatInfo> vatInfoList = [];
    try {
      final xml = await service.getRecordsetFromXML(
          'SELECT ${VatInfo().toMap().keys.join(', ')} FROM VatInfo LIMIT $limit;');
      final parsedData = parseXml(xml);
      for (var i = 0; i < parsedData.length; i++) {
        vatInfoList.add(VatInfo.fromMap(parsedData[i]));
      }
    } catch (error) {
      throw Exception('Failed to fetch company details: $error');
    }

    return vatInfoList;
  }
}
