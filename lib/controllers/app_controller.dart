import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/legal_progress.dart';
import '../services/api_service.dart';

class AppController extends ChangeNotifier {
  bool isLoggedIn = false;
  bool isLoading = false;

  String userEmail = '';
  String? errorMessage;
  String? capturedFileName;

  List<LegalProgress> progressList = [];

  Future<void> initialize() async {
    final preferences = await SharedPreferences.getInstance();

    isLoggedIn = preferences.getBool('isLoggedIn') ?? false;
    userEmail = preferences.getString('userEmail') ?? '';

    notifyListeners();
  }

  Future<bool> login({required String email, required String password}) async {
    errorMessage = null;

    if (email.trim().isEmpty || password.trim().isEmpty) {
      errorMessage = 'Email dan password wajib diisi.';
      notifyListeners();
      return false;
    }

    isLoading = true;
    notifyListeners();

    await Future<void>.delayed(const Duration(milliseconds: 700));

    final preferences = await SharedPreferences.getInstance();

    await preferences.setBool('isLoggedIn', true);
    await preferences.setString('userEmail', email.trim());

    userEmail = email.trim();
    isLoggedIn = true;
    isLoading = false;

    notifyListeners();
    return true;
  }

  Future<void> logout() async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.remove('isLoggedIn');
    await preferences.remove('userEmail');

    isLoggedIn = false;
    userEmail = '';
    progressList = [];
    capturedFileName = null;
    errorMessage = null;

    notifyListeners();
  }

  Future<void> fetchProgress() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      progressList = await ApiService.fetchLegalProgress();
    } catch (error) {
      errorMessage = 'Data gagal dimuat. Periksa koneksi internet.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> takeDocumentPhoto() async {
    errorMessage = null;

    try {
      final picker = ImagePicker();

      final photo = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 70,
      );

      if (photo != null) {
        capturedFileName = photo.name;
      }
    } catch (error) {
      errorMessage = 'Camera tidak tersedia pada perangkat atau browser ini.';
    }

    notifyListeners();
  }
}
