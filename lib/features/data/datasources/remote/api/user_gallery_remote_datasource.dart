import 'package:flutterbaseapp/features/data/datasources/remote/api_client.dart';

class UserGalleryRemoteDatasource extends ApiClient {
  UserGalleryRemoteDatasource({required securityDao})
      : super(securityDao: securityDao);
}
