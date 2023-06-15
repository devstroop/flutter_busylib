import 'package:flutter_busylib/models/transaction_entity/tran7.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class Tran7Provider {
    final BusyService service;

  Tran7Provider(this.service);

  Future<List<Tran7>> getAllList({int limit = 10}) async {
    List<Tran7> tran7List = [];
    try {
      final xml = await service.getRecordsetFromXML(
          'SELECT ${Tran7().toMap().keys.join(', ')} FROM Tran7 LIMIT $limit;');
      final parsedData = parseXml(xml);
      for (var i = 0; i < parsedData.length; i++) {
        tran7List.add(Tran7.fromMap(parsedData[i]));
      }
    } catch (error) {
      throw Exception('Failed to fetch company details: $error');
    }

    return tran7List;
  }
}