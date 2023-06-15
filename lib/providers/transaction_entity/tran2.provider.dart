import 'package:flutter_busylib/models/transaction_entity/tran2.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class Transaction2Provider {
  final BusyService service;

  Transaction2Provider(this.service);

  Future<List<Transaction2>> getAllList({int limit = 10}) async {
    List<Transaction2> transaction2List = [];
    try {
      final xml = await service.getRecordsetFromXML(
          'SELECT ${Transaction2().toMap().keys.join(', ')} FROM Tran2 LIMIT $limit;');
      final parsedData = parseXml(xml);
      for (var i = 0; i < parsedData.length; i++) {
        transaction2List.add(Transaction2.fromMap(parsedData[i]));
      }
    } catch (error) {
      throw Exception('Failed to fetch company details: $error');
    }

    return transaction2List;
  }
}
