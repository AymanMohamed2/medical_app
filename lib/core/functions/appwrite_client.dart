import 'package:appwrite/appwrite.dart';

final appwriteClient = Client()
  ..setEndpoint('https://fra.cloud.appwrite.io/v1')
  ..setProject('67058d4d0021d9bbb872')
  ..setSelfSigned(status: true);
