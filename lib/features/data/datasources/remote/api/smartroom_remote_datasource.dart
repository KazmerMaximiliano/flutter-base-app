import 'package:flutterbaseapp/features/data/datasources/remote/api_client.dart';

class SmartroomRemoteDatasource extends ApiClient {
  SmartroomRemoteDatasource({required securityDao})
      : super(securityDao: securityDao);
}
