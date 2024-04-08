import 'package:flutterbaseapp/features/data/datasources/remote/api_client.dart';

class TouchesRemoteDatasource extends ApiClient {
  TouchesRemoteDatasource({required securityDao})
      : super(securityDao: securityDao);
}
