// student_account.dart
// Student: no fees, maximum balance $5000

import 'bank_account.dart';

class StudentAccount extends BankAccount {
  static const double maxBalance = 5000.0;

  StudentAccount(String accNo, String accHolder, double bal)
      : super(accNo, accHolder, bal);

  @override
  void deposit(double amount) {
    if (amount <= 0) {
      print("Invalid deposit amount");
      return;
    }
    if (getBalance + amount > maxBalance) {
      print("Cannot deposit. Maximum balance of \$5000 reached.");
      return;
    }
    setBalance = getBalance + amount;
    addTransaction("Deposit \$${amount.toStringAsFixed(2)}");
    print("Deposited: \$${amount.toStringAsFixed(2)}");
  }

  @override
  void withdraw(double amount) {
    if (amount <= 0) {
      print("Invalid withdrawal amount");
      return;
    }
    if (getBalance - amount < 0) {
      print("Insufficient balance!");
      return;
    }
    setBalance = getBalance - amount;
    addTransaction("Withdraw \$${amount.toStringAsFixed(2)}");
    print("Withdrawn: \$${amount.toStringAsFixed(2)}");
  }

  @override
  void displayAccountInfo() {
    super.displayAccountInfo();
    print("Account Type: Student");
  }
}
