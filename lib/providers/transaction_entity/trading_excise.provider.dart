import 'package:flutter_busylib/models/transaction_entity/trading_excise.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class TradingExciseProvider {
  final BusyService service;

  TradingExciseProvider(this.service);

  Future<TradingExcise> getAll({int limit = 10}) async {
    try {
      final xml = await service.getRecordsetFromXML('SELECT ${TradingExcise().toMap().keys.join(', ')} FROM TradingExcise LIMIT $limit;');
      final parsedData = parseXml(xml);
      return TradingExcise.fromMap(parsedData);
    } catch (error) {
      throw Exception('Failed to fetch TradingExcise details: $error');
    }
  }
}
