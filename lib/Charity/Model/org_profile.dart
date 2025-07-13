import 'package:travel/Charity/Model/Bankaccount.dart';
import 'package:travel/Charity/Model/address.dart';

class OrganizationProfile {
  final String orgName;
  final String orgEmail;
  final List<int> orgPhoneNo;
  final String? orgProfilePic;
  final String orgDescription;
  final String orgValidation;
  final List<String> orgSpecialization;
  final List<BankAccount> bankAccounts;
  final bool isVerified;
  final DateTime createdAt;
  final List<String>? certifications;
  final List<Address> address;
  final String? websiteUrl;
  final String? orgTelegram;
  final String? orgFacebook;
  final String? orgInstagram;
  final String? orgWhatsapp;

  OrganizationProfile({
    required this.orgName,
    required this.orgEmail,
    required this.orgPhoneNo,
    this.orgProfilePic,
    required this.orgDescription,
    required this.orgValidation,
    required this.orgSpecialization,
    required this.bankAccounts,
    required this.isVerified,
    required this.createdAt,
    this.certifications,
    required this.address,
    this.websiteUrl,
    this.orgTelegram,
    this.orgFacebook,
    this.orgInstagram,
    this.orgWhatsapp,
  });

  factory OrganizationProfile.fromJson(Map<String, dynamic> json) {
    return OrganizationProfile(
      orgName: json['org_name'],
      orgEmail: json['org_email'],
      orgPhoneNo: List<int>.from(json['org_phoneno']),
      orgProfilePic: json['org_profilepic'],
      orgDescription: json['org_discription'],
      orgValidation: json['org_validation'],
      orgSpecialization: List<String>.from(json['org_specilalization']),
      bankAccounts: (json['bank_accounts'] as List)
          .map((e) => BankAccount.fromJson(e))
          .toList(),
      isVerified: json['is_verified'],
      createdAt: DateTime.parse(json['created_at']),
      certifications: json['certifications'] != null
          ? List<String>.from(json['certifications'])
          : null,
      address:
          (json['address'] as List).map((e) => Address.fromJson(e)).toList(),
      websiteUrl: json['website_url'],
      orgTelegram: json['org_telegram'],
      orgFacebook: json['org_facebook'],
      orgInstagram: json['org_instagram'],
      orgWhatsapp: json['org_whatsapp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'org_name': orgName,
      'org_email': orgEmail,
      'org_phoneno': orgPhoneNo,
      'org_profilepic': orgProfilePic,
      'org_discription': orgDescription,
      'org_validation': orgValidation,
      'org_specilalization': orgSpecialization,
      'bank_accounts': bankAccounts.map((e) => e.toJson()).toList(),
      'is_verified': isVerified,
      'created_at': createdAt.toIso8601String(),
      'certifications': certifications,
      'address': address.map((e) => e.toJson()).toList(),
      'website_url': websiteUrl,
      'org_telegram': orgTelegram,
      'org_facebook': orgFacebook,
      'org_instagram': orgInstagram,
      'org_whatsapp': orgWhatsapp,
    };
  }
}
