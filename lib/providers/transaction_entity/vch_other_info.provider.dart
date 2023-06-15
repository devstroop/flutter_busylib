import 'package:flutter_busylib/models/transaction_entity/vch_other_info.dart';

import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class VchOtherInfoProvider {
  final BusyService service;

  VchOtherInfoProvider(this.service);

  Future<List<VchOtherInfo>> getAllList({int limit = 10}) async {
    List<VchOtherInfo> vchOtherInfoList = [];
    try {
      final xml = await service.getRecordsetFromXML(
          'SELECT ${VchOtherInfo().toMap().keys.join(', ')} FROM VchOtherInfo LIMIT $limit;');
      final parsedData = parseXml(xml);
      for (var i = 0; i < parsedData.length; i++) {
        vchOtherInfoList.add(VchOtherInfo.fromMap(parsedData[i]));
      }
    } catch (error) {
      throw Exception('Failed to fetch company details: $error');
    }

    return vchOtherInfoList;
  }
}
