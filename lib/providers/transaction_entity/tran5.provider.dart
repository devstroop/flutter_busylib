import 'package:flutter_busylib/models/transaction_entity/tran5.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class Transaction5Provider {
  final BusyService service;

  Transaction5Provider(this.service);

  Future<List<Transaction5>> getAllList({int limit = 10}) async {
    List<Transaction5> transaction5List = [];
    try {
      final xml = await service.getRecordsetFromXML(
          'SELECT ${Transaction5().toMap().keys.join(', ')} FROM Tran5 LIMIT $limit;');
      final parsedData = parseXml(xml);
      for (var i = 0; i < parsedData.length; i++) {
        transaction5List.add(Transaction5.fromMap(parsedData[i]));
      }
    } catch (error) {
      throw Exception('Failed to fetch company details: $error');
    }

    return transaction5List;
  }
}
