import 'package:flutterbaseapp/features/data/datasources/remote/api_client.dart';

class ReportRemoteDatasource extends ApiClient {
  ReportRemoteDatasource({required securityDao})
      : super(securityDao: securityDao);
}
