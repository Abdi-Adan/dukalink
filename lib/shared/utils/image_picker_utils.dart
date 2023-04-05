import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dukalink_app/core/data/model/asset_model.dart';
import 'package:injectable/injectable.dart';

abstract class ImageUtils {
  Future<XFile?> pickImage(String source);

  Future<File?> compressImage(String? path, String? targetPath);

  Future<AssetModel> uploadImageToFirebase(
      String firebaseRef, String imagePath);

  Future<AssetModel> uploadFileToFirebase(String firebaseRef, String filePath);
}

class ImageUtilsImpl implements ImageUtils {
  final ImagePicker _picker = ImagePicker();
  final _firebaseStorage = FirebaseStorage.instance;

  @override
  Future<File?> compressImage(String? path, String? targetPath) async {
    try {
      var result = await FlutterImageCompress.compressAndGetFile(
        path!,
        targetPath!,
        quality: 40,
      );
      return result;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<XFile?> pickImage(String source) async {
    try {
      XFile? image;
      if (source == 'gallery') {
        image = await _picker.pickImage(source: ImageSource.gallery);
      } else {
        image = await _picker.pickImage(source: ImageSource.camera);
      }
      return image;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AssetModel> uploadImageToFirebase(
      String firebaseRef, String imagePath) async {
    try {
      File? compressedImage = await compressImage(
          File(imagePath).absolute.path, '${imagePath}_compressed.jpg');

      //Upload to Firebase
      var snapshot = await _firebaseStorage
          .ref()
          .child(firebaseRef)
          .putFile(compressedImage ?? File(imagePath));

      var downloadUrl = await snapshot.ref.getDownloadURL();
      var pathUrl = snapshot.ref.fullPath;

      return AssetModel(
          mediaUrl: downloadUrl, mediaPathUrl: pathUrl, mediaType: 'image/*');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AssetModel> uploadFileToFirebase(
      String firebaseRef, String filePath) async {
    try {
      //Upload to Firebase
      var snapshot = await _firebaseStorage
          .ref()
          .child(firebaseRef)
          .putFile(File(filePath));

      var downloadUrl = await snapshot.ref.getDownloadURL();
      var pathUrl = snapshot.ref.fullPath;

      return AssetModel(
          mediaUrl: downloadUrl, mediaPathUrl: pathUrl, mediaType: 'file');
    } catch (e) {
      rethrow;
    }
  }
}
