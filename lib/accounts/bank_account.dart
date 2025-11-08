// bank_account.dart
// Abstract base class: encapsulation + abstraction + simple history

abstract class BankAccount {
  // private fields (encapsulation)
  String _accountNumber;
  String _accountHolderName;
  double _balance;

  // basic transaction history
  final List<String> _transactions = [];

  // constructor
  BankAccount(this._accountNumber, this._accountHolderName, this._balance);

  // ------------------------
  // Getters (as requested)
  String get getAccountNumber {
    return _accountNumber;
  }

  String get getAccountHolderName {
    return _accountHolderName;
  }

  double get getBalance {
    return _balance;
  }

  // Read-only transactions list
  List<String> get getTransactions {
    return List.unmodifiable(_transactions);
  }

  // ------------------------
  // Setters (as requested)
  set setAccountNumber(String accountNumber) {
    _accountNumber = accountNumber;
  }

  set setAccountHolderName(String accountHolderName) {
    _accountHolderName = accountHolderName;
  }

  set setBalance(double balance) {
    _balance = balance;
  }

  // helper to add a history entry
  void addTransaction(String info) {
    _transactions.add(info);
  }

  // abstract operations
  void deposit(double amount);
  void withdraw(double amount);

  // shared display
  void displayAccountInfo() {
    print("-----------------------------------");
    print("Account Number: $_accountNumber");
    print("Account Holder: $_accountHolderName");
    print("Balance: \$${_balance.toStringAsFixed(2)}");
    print("-----------------------------------");
  }
}
