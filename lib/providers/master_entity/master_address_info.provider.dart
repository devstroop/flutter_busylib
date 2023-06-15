import 'package:flutter_busylib/models/master_entity/master_address_info.dart';

import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class MasterAddressInfoProvider {
  final BusyService service;

  MasterAddressInfoProvider(this.service);

  Future<MasterAddressInfo> getAll({int limit = 10}) async {
    try {
      final xml = await service.getRecordsetFromXML('SELECT ${MasterAddressInfo().toMap().keys.join(', ')} FROM MasterAddressInfo LIMIT $limit;');
      final parsedData = parseXml(xml);
      return MasterAddressInfo.fromMap(parsedData);
    } catch (error) {
      throw Exception('Failed to fetch master address info: $error');
    }
  }
}
