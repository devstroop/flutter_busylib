import '../../models/master_entity/master1.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class Master1Provider {
  final BusyService service;
  Master1Provider(this.service);
  Future<Master1> getAll({int limit = 10}) async {
    try {
      final xml = await service.getRecordsetFromXML('SELECT ${Master1().toMap().keys.join(', ')} FROM Folio1 LIMIT $limit;');
      final parsedData = parseXml(xml);
      return Master1.fromMap(parsedData);
    } catch (error) {
      throw Exception('Failed to fetch company details: $error');
    }
  }
}