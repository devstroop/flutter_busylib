import 'package:flutter_busylib/models/transaction_entity/tran6.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class Tran6Provider {
    final BusyService service;

  Tran6Provider(this.service);

  Future<List<Tran6>> getAllList({int limit = 10}) async {
    List<Tran6> tran6List = [];
    try {
      final xml = await service.getRecordsetFromXML(
          'SELECT ${Tran6().toMap().keys.join(', ')} FROM Tran6 LIMIT $limit;');
      final parsedData = parseXml(xml);
      for (var i = 0; i < parsedData.length; i++) {
        tran6List.add(Tran6.fromMap(parsedData[i]));
      }
    } catch (error) {
      throw Exception('Failed to fetch company details: $error');
    }

    return tran6List;
  }
}