import 'package:dio/dio.dart';
import 'package:travel/Charity/Model/org_profile.dart';

class Charityrepo {
  Future<OrganizationProfile> getcharitydetail(String id) async {
    final dio = Dio();

    try {
      final response = await dio.get('http://localhost:5000/api/profile/charity/get/${id}');

      final data = response.data;

      return OrganizationProfile.fromJson(data);
    } catch (e) {
      throw Exception('Error:${e.toString()}');
    }
  }
}
