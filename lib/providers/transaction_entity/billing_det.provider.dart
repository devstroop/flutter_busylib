import 'package:flutter_busylib/models/transaction_entity/billing_det.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class BillingDetProvider {
  final BusyService service;

  BillingDetProvider(this.service);

  Future<BillingDet> getByVchCode(String vchCode) async {
    try {
      final xml = await service.getRecordsetFromXML('SELECT ${BillingDet().toMap().keys.join(', ')} FROM BillingDet WHERE VchCode = $vchCode;');
      final parsedData = parseXml(xml);
      return BillingDet.fromMap(parsedData);
    } catch (error) {
      throw Exception('Failed to fetch BillingDet details: $error');
    }
  }
}
