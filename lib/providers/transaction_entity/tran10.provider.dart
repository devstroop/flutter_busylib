import 'package:flutter_busylib/models/transaction_entity/tran10.dart';

import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class Transaction10Provider {
  final BusyService service;

  Transaction10Provider(this.service);

  Future<Transaction10> getAll({int limit = 10}) async {
    try {
      final xml = await service.getRecordsetFromXML('SELECT ${Transaction10().toMap().keys.join(', ')} FROM Transaction10 LIMIT $limit;');
      final parsedData = parseXml(xml);
      return Transaction10.fromMap(parsedData);
    } catch (error) {
      throw Exception('Failed to fetch Transaction10 details: $error');
    }
  }
}
