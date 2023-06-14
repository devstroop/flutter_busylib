import '../../models/common_db/user_log.model.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class UserLogProvider {
  final BusyService service;

  UserLogProvider(this.service);

  Future<List<UserLog>> getAll() async {
    try {
      final xml = await service.getRecordsetFromXML('SELECT * FROM UserLog');
      final parsedData = parseXml(xml);
      final list = parsedData['UserLog'] as List<dynamic>;
      return list.map((data) => UserLog.fromMap(data)).toList();
    } catch (error) {
      throw Exception('Failed to fetch user logs: $error');
    }
  }
}
