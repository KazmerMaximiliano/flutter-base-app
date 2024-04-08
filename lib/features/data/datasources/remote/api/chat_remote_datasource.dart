import 'package:flutterbaseapp/features/data/datasources/remote/api_client.dart';

class ChatRemoteDatasource extends ApiClient {
  ChatRemoteDatasource({required securityDao})
      : super(securityDao: securityDao);
}
