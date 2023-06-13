
import 'package:flutter/material.dart';

import '../../models/common_db/company.model.dart';
import '../../services/busy.service.dart';
import '../../utils/xml.util.dart';

class CompanyProvider with ChangeNotifier {
  Company? _company;
  final BusyService _busyService;

  CompanyProvider(this._busyService);

  Company? get company => _company;


  Future<Company> get() async {
    try {
      final xml = await _busyService.getRecordsetFromXML('SELECT * FROM Company');
      final parsedData = parseXml(xml); // Implement XML parsing logic here
      return Company.fromXml(parsedData);
    } catch (error) {
      throw Exception('Failed to fetch company details: $error');
    }
  }
}
