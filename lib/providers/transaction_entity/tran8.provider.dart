import 'package:flutter_busylib/models/transaction_entity/tran8.dart';

import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class Transaction8Provider {
  final BusyService service;

  Transaction8Provider(this.service);

  Future<Transaction8> getAll({int limit = 10}) async {
    try {
      final xml = await service.getRecordsetFromXML('SELECT ${Transaction8().toMap().keys.join(', ')} FROM Transaction8 LIMIT $limit;');
      final parsedData = parseXml(xml);
      return Transaction8.fromMap(parsedData);
    } catch (error) {
      throw Exception('Failed to fetch Transaction8 details: $error');
    }
  }
}
