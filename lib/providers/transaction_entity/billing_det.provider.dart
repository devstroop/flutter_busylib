import 'package:flutter_busylib/models/transaction_entity/billing_det.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class BillingDetProvider {
  final BusyService service;

  BillingDetProvider(this.service);

  Future<List<BillingDet>> getAllList({int limit = 10}) async {
    List<BillingDet> billingDetList = [];
    try {
      final xml = await service.getRecordsetFromXML(
          'SELECT ${BillingDet().toMap().keys.join(', ')} FROM BillingDet LIMIT $limit;');
      final parsedData = parseXml(xml);
      for (var i = 0; i < parsedData.length; i++) {
        billingDetList.add(BillingDet.fromMap(parsedData[i]));
      }
    } catch (error) {
      throw Exception('Failed to fetch company details: $error');
    }

    return billingDetList;
  }
}
