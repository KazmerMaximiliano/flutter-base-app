import 'package:flutterbaseapp/features/data/datasources/remote/api_client.dart';

class BadgeRemoteDatasource extends ApiClient {
  BadgeRemoteDatasource({required securityDao})
      : super(securityDao: securityDao);
}
