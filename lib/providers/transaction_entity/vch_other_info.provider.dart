import 'package:flutter_busylib/models/transaction_entity/vch_other_info.dart';

import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class VchOtherInfoProvider {
  final BusyService service;

  VchOtherInfoProvider(this.service);

  Future<VchOtherInfo> getAll({int limit = 10}) async {
    try {
      final xml = await service.getRecordsetFromXML('SELECT ${VchOtherInfo().toMap().keys.join(', ')} FROM VchOtherInfo LIMIT $limit;');
      final parsedData = parseXml(xml);
      return VchOtherInfo.fromMap(parsedData);
    } catch (error) {
      throw Exception('Failed to fetch VchOtherInfo details: $error');
    }
  }
}
