import 'package:flutter/cupertino.dart';

import '../../models/master_entity/master1.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class Master1Provider {
  final BusyService service;
  Master1Provider(this.service);
  Future<List<Master1>> getAll({int limit = 10}) async {
    List<Master1> result = [];
    try {
      String qry = 'SELECT ${Master1().toMap().keys.join(', ')} FROM Master1 LIMIT $limit;';
      final xml = await service.getRecordsetFromXML(qry);
      debugPrint(xml);
      //final parsedData = parseXml(xml);
      //result.add(Master1.fromMap(parsedData));
    } catch (_) { }
    return result;
  }
}