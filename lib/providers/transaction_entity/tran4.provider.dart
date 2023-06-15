import 'package:flutter_busylib/models/transaction_entity/tran4.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class Transaction4Provider {
  final BusyService service;

  Transaction4Provider(this.service);

  Future<List<Transaction4>> getAllList({int limit = 10}) async {
    List<Transaction4> transaction4List = [];
    try {
      final xml = await service.getRecordsetFromXML(
          'SELECT ${Transaction4().toMap().keys.join(', ')} FROM Tran4 LIMIT $limit;');
      final parsedData = parseXml(xml);
      for (var i = 0; i < parsedData.length; i++) {
        transaction4List.add(Transaction4.fromMap(parsedData[i]));
      }
    } catch (error) {
      throw Exception('Failed to fetch company details: $error');
    }

    return transaction4List;
  }
}
