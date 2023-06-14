import '../../models/common_db/user_preference1.model.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class UserPreference1Provider {
  final BusyService service;

  UserPreference1Provider(this.service);

  Future<UserPreference1> getByName(String name) async {
    try {
      final xml = await service.getRecordsetFromXML('SELECT * FROM UserPreference1 WHERE Name = \'$name\'');
      final parsedData = parseXml(xml);
      final userData = parsedData['UserPreference1'] as Map<String, dynamic>;
      return UserPreference1.fromMap(userData);
    } catch (error) {
      throw Exception('Failed to fetch user preference: $error');
    }
  }
}
