import 'mahasiswa.dart';
import 'mata_kuliah.dart';

class KRS {
  Mahasiswa mahasiswa;
  List<MataKuliah> daftarMataKuliah = [];

  KRS(this.mahasiswa);

  void tambahMataKuliah(MataKuliah mataKuliah) {
    daftarMataKuliah.add(mataKuliah);
  }

  void cetakKRS() {
    print('\nKRS Mahasiswa: ${mahasiswa}');
    print('Mata Kuliah yang diambil:');
    for (var mk in daftarMataKuliah) {
      print('- $mk');
    }
  }
}
