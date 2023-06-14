import '../../../models/common_db/company.model.dart';
import '../../../services/busy.service.dart';
import '../../../utils/xml.util.dart';

class Config1Provider {
  final BusyService service;
  Config1Provider(this.service);
  Future<Company> get() async {
    try {
      final xml = await service.getRecordsetFromXML('SELECT ${Company().toMap().keys.join(', ')} FROM Config1');
      final parsedData = parseXml(xml);
      return Company.fromMap(parsedData);
    } catch (error) {
      throw Exception('Failed to fetch company details: $error');
    }
  }
}
