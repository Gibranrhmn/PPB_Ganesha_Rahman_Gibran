//void main() {
  // String firstName = 'praktikum';
  // var lastName = 'PPB';
  // final cuaca = 'Cerah';

  // print('Hari ini $firstName $lastName');


// IF-ELSE
//   var open = 8;
//   var close = 17;
//   var now = 10;

//   if (now > open && now < close){
//     print("Toko Buka");
//   } else if (now == 12){
//     print("Toko Sedang Istirahat");
//   } else {
//     print("Toko Tutup");
//   }

// //Condition ? true : false
//   var toko = now > open? "Toko Buka" : "Toko Tutup";
//   print(toko);

// // Switch Case
//   var day = 'b';

//   switch (day){
//     case 'a':
//     print('Nilai Sangat Bagus');
//     break;
//     case 'b':
//     print('Nilai Bagus');
//     break;
//     case 'c':
//     print('Nilai Cukup');
//     break;
//     default:
//     print('Nilai Tidak Tersedia');
//   }

//Looping
  //  for (int i=0; i <= 100, i++){
  //   print(i);
  //  }

  // int i = 1;

  // while(i <= 5){
  //   print('Angka: $i');
  //   i++;
  // }

//List
  // List<int> fixedList = List.filled(3, 0);

  // fixedList[0] =10;
  // fixedList[1] =20;
  // fixedList[2] =30;

  // print('Fixed Lenght List: $fixedList');
  // fixedList.removeAt(30);
  // print('After removing element at index 30: $fixedList');

  // List<int> growableList = [];

  // growableList.add(10);
  // growableList.add(20);
  // growableList.add(30);

  // growableList.add(50);
  // growableList.add(70);
  // growableList.add(90);

  // print(growableList);
  // growableList.remove(20);

  // print(growableList);
  
//}

void cetakPesan(String pesan) {
  print (pesan);
}

int perkalian (int a, int b){
  return a*b;
}

void main (){
  int hasil = perkalian(5,4);
  print('Hasil Perkalian Fungsi $hasil');

  cetakPesan('Halo, Guys!');
}
