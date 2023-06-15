import 'package:flutter_busylib/models/transaction_entity/tran9.dart';

import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class Transaction9Provider {
  final BusyService service;

  Transaction9Provider(this.service);

  Future<List<Transaction9>> getAllList({int limit = 10}) async {
    List<Transaction9> transaction9List = [];
    try {
      final xml = await service.getRecordsetFromXML(
          'SELECT ${Transaction9().toMap().keys.join(', ')} FROM Transaction9 LIMIT $limit;');
      final parsedData = parseXml(xml);
      for (var i = 0; i < parsedData.length; i++) {
        transaction9List.add(Transaction9.fromMap(parsedData[i]));
      }
    } catch (error) {
      throw Exception('Failed to fetch company details: $error');
    }

    return transaction9List;
  }
}
