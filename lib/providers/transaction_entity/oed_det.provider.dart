import 'package:flutter_busylib/models/transaction_entity/oed_det.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class OEDDetProvider {
  final BusyService service;

  OEDDetProvider(this.service);

  Future<List<OEDDet>> getAllList({int limit = 10}) async {
    List<OEDDet> oedDetList = [];
    try {
      final xml = await service.getRecordsetFromXML(
          'SELECT ${OEDDet().toMap().keys.join(', ')} FROM OEDDet LIMIT $limit;');
      final parsedData = parseXml(xml);
      for (var i = 0; i < parsedData.length; i++) {
        oedDetList.add(OEDDet.fromMap(parsedData[i]));
      }
    } catch (error) {
      throw Exception('Failed to fetch company details: $error');
    }

    return oedDetList;
  }
}
