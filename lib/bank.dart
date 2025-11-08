// bank.dart
// Bank class to manage accounts: create, find, transfer, report, apply interest

import 'accounts/bank_account.dart';
import 'accounts/savings_account.dart';
import 'accounts/checking_account.dart';
import 'accounts/premium_account.dart';
import 'accounts/student_account.dart';
import 'interfaces/interest_bearing.dart';

class Bank {
  // store all accounts here
  final List<BankAccount> _accounts = [];

  // create helpers
  SavingsAccount createSavings(String no, String name, double bal) {
    final acc = SavingsAccount(no, name, bal);
    acc.addTransaction("Account opened: Savings, balance \$${bal.toStringAsFixed(2)}");
    _accounts.add(acc);
    return acc;
  }

  CheckingAccount createChecking(String no, String name, double bal) {
    final acc = CheckingAccount(no, name, bal);
    acc.addTransaction("Account opened: Checking, balance \$${bal.toStringAsFixed(2)}");
    _accounts.add(acc);
    return acc;
  }

  PremiumAccount createPremium(String no, String name, double bal) {
    final acc = PremiumAccount(no, name, bal);
    acc.addTransaction("Account opened: Premium, balance \$${bal.toStringAsFixed(2)}");
    _accounts.add(acc);
    return acc;
  }

  StudentAccount createStudent(String no, String name, double bal) {
    final acc = StudentAccount(no, name, bal);
    acc.addTransaction("Account opened: Student, balance \$${bal.toStringAsFixed(2)}");
    _accounts.add(acc);
    return acc;
  }

  // find account by account number
  BankAccount? findByNumber(String accNo) {
    for (final a in _accounts) {
      if (a.getAccountNumber == accNo) return a;
    }
    return null;
  }

  // transfer money between two accounts
  void transfer(String fromNo, String toNo, double amount) {
    final from = findByNumber(fromNo);
    final to = findByNumber(toNo);

    if (from == null || to == null) {
      print("Transfer failed: account not found.");
      return;
    }
    if (amount <= 0) {
      print("Transfer failed: invalid amount.");
      return;
    }

    final before = from.getBalance;
    from.withdraw(amount);

    // check if withdraw succeeded (balance reduced)
    if (from.getBalance < before) {
      to.deposit(amount);
      from.addTransaction("Transferred \$${amount.toStringAsFixed(2)} to ${to.getAccountNumber}");
      to.addTransaction("Received \$${amount.toStringAsFixed(2)} from ${from.getAccountNumber}");
      print("Transfer success.");
    } else {
      print("Transfer failed: withdrawal rule blocked it.");
    }
  }
// apply interest to all interest-bearing accounts
void applyMonthlyInterest() {
  for (final a in _accounts) {
    if (a is InterestBearing) {
      (a as InterestBearing).calculateInterest();
    }
  }
}


  // generate a simple report of all accounts
  void reportAll() {
    print("======= BANK REPORT =======");
    for (final a in _accounts) {
      a.displayAccountInfo();
    }
  }

  // show transaction history of one account
  void showHistory(String accNo) {
    final a = findByNumber(accNo);
    if (a == null) {
      print("No account found.");
      return;
    }

    print("---- Transactions for ${a.getAccountNumber} ----");
    for (final t in a.getTransactions) {
      print(t);
    }
    print("---------------------------------------------");
  }
}
