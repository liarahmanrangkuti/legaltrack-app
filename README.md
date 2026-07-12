# 📱 LegalTrack Mobile App

## 📌 Deskripsi Aplikasi

**LegalTrack** adalah aplikasi mobile berbasis Flutter yang dirancang untuk membantu klien memantau progres pengurusan legalitas usaha (PT, CV, Yayasan, dll) secara real-time.

Aplikasi ini merupakan pengembangan dari proyek UI/UX pada Ujian Tengah Semester (UTS) yang kemudian dikembangkan lebih lanjut pada Ujian Akhir Semester (UAS) dengan penambahan fitur fungsional seperti arsitektur aplikasi, integrasi REST API, state management, local storage, dan fitur perangkat mobile.

---

## 🎨 Desain UI/UX (Figma)

🔗 https://www.figma.com/design/eJSzWzY1FxMfyvebLcNfIh/UI-UX-Mobile-App---LegalTrack?node-id=0-1&t=zV9VjPjw1lyXde7h-0

---

## 🚀 Fitur Utama

### 🔐 Login Page

* Autentikasi pengguna sederhana
* Status login disimpan menggunakan local storage

### 🏠 Home Page

* Menampilkan ringkasan informasi user
* Navigasi ke fitur utama aplikasi

### 📊 Tracking Progress (REST API)

* Menampilkan daftar progres pengurusan legalitas
* Data diambil dari REST API
* Ditampilkan dalam bentuk list

### 🔄 State Management

* Menggunakan **Provider**
* Mengelola state aplikasi secara terstruktur

### 💾 Local Storage

* Menggunakan **Shared Preferences / Secure Storage**
* Digunakan untuk:

  * Menyimpan status login
  * Menyimpan token (opsional)
  * Menyimpan data user sederhana

### 📱 Mobile Feature

(Pilih sesuai implementasi kamu)

* 📷 Camera → upload dokumen legalitas
  **atau**
* 🔔 Local Notification → pengingat progres / deadline

---

## 🏗️ Arsitektur Aplikasi

Aplikasi menggunakan pendekatan **MVC (Model-View-Controller)** dengan prinsip:

* Separation of Concerns
* Modular structure
* Reusable components

### Struktur Folder

```bash
lib/
│
├── models/
├── views/
├── controllers/
├── services/
├── providers/
├── utils/
└── main.dart
```

---

## 🌐 API Integration

Aplikasi terhubung dengan REST API untuk mengambil data progres legalitas.

Contoh endpoint:

```http
GET /progress
```

Data kemudian ditampilkan dalam bentuk list pada aplikasi.

---

## 🛠️ Teknologi yang Digunakan

* Flutter
* Dart
* Provider (State Management)
* REST API (HTTP)
* Shared Preferences / Secure Storage

---

## 📸 Screenshot Aplikasi

Tambahkan screenshot berikut:

* Login Page
* Home Page
* API List Data
* Fitur Camera / Notification

---

## ⚙️ Cara Menjalankan Project

```bash
git clone https://github.com/liarahmanrangkuti/legaltrack-app.git
cd legaltrack-app
flutter pub get
flutter run
```

---

## 👩‍💻 Developer

Nama: **Lia Rangkuti**
Program Studi: Sains Data

---

## 📌 Catatan

Project ini dibuat untuk memenuhi tugas Ujian Akhir Semester (UAS) mata kuliah Mobile Programming dan dapat dikembangkan lebih lanjut menjadi aplikasi production-ready.
