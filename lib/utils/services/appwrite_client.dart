import 'package:appwrite/appwrite.dart';

class AppWriteClient {
  AppWriteClient._();

  static final _client = Client()
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('660844fe406442166eb0')
      .setSelfSigned();

  static final database = Databases(_client);

  static final account = Account(_client);

  static const databaseId = '66084f6386c7d3db9515';

  static const userCollectionId = '66084f8283e88cbabde2';

  // static const hotspotCollectionId = '65a8fe72c7e5968b8031';
}
