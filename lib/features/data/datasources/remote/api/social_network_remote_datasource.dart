import 'package:flutterbaseapp/features/data/datasources/remote/api_client.dart';

class SocialNetworkRemoteDatasource extends ApiClient {
  SocialNetworkRemoteDatasource({required securityDao})
      : super(securityDao: securityDao);
}
