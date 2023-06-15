import 'package:flutter/cupertino.dart';

import '../../models/master_entity/master_support.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class MasterSupportProvider {
  final BusyService service;

  MasterSupportProvider(this.service);

  Future<Object> getAll({int limit = 10}) async {
    List<MasterSupport> result = [];
    try {
      String query = 'SELECT ${MasterSupport().toMap().keys.join(', ')} FROM MasterSupport LIMIT $limit;';
      final xml = await service.getRecordsetFromXML(query);
      debugPrint(xml);
      final parsedData = parseXml(xml);
      return MasterSupport.fromMap(parsedData);
      // if (parsedData is List<dynamic>) {
      //   for (var item in parsedData) {
      //     if (item is Map<String, dynamic>) {
      //       result.add(MasterSupport.fromMap(item));
      //     }
      //   }
      // } else if (parsedData is Map<String, dynamic>) {
      //   result.add(MasterSupport.fromMap(parsedData));
      // }
    } catch (error) {
      throw Exception('Failed to fetch master support details: $error');
    }
    return result;
  }
}
