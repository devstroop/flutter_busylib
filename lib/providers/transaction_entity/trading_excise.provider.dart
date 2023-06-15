import 'package:flutter_busylib/models/transaction_entity/trading_excise.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class TradingExciseProvider {
  final BusyService service;

  TradingExciseProvider(this.service);

  Future<List<TradingExcise>> getAllList({int limit = 10}) async {
    List<TradingExcise> tradingExciseList = [];
    try {
      final xml = await service.getRecordsetFromXML(
          'SELECT ${TradingExcise().toMap().keys.join(', ')} FROM TradingExcise LIMIT $limit;');
      final parsedData = parseXml(xml);
      for (var i = 0; i < parsedData.length; i++) {
        tradingExciseList.add(TradingExcise.fromMap(parsedData[i]));
      }
    } catch (error) {
      throw Exception('Failed to fetch company details: $error');
    }

    return tradingExciseList;
  }
}
