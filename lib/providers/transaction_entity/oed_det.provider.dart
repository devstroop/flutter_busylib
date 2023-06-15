import 'package:flutter_busylib/models/transaction_entity/oed_det.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class OEDDetProvider {
  final BusyService service;

  OEDDetProvider(this.service);

  Future<OEDDet> getAll({int limit = 10}) async {
    try {
      final xml = await service.getRecordsetFromXML('SELECT ${OEDDet().toMap().keys.join(', ')} FROM OEDDet LIMIT $limit;');
      final parsedData = parseXml(xml);
      return OEDDet.fromMap(parsedData);
    } catch (error) {
      throw Exception('Failed to fetch OEDDet details: $error');
    }
  }
}
