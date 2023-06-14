import '../../../models/common_db/company.model.dart';
import '../../../models/year_specific_db/common/config1.dart';
import '../../../services/busy.service.dart';
import '../../../utils/xml.util.dart';

class Config1Provider {
  final BusyService service;
  Config1Provider(this.service);
  Future<Config1> getAll({int limit = 10}) async {
    try {
      final xml = await service.getRecordsetFromXML('SELECT ${Config1().toMap().keys.join(', ')} FROM Config1 LIMIT $limit;');
      final parsedData = parseXml(xml);
      return Config1.fromMap(parsedData);
    } catch (error) {
      throw Exception('Failed to fetch company details: $error');
    }
  }
}
