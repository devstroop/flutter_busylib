import 'package:flutter_busylib/models/master_entity/folio1.dart';

import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class Folio1Provider {
  final BusyService service;
  Folio1Provider(this.service);

    Future<List<Folio1>> getAllList({int limit = 10}) async {
      List<Folio1> folio1List = [];
      try{
        final xml = await service.getRecordsetFromXML('SELECT ${Folio1().toMap().keys.join(', ')} FROM Folio1 LIMIT $limit;');
        final parsedData = parseXml(xml);
        for (var i = 0; i < parsedData.length; i++) {
          folio1List.add(Folio1.fromMap(parsedData[i]));
        }
      }catch(error){
        throw Exception('Failed to fetch company details: $error');
      }

      return folio1List;
    }
}