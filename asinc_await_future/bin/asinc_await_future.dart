/*
Methode terdiri dari dua jenis yaitu method syncronus dan asyncronus
Syncronus adalah method yang sering kita gunakan (prosedural)
Asyncronus adalah  methode yang dijalankan gak akan ditungguin sampai selesai 
terlebih dahulu , baru ke methode selanjutnya.
jadi setelah dipanggil dan dikerjakan , lalu lewat keperintah selanjutnya 
tanpa menunggu perintah tsb selesai.

penambahan keyword async , menjadikan suatu methode menjadi asyncronus , 
yang artinya methode yang dijalankan gak akan ditungguin sampai selesai 
terlebih dahulu , baru ke methode selanjutnya.
jadi setelah dipanggil dan dikerjakan , lalu lewat keperintah selanjutnya 
tanpa menunggu perintah tsb selesai.
Tujuannya : 
Agar UI yang kita bangun nanti , saat dijalankan tidak tampak ngelag atau ngehank,
karena menunggu perintah yang gak selesai selesai , jadi supaya tampak lebih
responsive , tanpa mengabaikan 1 perintah apapun .

jika memang harus menunggu sampai selesai perintah nya , kita bisa memasang
keyword "await" ataupun "then" . maka otomatis akan menuggu perintah yang 
dijalanlan sampai selesai terlebih dahulu
*/
void main(List<String> arguments) async {
  print('\n');
  print('Hello world');

  var p = Person();
  var q = Person();
  var r = Person();

  print('Perintah tanpa methode await Program ke-1 ');
  print('Job 1');
  print('Job 2');
  p.getDataAsync();
  print('JOb 3 ' + p.name);
  print('Job 4');

  print('------------------------------------');
  print('Perintah dengan await Program ke-2 ');
  print('Job 1');
  print('Job 2');
  await q.getDataAsync();
  print('JOb 3 :' + q.name);
  print('Job 4');
  /*
  dengan menambahkan methode await , maka perintah
   await "q.getDataAsync();"" akan diselesaikan terlebih dahulu ,
   selanjutnya melanjutkan perintah job 3 dan job 4 .jadi 2 perintah
   tsb harus menuggu beberapa saat terlebih dahulu
  */

  print('------------------------------------');
  print('Perintah dengan menggunakan then Program ke-3');
  print('Job 1');
  print('Job 2');
  r.getDataAsync().then((_) {
    print('Job 3 ' + r.name);
  });
  print('Job 4');
  /* 
  penambahan keyword " then((value) => ) "(syntax default then)
  perintah ini memiliki parameter value yang harus diisi , value ini 
  merupakan kembalian dari methode getDataAsync . karena type kembalian nya void , 
  maka didalam methode then kita tambahkan parameter underScore (_) , artinya 
  kita tidak memerlukan value , karena void tidak mengembalikan apapun . 
  selanjutnya
  methode then ini , artinya tidak harus menunggu perintah ini selesai dijalankan , 
  baru lanjut keperintah berikutnya . perintah yang memilik keyword then , akan tetap 
  dijalankan tanpa harus menunggu selesai . jadi kita bisa lanjut keperintah selanjutnya 
  yaitu job 4 .
  namun, semua yang ada didalam method then(){},
  wajib menunggu perintah didepan nya selesai terlebih dahulu. baru dikerjakan.
  dalam persoalan ini , yang harus ditunggu adalah method r.getDataAsync() baru then dikerjakan
  */
  ;
}

/*Future artinya data yang dipanggil gak akan langsung kembali ,
  mungkin harus menunggu beberapa milisecond 
  type void ini bisa diubah2 menjadi int string dll , tergantung
  type kembaliannya yang diperlukan apa . void artinya tidak mengembalikan apapun.
  */

class Person {
  String name = 'Default name';

  Future<void> getDataAsync() async {
    /*methode await ini , bertujuan untuk membuat program kita menunggu beberapa saat
    sampai perintah yang dijalankan selesai terlebih dahulu*/
    await Future.delayed(Duration(seconds: 1)); // durasi menunggu
    name = 'Barochatul Mauludy'; // Misalnya ambil data dari database
    print('get data [Done]');
  }
}
