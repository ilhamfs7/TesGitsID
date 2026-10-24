// Penyelesaian Rumus Highest Palindrome

import 'dart:io';

bool cekAngka(String s, int i) {
  if (i == s.length) return true;
  int c = s.codeUnitAt(i);
  if (c < 48 || c > 57) return false;
  return cekAngka(s, i + 1);
}

int hitungPerubahan(List<String> d, int kiri, int kanan) {
  if (kiri >= kanan) return 0;
  int biaya = 0;
  if (d[kiri] != d[kanan]) {
    String terbesar = d[kiri].compareTo(d[kanan]) > 0 ? d[kiri] : d[kanan];
    d[kiri] = terbesar;
    d[kanan] = terbesar;
    biaya = 1;
  }
  return biaya + hitungPerubahan(d, kiri + 1, kanan - 1);
}

void ubahSusunanAngka(List<String> t, String s, int i, int j, int k) {
  if (i > j) return;
  if (i == j) {
    if (k >= 1) t[i] = '9';
    return;
  }
  if (t[i] != '9') {
    int butuh = (s[i] != s[j]) ? 1 : 2;
    if (k >= butuh) {
      t[i] = '9';
      t[j] = '9';
      k -= butuh;
    }
  }
  ubahSusunanAngka(t, s, i + 1, j - 1, k);
}

String cekPalindrome(String s, int k) {
  if (s.isEmpty || k < 0 || !cekAngka(s, 0)) return '-1';
  List<String> t = s.split('');
  int perubahan = hitungPerubahan(t, 0, t.length - 1);
  if (perubahan > k) return '-1';
  ubahSusunanAngka(t, s, 0, t.length - 1, k - perubahan);
  return t.join('');
}

void main() {
  stdout.write('Masukkan angka: ');
  final angka = stdin.readLineSync()!;
  stdout.write('Masukkan jumlah perubahan maksimal (k): ');
  final k = int.parse(stdin.readLineSync()!);
  print(cekPalindrome(angka, k));
}