import 'dart:io';

bool cekPrima(int n) {
  if (n <= 1) return false; 
  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) return false; 
  }
  return true;
}

void main() {
  print("Masukkan bilangan bulat: ");
  int n = int.parse(stdin.readLineSync()!); 

  if (cekPrima(n)) {
    print("$n adalah bilangan prima.");
  } else {
    print("$n bukan bilangan prima.");
  }
}
