import 'package:flutter_busylib/models/transaction_entity/help2.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class Help2Provider {
  final BusyService service;

  Help2Provider(this.service);

  Future<Help2> getAll({int limit = 10}) async {
    try {
      final xml = await service.getRecordsetFromXML('SELECT ${Help2().toMap().keys.join(', ')} FROM Help2 LIMIT $limit;');
      final parsedData = parseXml(xml);
      return Help2.fromMap(parsedData);
    } catch (error) {
      throw Exception('Failed to fetch Help2 details: $error');
    }
  }
}
