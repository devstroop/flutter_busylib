import '../../models/master_entity/help1.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class Help1Provider {
  final BusyService service;
  Help1Provider(this.service);
  Future<Help1> getAll({int limit = 10}) async {
    try {
      final xml = await service.getRecordsetFromXML('SELECT ${Help1().toMap().keys.join(', ')} FROM Help1 LIMIT $limit;');
      final parsedData = parseXml(xml);
      return Help1.fromMap(parsedData);
    } catch (error) {
      throw Exception('Failed to fetch company details: $error');
    }
  }
}