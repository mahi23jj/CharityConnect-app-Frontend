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
            'supportgroup': supportGroups.join(','),
    };

    try {
      final response = await dio.get('http://localhost:5000/api/events/get',
          queryParameters: query);

    
           final List<dynamic> rawData = response.data;
         

      return rawData.map((e) => Eventmodel.fromMap(e)).toList();
    } catch (e) {
      throw Exception('Failed to load event: ${e.toString()}');
    }
  }

  Future<Eventmodel> getEventbyId(String id) async {
    final dio = Dio();

    try {
      final response =
          await dio.get('http://localhost:5000/api/events/get/$id');
      if (response.statusCode == 200) {
        final data = response.data;
        print(data);
        return Eventmodel.fromMap(data);
      } else {
        throw Exception('Failed to load event');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
}
