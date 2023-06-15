import 'package:flutter_busylib/models/transaction_entity/tran1.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class Transaction1Provider {
  final BusyService service;

  Transaction1Provider(this.service);

  Future<List<Transaction1>> getAllList({int limit = 10}) async {
    List<Transaction1> transaction1List = [];
    try {
      final xml = await service.getRecordsetFromXML(
          'SELECT ${Transaction1().toMap().keys.join(', ')} FROM Tran1 LIMIT $limit;');
      final parsedData = parseXml(xml);
      for (var i = 0; i < parsedData.length; i++) {
        transaction1List.add(Transaction1.fromMap(parsedData[i]));
      }
    } catch (error) {
      throw Exception('Failed to fetch company details: $error');
    }

    return transaction1List;
  }
}
