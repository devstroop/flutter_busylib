import '../../models/common_db/std_nar.model.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class StdNarProvider {
  final BusyService service;

  StdNarProvider(this.service);

  Future<List<StdNar>> getAll() async {
    try {
      final xml = await service.getRecordsetFromXML('SELECT * FROM StdNar');
      final parsedData = parseXml(xml);
      final list = parsedData['StdNar'] as List<dynamic>;
      return list.map((data) => StdNar.fromMap(data)).toList();
    } catch (error) {
      throw Exception('Failed to fetch standard naratives: $error');
    }
  }
}
