import 'dart:io';

String cekNilai(int nilai) {
  if (nilai > 70) {
    return "Nilai A";
  } else if (nilai > 40 && nilai <= 70) {
    return "Nilai B";
  } else if (nilai > 0 && nilai <= 40) {
    return "Nilai C";
  } else {
    return "";
  }
}

void main() {
  print("Masukkan nilai: ");
  int? input = int.parse(stdin.readLineSync()!); 
  String hasil = cekNilai(input);

  if (hasil.isNotEmpty) {
    print("$input merupakan $hasil");
  } else {
    print("Nilai tidak valid.");
  }
}
