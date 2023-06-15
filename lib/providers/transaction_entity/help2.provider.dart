import 'package:flutter_busylib/models/transaction_entity/help2.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class Help2Provider {
  final BusyService service;

  Help2Provider(this.service);

  Future<List<Help2>> getAllList({int limit = 10}) async {
    List<Help2> help2List = [];
    try {
      final xml = await service.getRecordsetFromXML(
          'SELECT ${Help2().toMap().keys.join(', ')} FROM Help2 LIMIT $limit;');
      final parsedData = parseXml(xml);
      for (var i = 0; i < parsedData.length; i++) {
        help2List.add(Help2.fromMap(parsedData[i]));
      }
    } catch (error) {
      throw Exception('Failed to fetch company details: $error');
    }

    return help2List;
  }
}
