// Penyelesaian Rumus A000124 Sloane's OEIS

import 'dart:io';

List<int> rumus(int a) {
  List<int> hasil = [];
  for (int n = 0; n < a; n++) {
    hasil.add(((n * n) + n + 2) ~/ 2);
  }
  return hasil;
}

void main() {
  stdout.write('Masukkan Jumlah Output Bilangan Angka: ');
  String? input = stdin.readLineSync();
  int n = int.parse(input!);
  print(rumus(n).join('-'));
}