import 'package:appwrite/appwrite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_app/core/functions/appwrite_client.dart';

class AppwriteStorageService {
  static final _storage = Storage(appwriteClient);

  static Future<String?> uploadImage(XFile image) async {
    final result = await _storage.createFile(
      bucketId: '684cc153000544e0a94c',
      fileId: ID.unique(),
      file: InputFile.fromPath(path: image.path),
    );

    final imageUrl =
        'https://cloud.appwrite.io/v1/storage/buckets/684cc153000544e0a94c/files/${result.$id}/view?project=67058d4d0021d9bbb872';

    return imageUrl;
  }
}
