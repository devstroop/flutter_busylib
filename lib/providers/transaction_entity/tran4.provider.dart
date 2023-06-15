import 'package:flutter_busylib/models/transaction_entity/tran4.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class Transaction4Provider {
  final BusyService service;

  Transaction4Provider(this.service);

  Future<Transaction4> getAll({int limit = 10}) async {
    try {
      final xml = await service.getRecordsetFromXML('SELECT ${Transaction4().toMap().keys.join(', ')} FROM Transaction4 LIMIT $limit;');
      final parsedData = parseXml(xml);
      return Transaction4.fromMap(parsedData);
    } catch (error) {
      throw Exception('Failed to fetch Transaction4 details: $error');
    }
  }
}
