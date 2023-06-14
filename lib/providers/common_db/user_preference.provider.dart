import '../../models/common_db/user_preference.model.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class UserPreferenceProvider {
  final BusyService service;

  UserPreferenceProvider(this.service);

  Future<UserPreference> getByName(String name) async {
    try {
      final xml = await service.getRecordsetFromXML('SELECT * FROM UserPreference WHERE Name = \'$name\'');
      final parsedData = parseXml(xml);
      final userData = parsedData['UserPreference'] as Map<String, dynamic>;
      return UserPreference.fromMap(userData);
    } catch (error) {
      throw Exception('Failed to fetch user preference: $error');
    }
  }
}
