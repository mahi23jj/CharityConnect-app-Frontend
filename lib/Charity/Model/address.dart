class Address {
  final String country;
  final String city;
  final String subCity;
  final String? postalCode;

  Address({
    required this.country,
    required this.city,
    required this.subCity,
     this.postalCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      country: json['country'],
      city: json['city'],
      subCity: json['sub_city'],
      postalCode: json['postal_code']!=null?json['postal_code']:null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'city': city,
      'sub_city': subCity,
      'postal_code': postalCode,
    };
  }
}
