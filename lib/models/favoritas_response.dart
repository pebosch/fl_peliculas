// To parse this JSON data, do
//
//     final favoritasResponse = favoritasResponseFromMap(jsonString);

import 'dart:convert';
import 'package:fl_peliculas/models/models.dart';

class FavoritasResponse {
  FavoritasResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  factory FavoritasResponse.fromJson(String str) =>
      FavoritasResponse.fromMap(json.decode(str));

  factory FavoritasResponse.fromMap(Map<String, dynamic> json) =>
      FavoritasResponse(
        page: json["page"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
