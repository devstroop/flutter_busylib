import 'package:flutter_busylib/models/transaction_entity/tran10.dart';

import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class Transaction10Provider {
  final BusyService service;

  Transaction10Provider(this.service);

  Future<List<Transaction10>> getAllList({int limit = 10}) async {
    List<Transaction10> transaction10List = [];
    try {
      final xml = await service.getRecordsetFromXML(
          'SELECT ${Transaction10().toMap().keys.join(', ')} FROM Transaction10 LIMIT $limit;');
      final parsedData = parseXml(xml);
      for (var i = 0; i < parsedData.length; i++) {
        transaction10List.add(Transaction10.fromMap(parsedData[i]));
      }
    } catch (error) {
      throw Exception('Failed to fetch company details: $error');
    }

    return transaction10List;
  }
}
