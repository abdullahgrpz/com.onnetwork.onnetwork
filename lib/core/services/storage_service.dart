// lib/core/services/storage_service.dart
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // 1. Telefondan Resim Seç
  Future<File?> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  // 2. Seçilen Resmi Storage'a Yükle
  Future<String?> uploadProfileImage(File imageFile) async {
    try {
      final user = _auth.currentUser;
      if (user == null) return null;

      // Güvenlik kurallarımıza uygun bir yol oluştur: profile_images/USER_ID/profile.jpg
      final path = 'profile_images/${user.uid}/profile.jpg';
      final ref = _storage.ref().child(path);

      UploadTask uploadTask = ref.putFile(imageFile);
      TaskSnapshot snapshot = await uploadTask;

      // 3. Yüklenen resmin indirme URL'ini al
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      print("Resim yükleme hatası: $e");
      return null;
    }
  }
}