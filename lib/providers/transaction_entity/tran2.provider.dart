import 'package:flutter_busylib/models/transaction_entity/tran2.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class Transaction2Provider {
  final BusyService service;

  Transaction2Provider(this.service);

  Future<Transaction2> getAll({int limit = 10}) async {
    try {
      final xml = await service.getRecordsetFromXML('SELECT ${Transaction2().toJson().keys.join(', ')} FROM Transaction2 LIMIT $limit;');
      final parsedData = parseXml(xml);
      return Transaction2.fromMap(parsedData);
    } catch (error) {
      throw Exception('Failed to fetch Transaction2 details: $error');
    }
  }
}
