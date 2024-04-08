import 'package:flutterbaseapp/features/data/datasources/remote/api_client.dart';

class SmartzoneRemoteDatasource extends ApiClient {
  SmartzoneRemoteDatasource({required securityDao})
      : super(securityDao: securityDao);
}
