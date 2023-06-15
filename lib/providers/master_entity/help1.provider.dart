import 'package:flutter_busylib/models/master_entity/help1.dart';

import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class Help1Provider {
  final BusyService service;
  Help1Provider(this.service);

  Future<List<Help1>> getAllList({int limit = 10}) async {
    List<Help1> help1List = [];
    try{
      final xml = await service.getRecordsetFromXML('SELECT ${Help1().toMap().keys.join(', ')} FROM Help1 LIMIT $limit;');
      final parsedData = parseXml(xml);
      for (var i = 0; i < parsedData.length; i++) {
        help1List.add(Help1.fromMap(parsedData[i]));
      }
    }catch(error){
      throw Exception('Failed to fetch company details: $error');
    }

    return help1List;
  }
}
