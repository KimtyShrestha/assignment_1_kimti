// savings_account.dart
// Savings: min balance 500, 2% interest, max 3 withdrawals/month

import '../interfaces/interest_bearing.dart';
import 'bank_account.dart';

class SavingsAccount extends BankAccount implements InterestBearing {
  int _withdrawCount = 0;

  static const int maxWithdrawals = 3;
  static const double minBalance = 500.0;
  static const double interestRate = 0.02;

  SavingsAccount(String accNo, String accHolder, double bal)
      : super(accNo, accHolder, bal);

  @override
  void deposit(double amount) {
    if (amount <= 0) {
      print("Invalid amount!");
      return;
    }
    setBalance = getBalance + amount;
    addTransaction("Deposit \$${amount.toStringAsFixed(2)}");
    print("Deposited: \$${amount.toStringAsFixed(2)}");
  }

  @override
  void withdraw(double amount) {
    if (_withdrawCount >= maxWithdrawals) {
      print("Withdrawal limit reached (3 per month)");
      return;
    }
    if (amount <= 0) {
      print("Invalid withdrawal amount");
      return;
    }
    if (getBalance - amount < minBalance) {
      print("Cannot withdraw. Minimum balance of \$500 must be maintained.");
      return;
    }
    setBalance = getBalance - amount;
    _withdrawCount++;
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
    print("Account Type: Savings");
    print("Withdrawals this month: $_withdrawCount");
  }
}
