import 'dart:io';

class Barbershop {
  String nama;
  List<String> jadwal;
  String waktuBuka;
  String waktuTutup;
  Map<int, String> layanan;

  // Konstruktor untuk menginisialisasi barbershop dengan nama, jadwal, waktu buka, waktu tutup, dan layanan
  Barbershop(this.nama, this.jadwal, this.waktuBuka, this.waktuTutup, this.layanan);

  // Metode untuk memeriksa apakah tanggal dan waktu tertentu tersedia
  bool cekKetersediaan(String tanggal, String waktu) {
    return !jadwal.contains("$tanggal $waktu");
  }

  // Metode untuk memeriksa apakah waktu reservasi berada dalam rentang waktu buka dan tutup
  bool dalamJamOperasional(String waktu) {
    return waktu.compareTo(waktuBuka) >= 0 && waktu.compareTo(waktuTutup) <= 0;
  }

  // Metode untuk membuat reservasi jika tanggal dan waktu yang ditentukan tersedia dan dalam jam operasional
  void buatReservasi(String namaPemesan, String tanggal, String waktu, int pilihanLayanan) {
    if (dalamJamOperasional(waktu)) {
      if (cekKetersediaan(tanggal, waktu)) {
        jadwal.add("$tanggal $waktu");
        print("Reservasi untuk $namaPemesan di $nama pada pukul $waktu di tanggal $tanggal berhasil.");
        print("Pilihan layanan: ${layanan[pilihanLayanan]}");
      } else {
        print("Maaf, pukul $waktu di tanggal $tanggal tidak tersedia.");
      }
    } else {
      print("Maaf, waktu $waktu di luar jam operasional ($waktuBuka - $waktuTutup).");
    }
  }
}

// Fungsi utama untuk mendemonstrasikan penggunaan kelas Barbershop
void main() {
  // Mendefinisikan layanan yang tersedia dengan angka yang sesuai
  var layanan = {
    1: 'Hair Colour',
    2: 'Hair Cut',
    3: 'Creambath',
    4: 'Smoothing'
  };

  // Membuat instance dari Barbershop dengan jadwal awal, waktu buka, waktu tutup, dan layanan
  var barbershop1 = Barbershop("Gibbb Barbershop", ["2024-10-10 12:00", "2024-10-10 23:00"], "12:00", "23:00", layanan);

  // Meminta input dari pengguna untuk nama pemesan
  print("Masukkan nama pemesan:");
  String namaPemesan = stdin.readLineSync() ?? "";

  // Meminta input dari pengguna untuk tanggal dan waktu reservasi
  print("Masukkan tanggal reservasi (YYYY-MM-DD):");
  String tanggal = stdin.readLineSync() ?? "";

  print("Masukkan waktu reservasi (HH:MM):");
  String waktu = stdin.readLineSync() ?? "";

  // Menampilkan pilihan layanan yang tersedia
  print("Pilih layanan yang tersedia:");
  layanan.forEach((key, value) {
    print("$key. $value");
  });
  
  int pilihanLayanan = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

  // Memeriksa apakah pilihan layanan valid
  if (layanan.containsKey(pilihanLayanan)) {
    // Mencoba membuat reservasi untuk nama pemesan, tanggal, waktu, dan pilihan layanan yang dimasukkan
    barbershop1.buatReservasi(namaPemesan, tanggal, waktu, pilihanLayanan);
  } else {
    print("Layanan yang dipilih tidak valid.");
  }
  print("Terimaksih telah menggunakan jasa kami!!!");
}
