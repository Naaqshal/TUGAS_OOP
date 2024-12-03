import 'dart:io';
import '../lib/akademik/mahasiswa.dart';
import '../lib/akademik/mata_kuliah.dart';
import '../lib/akademik/krs.dart';
import '../lib/akademik/nilai.dart';

void main() {
  var nilai = Nilai();
  var daftarMahasiswa = <Mahasiswa>[];
  var daftarMataKuliah = <MataKuliah>[];

  while (true) {
    print('\n=== Sistem Akademik ===');
    print('1. Tambah Mahasiswa');
    print('2. Tambah Mata Kuliah');
    print('3. Buat KRS');
    print('4. Input Nilai');
    print('5. Lihat Transkrip Nilai');
    print('6. Keluar');
    stdout.write('Pilih menu: ');
    var pilihan = stdin.readLineSync();

    switch (pilihan) {
      case '1':
        // Tambah Mahasiswa
        stdout.write('Masukkan NIM: ');
        var nim = stdin.readLineSync();
        stdout.write('Masukkan Nama: ');
        var nama = stdin.readLineSync();
        stdout.write('Masukkan Semester: ');
        var semester = int.tryParse(stdin.readLineSync() ?? '0');
        if (nim != null && nama != null && semester != null) {
          daftarMahasiswa.add(Mahasiswa(nim, nama, semester));
          print('Mahasiswa berhasil ditambahkan!');
        } else {
          print('Input tidak valid.');
        }
        break;

      case '2':
        // Tambah Mata Kuliah
        stdout.write('Masukkan Kode Mata Kuliah: ');
        var kode = stdin.readLineSync();
        stdout.write('Masukkan Nama Mata Kuliah: ');
        var nama = stdin.readLineSync();
        stdout.write('Masukkan Jumlah SKS: ');
        var sks = int.tryParse(stdin.readLineSync() ?? '0');
        if (kode != null && nama != null && sks != null) {
          daftarMataKuliah.add(MataKuliah(kode, nama, sks));
          print('Mata Kuliah berhasil ditambahkan!');
        } else {
          print('Input tidak valid.');
        }
        break;

      case '3':
        // Buat KRS
        if (daftarMahasiswa.isEmpty || daftarMataKuliah.isEmpty) {
          print('Data mahasiswa atau mata kuliah kosong.');
          break;
        }
        print('\nDaftar Mahasiswa:');
        for (var i = 0; i < daftarMahasiswa.length; i++) {
          print('${i + 1}. ${daftarMahasiswa[i]}');
        }
        stdout.write('Pilih Mahasiswa (nomor): ');
        var indeksMhs = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;
        if (indeksMhs < 1 || indeksMhs > daftarMahasiswa.length) {
          print('Pilihan tidak valid.');
          break;
        }
        var mahasiswa = daftarMahasiswa[indeksMhs - 1];
        var krs = KRS(mahasiswa);

        print('\nDaftar Mata Kuliah:');
        for (var i = 0; i < daftarMataKuliah.length; i++) {
          print('${i + 1}. ${daftarMataKuliah[i]}');
        }
        stdout.write('Pilih Mata Kuliah (nomor, pisahkan dengan koma): ');
        var pilihanMK = stdin.readLineSync()?.split(',');
        if (pilihanMK != null) {
          for (var mk in pilihanMK) {
            var indeksMK = int.tryParse(mk.trim()) ?? 0;
            if (indeksMK >= 1 && indeksMK <= daftarMataKuliah.length) {
              krs.tambahMataKuliah(daftarMataKuliah[indeksMK - 1]);
            }
          }
          print('KRS berhasil dibuat!');
          krs.cetakKRS();
        }
        break;

      case '4':
        // Input Nilai
        if (daftarMahasiswa.isEmpty || daftarMataKuliah.isEmpty) {
          print('Data mahasiswa atau mata kuliah kosong.');
          break;
        }
        print('\nDaftar Mahasiswa:');
        for (var i = 0; i < daftarMahasiswa.length; i++) {
          print('${i + 1}. ${daftarMahasiswa[i]}');
        }
        stdout.write('Pilih Mahasiswa (nomor): ');
        var indeksMhsNilai = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;
        if (indeksMhsNilai < 1 || indeksMhsNilai > daftarMahasiswa.length) {
          print('Pilihan tidak valid.');
          break;
        }
        var mahasiswaNilai = daftarMahasiswa[indeksMhsNilai - 1];

        print('\nDaftar Mata Kuliah:');
        for (var i = 0; i < daftarMataKuliah.length; i++) {
          print('${i + 1}. ${daftarMataKuliah[i]}');
        }
        stdout.write('Pilih Mata Kuliah (nomor): ');
        var indeksMKNilai = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;
        if (indeksMKNilai < 1 || indeksMKNilai > daftarMataKuliah.length) {
          print('Pilihan tidak valid.');
          break;
        }
        var mataKuliah = daftarMataKuliah[indeksMKNilai - 1];
        stdout.write('Masukkan Nilai (0.0 - 4.0): ');
        var nilaiInput = double.tryParse(stdin.readLineSync() ?? '0.0');
        if (nilaiInput != null && nilaiInput >= 0.0 && nilaiInput <= 4.0) {
          nilai.inputNilai(mahasiswaNilai, mataKuliah, nilaiInput);
          print('Nilai berhasil dimasukkan!');
        } else {
          print('Nilai tidak valid.');
        }
        break;

      case '5':
        // Lihat Transkrip Nilai
        if (daftarMahasiswa.isEmpty) {
          print('Data mahasiswa kosong.');
          break;
        }
        print('\nDaftar Mahasiswa:');
        for (var i = 0; i < daftarMahasiswa.length; i++) {
          print('${i + 1}. ${daftarMahasiswa[i]}');
        }
        stdout.write('Pilih Mahasiswa (nomor): ');
        var indeksMhsTranskrip = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;
        if (indeksMhsTranskrip < 1 || indeksMhsTranskrip > daftarMahasiswa.length) {
          print('Pilihan tidak valid.');
          break;
        }
        var mahasiswaTranskrip = daftarMahasiswa[indeksMhsTranskrip - 1];
        nilai.cetakTranskrip(mahasiswaTranskrip);
        break;

      case '6':
        print('Keluar dari program.');
        return;

      default:
        print('Pilihan tidak valid.');
    }
  }
}
