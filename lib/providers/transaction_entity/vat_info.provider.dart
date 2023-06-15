import 'package:flutter_busylib/models/transaction_entity/vat_info.dart';

import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class VatInfoProvider {
  final BusyService service;

  VatInfoProvider(this.service);

  Future<VatInfo> getAll({int limit = 10}) async {
    try {
      final xml = await service.getRecordsetFromXML('SELECT ${VatInfo().toMap().keys.join(', ')} FROM VatInfo LIMIT $limit;');
      final parsedData = parseXml(xml);
      return VatInfo.fromMap(parsedData);
    } catch (error) {
      throw Exception('Failed to fetch VatInfo details: $error');
    }
  }
}
