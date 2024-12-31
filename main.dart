void main() {
  // Create instances
  SavingsAccount savings = SavingsAccount('Alice', 1000, 5.0);
  CheckingAccount checking = CheckingAccount('Bob', 500, 200);

  // Display account details
  savings.showAccountDetails();
  print('Interest: \$${savings.calculateInterest().toStringAsFixed(2)}\n');

  checking.showAccountDetails();
  print('');

  // Perform transactions
  savings.deposit(200);
  savings.withdraw(500);

  checking.withdraw(600);
}


// Encapsulation
class BankAccount {
  // Private variables
  String _accountHolderName;
  double _balance;

  // Constructor
  BankAccount(this._accountHolderName, this._balance);

  // Getter for account holder's name
  String get accountHolderName => _accountHolderName;

  // Method to get balance
  double getBalance() => _balance;

  // Method to deposit money
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print('Deposited \$${amount.toStringAsFixed(2)}. New balance: \$${_balance.toStringAsFixed(2)}');
    } else {
      print('Deposit amount must be positive!');
    }
  }

  // Method to withdraw money
  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print('Withdrew \$${amount.toStringAsFixed(2)}. New balance: \$${_balance.toStringAsFixed(2)}');
    } else {
      print('Invalid withdrawal amount!');
    }
  }
}

// Abstract class for Accounts
abstract class Account {
  void showAccountDetails();
}

// Inheritance and Polymorphism
class SavingsAccount extends BankAccount implements Account {
  double _interestRate;

  SavingsAccount(String accountHolderName, double balance, this._interestRate)
      : super(accountHolderName, balance);

  // Override method to show details
  @override
  void showAccountDetails() {
    print('Savings Account');
    print('Account Holder: $accountHolderName');
    print('Balance: \$${getBalance().toStringAsFixed(2)}');
    print('Interest Rate: $_interestRate%');
  }

  // Additional method to calculate interest
  double calculateInterest() {
    return getBalance() * _interestRate / 100;
  }
}

class CheckingAccount extends BankAccount implements Account {
  double _overdraftLimit;

  CheckingAccount(String accountHolderName, double balance, this._overdraftLimit)
      : super(accountHolderName, balance);

  // Override method to show details
  @override
  void showAccountDetails() {
    print('Checking Account');
    print('Account Holder: $accountHolderName');
    print('Balance: \$${getBalance().toStringAsFixed(2)}');
    print('Overdraft Limit: \$${_overdraftLimit.toStringAsFixed(2)}');
  }
}


