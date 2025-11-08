// main.dart
// simple runner to test the system

import 'lib/bank.dart';

void main() {
  final bank = Bank();

  final k1 = bank.createSavings("K-001", "Kimti", 800);
  final s1 = bank.createChecking("S-001", "Sneha", 200);
  final a1 = bank.createPremium("A-001", "Apala", 15000);
  final a2 = bank.createStudent("A2-001", "Anjali", 1000);

  k1.deposit(200);
  k1.withdraw(300);
  k1.withdraw(50);
  k1.withdraw(50);
  k1.withdraw(50); // should hit limit

  s1.withdraw(500); // overdraft + fee
  s1.deposit(1000);

  a1.withdraw(6000); // must keep >= 10,000
  a1.deposit(500);

  a2.deposit(4500); // will block if exceeds 5000
  a2.withdraw(200);

  bank.transfer("C-001", "S-001", 150);

  bank.applyMonthlyInterest();
  bank.reportAll();

  bank.showHistory("C-001");
  bank.showHistory("S-001");
}
