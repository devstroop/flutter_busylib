import 'package:flutter_busylib/models/transaction_entity/deleted_info.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class DeletedInfoProvider {
  final BusyService service;

  DeletedInfoProvider(this.service);

  Future<DeletedInfo> getByIdentity(String identity) async {
    try {
      final xml = await service.getRecordsetFromXML('SELECT ${DeletedInfo().toMap().keys.join(', ')} FROM DeletedInfo WHERE Identity = $identity;');
      final parsedData = parseXml(xml);
      return DeletedInfo.fromMap(parsedData);
    } catch (error) {
      throw Exception('Failed to fetch DeletedInfo details: $error');
    }
  }
}
