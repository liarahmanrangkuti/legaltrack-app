# LegalTrack Mobile App

## Deskripsi Aplikasi

LegalTrack adalah aplikasi mobile berbasis Flutter yang membantu klien memantau proses pengurusan legalitas usaha secara digital.

Satu akun klien dapat digunakan untuk memantau beberapa layanan legalitas, seperti pendirian PT, perubahan akta, pendaftaran merek, NIB/OSS, dan layanan lainnya.

Aplikasi ini merupakan pengembangan dari desain UI/UX LegalTrack pada Ujian Tengah Semester dan dikembangkan menjadi aplikasi yang lebih fungsional pada Ujian Akhir Semester.

## Fitur Utama

- Login pengguna
- Penyimpanan status login menggunakan Shared Preferences
- Halaman Home
- Detail progres legalitas PT ABC
- Daftar riwayat legalitas dari REST API
- Upload dokumen menggunakan Camera/Image Picker
- Logout pengguna
- State management menggunakan Provider

## Alur Aplikasi

1. Klien melakukan login.
2. Status login disimpan menggunakan Shared Preferences.
3. Klien masuk ke halaman Home.
4. Menu View Progress menampilkan detail proses legalitas PT ABC.
5. Menu History menampilkan beberapa layanan legalitas milik klien.
6. Data pada menu History diambil dari REST API publik sebagai simulasi.
7. Menu Upload Docs menggunakan Image Picker untuk mengambil atau memilih foto dokumen.

## Software Architecture

Aplikasi menerapkan arsitektur MVC dengan pemisahan folder:

```text
lib/
├── controllers/
│   └── app_controller.dart
├── models/
│   └── legal_progress.dart
├── services/
│   └── api_service.dart
├── views/
│   ├── login_page.dart
│   ├── home_page.dart
│   ├── progress_page.dart
│   └── api_history_page.dart
└── main.dart
```

---

## Catatan

Project ini dibuat untuk memenuhi tugas Ujian Akhir Semester (UAS) mata kuliah Mobile Programming dan dapat dikembangkan lebih lanjut menjadi aplikasi production-ready.
