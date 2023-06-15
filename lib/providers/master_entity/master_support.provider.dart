import 'package:flutter/cupertino.dart';

import '../../models/master_entity/master_support.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class MasterSupportProvider {
  final BusyService service;

  MasterSupportProvider(this.service);
  Future<List<MasterSupport>> getAllList({int limit = 10}) async {
    List<MasterSupport> masterSupportList = [];
    try {
      final xml = await service.getRecordsetFromXML(
          'SELECT ${MasterSupport().toMap().keys.join(', ')} FROM MasterSupport LIMIT $limit;');
      final parsedData = parseXml(xml);
      for (var i = 0; i < parsedData.length; i++) {
        masterSupportList.add(MasterSupport.fromMap(parsedData[i]));
      }
    } catch (error) {
      throw Exception('Failed to fetch company details: $error');
    }

    return masterSupportList;
  }
}
