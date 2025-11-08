// checking_account.dart
// Checking: no withdrawal limit, overdraft allowed with $35 fee

import 'bank_account.dart';

class CheckingAccount extends BankAccount {
  static const double overdraftFee = 35.0;

  CheckingAccount(String accNo, String accHolder, double bal)
      : super(accNo, accHolder, bal);

  @override
  void deposit(double amount) {
    if (amount <= 0) {
      print("Invalid deposit amount");
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
    setBalance = getBalance - amount;

    if (getBalance < 0) {
      setBalance = getBalance - overdraftFee;
      addTransaction("Overdraft fee \$${overdraftFee.toStringAsFixed(2)}");
      print("Overdraft! Fee of \$35 charged.");
    }

    addTransaction("Withdraw \$${amount.toStringAsFixed(2)}");
    print("Withdrawn: \$${amount.toStringAsFixed(2)}");
  }

  @override
  void displayAccountInfo() {
    super.displayAccountInfo();
    print("Account Type: Checking");
  }
}
