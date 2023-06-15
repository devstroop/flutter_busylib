import 'package:flutter_busylib/models/transaction_entity/tran3.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class Transaction3Provider {
  final BusyService service;

  Transaction3Provider(this.service);

  Future<List<Transaction3>> getAllList({int limit = 10}) async {
    List<Transaction3> transaction3List = [];
    try {
      final xml = await service.getRecordsetFromXML(
          'SELECT ${Transaction3().toMap().keys.join(', ')} FROM Tran3 LIMIT $limit;');
      final parsedData = parseXml(xml);
      for (var i = 0; i < parsedData.length; i++) {
        transaction3List.add(Transaction3.fromMap(parsedData[i]));
      }
    } catch (error) {
      throw Exception('Failed to fetch company details: $error');
    }

    return transaction3List;
  }
}
