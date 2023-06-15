import 'package:flutter_busylib/models/transaction_entity/deleted_info.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class DeletedInfoProvider {
  final BusyService service;

  DeletedInfoProvider(this.service);

  Future<List<DeletedInfo>> getAllList({int limit = 10}) async {
    List<DeletedInfo> deletedInfoList = [];
    try {
      final xml = await service.getRecordsetFromXML(
          'SELECT ${DeletedInfo().toMap().keys.join(', ')} FROM DeletedInfo LIMIT $limit;');
      final parsedData = parseXml(xml);
      for (var i = 0; i < parsedData.length; i++) {
        deletedInfoList.add(DeletedInfo.fromMap(parsedData[i]));
      }
    } catch (error) {
      throw Exception('Failed to fetch company details: $error');
    }

    return deletedInfoList;
  }
}
