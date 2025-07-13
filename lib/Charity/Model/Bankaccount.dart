class BankAccount {
  final String bankName;
  final int accountNumber;

  BankAccount({
    required this.bankName,
    required this.accountNumber,
  });

  factory BankAccount.fromJson(Map<String, dynamic> json) {
    return BankAccount(
      bankName: json['bank_name'],
      accountNumber: json['account_number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bank_name': bankName,
      'account_number': accountNumber,
    };
  }
}

