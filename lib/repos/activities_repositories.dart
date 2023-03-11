import 'dart:convert';
import 'package:condominios/models/activity_model.dart';
import 'package:condominios/models/user_model.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

class ActivitiesRepository {
  String userUrl = 'https://reqres.in/api/users?page=2';

  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(userUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<ActivityModel>> getActivities() async {
    String data = await rootBundle.loadString('assets/activities.json');

    final List<ActivityModel> activities = (json. decode(data) as List)
        .map((e) => ActivityModel.fromJson(e))
        .toList();
    return activities;
  }
}
