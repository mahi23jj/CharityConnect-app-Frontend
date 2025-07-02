class TicketOption {
  final String ticketOptionName;
  final double ticketOptionPrice;

  TicketOption({
    required this.ticketOptionName,
    required this.ticketOptionPrice,
  });

  // Optional: for JSON or API support
  factory TicketOption.fromJson(Map<String, dynamic> json) {
    return TicketOption(
      ticketOptionName: json['ticketOptionName'],
      ticketOptionPrice: json['ticketOptionPrice'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ticketOptionName': ticketOptionName,
      'ticketOptionPrice': ticketOptionPrice,
    };
  }
}


