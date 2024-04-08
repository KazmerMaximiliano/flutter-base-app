import 'package:flutterbaseapp/features/data/datasources/remote/api_client.dart';

class LegalRemoteDatasource extends ApiClient {
  LegalRemoteDatasource({required securityDao})
      : super(securityDao: securityDao);
}
