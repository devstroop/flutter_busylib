import 'package:flutter_busylib/models/transaction_entity/tran3.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class Transaction3Provider {
  final BusyService service;

  Transaction3Provider(this.service);

  Future<Transaction3> getAll({int limit = 10}) async {
    try {
      final xml = await service.getRecordsetFromXML('SELECT ${Transaction3().toMap().keys.join(', ')} FROM Transaction3 LIMIT $limit;');
      final parsedData = parseXml(xml);
      return Transaction3.fromMap(parsedData);
    } catch (error) {
      throw Exception('Failed to fetch Transaction3 details: $error');
    }
  }
}
