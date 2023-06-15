import 'package:flutter/cupertino.dart';

import '../../models/master_entity/master1.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class Master1Provider {
  final BusyService service;
  Master1Provider(this.service);
  Future<List<Master1>> getAllList({int limit = 10}) async {
    List<Master1> master1List = [];
    try {
      final xml = await service.getRecordsetFromXML(
          'SELECT ${Master1().toMap().keys.join(', ')} FROM Master1 LIMIT $limit;');
      final parsedData = parseXml(xml);
      for (var i = 0; i < parsedData.length; i++) {
        master1List.add(Master1.fromMap(parsedData[i]));
      }
    } catch (error) {
      throw Exception('Failed to fetch company details: $error');
    }

    return master1List;
  }
}