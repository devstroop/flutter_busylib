# flutter_busylib `BETA`
flutter_busylib is a Flutter package that provides a set of classes to interact with a Busy accounting software server. It includes models and providers for various master and transaction entities.

## Usage
To use flutter_busylib, you need to create an instance of the BusyLib class by providing the following parameters:
- baseUrl: The base URL of the Busy server.
- compCode: The company code of the Busy server.
- username: The username to authenticate with the Busy server.
- password: The password to authenticate with the Busy server.

```
    final busyLib = BusyLib(
      'https://example.com',
      'COMPANY_CODE',
      'USERNAME',
      'PASSWORD',
    );
```
Once you have an instance of BusyLib, you can use it to open and close the company, and get providers for various master entities and folios.

```
await busyLib.open();

final folio1Provider = busyLib.folio1Provider;
final master1Provider = busyLib.master1Provider;

// Use the providers to interact with the server

await busyLib.close();
```

## Models
`flutter_busylib` includes models for the following:

### Master Entiry Model
- Folio1
- Help1
- Master1
- MasterAddressInfo
- MasterSupport

### Transaction Entiry Model
- BillingDet
- DeletedInfo
- Help2
- OedDet
- TradingExcise
- Tran1
- Tran2
- Tran3
- Tran4
- Tran5
- Tran6
- Tran7
- Tran8
- Tran9
- Tran10
- VatInfo
- VchOtherInfo
    
## Providers
`flutter_busylib` includes providers for the following:

### Master Entiry Provider
- Folio1Provider
- Help1Provider
- Master1Provider
- MasterAddressInfoProvider
- MasterSupportProvider

### Transaction Entiry Provider
- BillingDetProvider
- DeletedInfoProvider
- Help2Provider
- OedDetProvider
- TradingExciseProvider
- Tran1Provider
- Tran2Provider
- Tran3Provider
- Tran4Provider
- Tran5Provider
- Tran6Provider
- Tran7Provider
- Tran8Provider
- Tran9Provider
- Tran10Provider
- VatInfoProvider
- VchOtherInfoProvider
  
## Contributing
Contributions to `flutter_busylib` are welcome! If you find a bug or want to add a new feature, please open an issue or a pull request on the [GitHub repository](https://github.com/flutter-busy/flutter_busylib).

## License
`flutter_busylib` is released under the MIT License. See [LICENSE](https://github.com/flutter-busy/flutter_busylib/blob/main/LICENSE) for details.

