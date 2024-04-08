import 'package:flutterbaseapp/features/data/datasources/remote/api_client.dart';

class DeviceRemoteDatasource extends ApiClient {
  DeviceRemoteDatasource({required securityDao})
      : super(securityDao: securityDao);
}
