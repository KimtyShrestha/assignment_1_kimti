// premium_account.dart
// Premium: min balance 10,000; 5% interest; unlimited withdrawals

import '../interfaces/interest_bearing.dart';
import 'bank_account.dart';

class PremiumAccount extends BankAccount implements InterestBearing {
  static const double minBalance = 10000.0;
  static const double interestRate = 0.05;

  PremiumAccount(String accNo, String accHolder, double bal)
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
    if (getBalance - amount < minBalance) {
      print("Cannot withdraw. Minimum balance of \$10,000 required.");
      return;
    }
    setBalance = getBalance - amount;
    addTransaction("Withdraw \$${amount.toStringAsFixed(2)}");
    print("Withdrawn: \$${amount.toStringAsFixed(2)}");
  }

  @override
  void calculateInterest() {
    final interest = getBalance * interestRate;
    // To credit interest automatically, uncomment next two lines
    // setBalance = getBalance + interest;
    // addTransaction("Interest credited \$${interest.toStringAsFixed(2)}");
    print("Interest earned: \$${interest.toStringAsFixed(2)}");
  }

  @override
  void displayAccountInfo() {
    super.displayAccountInfo();
    print("Account Type: Premium");
  }
}
