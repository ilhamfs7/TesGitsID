// Penyelesaian Rumus Dense Ranking

import 'dart:io';
import 'dart:math';

List<int> denseRanking(List<int> nilaiPemain, List<int> nilaiPermainan) {
  final papan = nilaiPemain.toSet().toList();
  papan.sort((x, y) => y.compareTo(x));

  final hasil = <int>[];
  for (final nilai in nilaiPermainan) {
    var peringkat = 1;
    for (final n in papan) {
      if (n > nilai) {
        peringkat++;
      } else {
        break; 
      }
    }
    hasil.add(peringkat);
  }
  return hasil;
}

void main() {
  stdout.write('Masukkan jumlah pemain: ');
  final jumlahPemain = int.parse(stdin.readLineSync()!);

  final randomNilaiPemain = Random();
  final nilaiPemain = List.generate(jumlahPemain, (_) => randomNilaiPemain.nextInt(11) * 10);
  print(nilaiPemain);

  stdout.write('Masukkan jumlah permainan yang akan diikuti: ');
  final jumlahPermainan = int.parse(stdin.readLineSync()!);

  final randomNilaiPermainan = Random();
  final nilaiPermainanDiikuti = List.generate(jumlahPermainan, (_) => randomNilaiPermainan.nextInt(11) * 10);
  print(nilaiPermainanDiikuti);

  print(denseRanking(nilaiPemain, nilaiPermainanDiikuti));
}