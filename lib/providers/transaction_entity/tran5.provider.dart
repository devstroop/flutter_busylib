import 'package:flutter_busylib/models/transaction_entity/tran5.dart';

import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class Transaction5Provider {
  final BusyService service;

  Transaction5Provider(this.service);

  Future<Transaction5> getAll({int limit = 10}) async {
    try {
      final xml = await service.getRecordsetFromXML('SELECT ${Transaction5().toMap().keys.join(', ')} FROM Transaction5 LIMIT $limit;');
      final parsedData = parseXml(xml);
      return Transaction5.fromMap(parsedData);
    } catch (error) {
      throw Exception('Failed to fetch Transaction5 details: $error');
    }
  }
}
