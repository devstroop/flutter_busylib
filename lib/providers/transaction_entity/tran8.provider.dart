import 'package:flutter_busylib/models/transaction_entity/tran8.dart';

import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class Transaction8Provider {
  final BusyService service;

  Transaction8Provider(this.service);

  Future<List<Transaction8>> getAllList({int limit = 10}) async {
    List<Transaction8> transaction8List = [];
    try {
      final xml = await service.getRecordsetFromXML(
          'SELECT ${Transaction8().toMap().keys.join(', ')} FROM Transaction8 LIMIT $limit;');
      final parsedData = parseXml(xml);
      for (var i = 0; i < parsedData.length; i++) {
        transaction8List.add(Transaction8.fromMap(parsedData[i]));
      }
    } catch (error) {
      throw Exception('Failed to fetch company details: $error');
    }

    return transaction8List;
  }
}
