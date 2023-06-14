import 'package:flutter_busylib/models/master_entity/folio1.dart';

import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class Folio1Provider {
  final BusyService service;
  Folio1Provider(this.service);
  Future<Folio1> getAll({int limit = 10}) async {
    try {
      final xml = await service.getRecordsetFromXML('SELECT ${Folio1().toMap().keys.join(', ')} FROM Folio1 LIMIT $limit;');
      final parsedData = parseXml(xml);
      return Folio1.fromMap(parsedData);
    } catch (error) {
      throw Exception('Failed to fetch company details: $error');
    }
  }
}