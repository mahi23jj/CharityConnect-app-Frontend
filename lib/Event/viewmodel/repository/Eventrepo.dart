import 'package:dio/dio.dart';
import 'package:travel/Event/Model/event_model.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;

class Eventrepo {
  Future<List<Eventmodel>> getEvent(String? search, String? location,
      String? category, List<String>? supportGroups) async {
    final dio = Dio();

    final Map<String, dynamic> query = {
      'type': 'upcoming',
      if (search != null && search.isNotEmpty) 'search': search,
      if (location != null && location.isNotEmpty) 'location': location,
      if (category != null && category.isNotEmpty) 'category': category,
      if (supportGroups != null && supportGroups.isNotEmpty)
        'supportgroup': supportGroups,
    };

    try {
      final response = await dio.get('https://localhost:5000/api/event/get',
          queryParameters: query);

      return response.data.map((e) => Eventmodel.fromMap(e)).toList();
    } catch (e) {
      throw Exception('Failed to load event');
    }



    // if (response.statusCode == 200) {
    //    List data = json.decode(response.body);
    //   return data.map((e) => Eventmodel.fromMap(e)).toList();
    // }else{

    // }
  }
}
