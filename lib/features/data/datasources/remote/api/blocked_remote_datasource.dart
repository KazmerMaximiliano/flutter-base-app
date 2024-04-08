import 'package:flutterbaseapp/features/data/datasources/remote/api_client.dart';

class BlockedRemoteDatasource extends ApiClient {
  BlockedRemoteDatasource({required securityDao})
      : super(securityDao: securityDao);
}
