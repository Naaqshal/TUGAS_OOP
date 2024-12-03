import 'mahasiswa.dart';
import 'mata_kuliah.dart';

class Nilai {
  Map<Mahasiswa, Map<MataKuliah, double>> nilaiMahasiswa = {};

  void inputNilai(Mahasiswa mahasiswa, MataKuliah mataKuliah, double nilai) {
    if (!nilaiMahasiswa.containsKey(mahasiswa)) {
      nilaiMahasiswa[mahasiswa] = {};
    }
    nilaiMahasiswa[mahasiswa]![mataKuliah] = nilai;
  }

  double hitungIPK(Mahasiswa mahasiswa) {
    if (!nilaiMahasiswa.containsKey(mahasiswa)) {
      print('Mahasiswa belum memiliki nilai.');
      return 0.0;
    }
    double totalNilai = 0.0;
    int totalSKS = 0;
    nilaiMahasiswa[mahasiswa]!.forEach((mk, nilai) {
      totalNilai += nilai * mk.sks;
      totalSKS += mk.sks;
    });
    return totalSKS > 0 ? totalNilai / totalSKS : 0.0;
  }

  void cetakTranskrip(Mahasiswa mahasiswa) {
    if (!nilaiMahasiswa.containsKey(mahasiswa)) {
      print('Mahasiswa belum memiliki nilai.');
      return;
    }
    print('\nTranskrip Nilai Mahasiswa: ${mahasiswa}');
    print('Mata Kuliah dan Nilai:');
    nilaiMahasiswa[mahasiswa]!.forEach((mk, nilai) {
      print('- ${mk.nama}: $nilai');
    });
    print('IPK: ${hitungIPK(mahasiswa).toStringAsFixed(2)}');
  }
}
