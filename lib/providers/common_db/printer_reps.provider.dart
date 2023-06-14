import '../../models/common_db/printer_reps.model.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class PrinterRepsProvider {
  final BusyService service;

  PrinterRepsProvider(this.service);

  Future<List<PrinterReps>> getAll() async {
    try {
      final xml = await service.getRecordsetFromXML('SELECT * FROM PrinterReps');
      final parsedData = parseXml(xml);
      final list = parsedData['PrinterReps'] as List<dynamic>;
      return list.map((data) => PrinterReps.fromMap(data)).toList();
    } catch (error) {
      throw Exception('Failed to fetch printer representatives: $error');
    }
  }
}