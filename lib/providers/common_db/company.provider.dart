import '../../models/common_db/company.model.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class CompanyProvider {
  final BusyService service;
  CompanyProvider(this.service);
  Future<Company> get() async {
    try {
      final xml = await service.getRecordsetFromXML('SELECT * FROM Company');
      final parsedData = parseXml(xml);
      return Company.fromXml(parsedData);
    } catch (error) {
      throw Exception('Failed to fetch company details: $error');
    }
  }
}
