import 'package:flutter_busylib/models/transaction_entity/tran1.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class Transaction1Provider {
  final BusyService service;

  Transaction1Provider(this.service);

  Future<Transaction1> getAll({int limit = 10}) async {
    try {
      final xml = await service.getRecordsetFromXML('SELECT ${Transaction1().toMap().keys.join(', ')} FROM Transaction1 LIMIT $limit;');
      final parsedData = parseXml(xml);
      return Transaction1.fromMap(parsedData);
    } catch (error) {
      throw Exception('Failed to fetch Transaction1 details: $error');
    }
  }
}
