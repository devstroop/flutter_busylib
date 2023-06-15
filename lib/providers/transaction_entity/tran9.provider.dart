import 'package:flutter_busylib/models/transaction_entity/tran9.dart';

import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class Transaction9Provider {
  final BusyService service;

  Transaction9Provider(this.service);

  Future<Transaction9> getAll({int limit = 10}) async {
    try {
      final xml = await service.getRecordsetFromXML('SELECT ${Transaction9().toMap().keys.join(', ')} FROM Transaction9 LIMIT $limit;');
      final parsedData = parseXml(xml);
      return Transaction9.fromMap(parsedData);
    } catch (error) {
      throw Exception('Failed to fetch Transaction9 details: $error');
    }
  }
}
