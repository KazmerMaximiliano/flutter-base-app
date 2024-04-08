import 'package:flutterbaseapp/features/data/datasources/remote/api_client.dart';

class FriendshipRemoteDatasource extends ApiClient {
  FriendshipRemoteDatasource({required securityDao})
      : super(securityDao: securityDao);
}
