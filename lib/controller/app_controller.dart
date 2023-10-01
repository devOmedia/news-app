import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/model/news_response_model.dart';
import 'package:riverpod/riverpod.dart';

class AppController extends ChangeNotifier {
  Dio dio = Dio();
  final url = "https://newsapi.org/v2/everything?q=tesla&from=2023-08-29&sortBy=publishedAt&apiKey=83b2078be3aa4e0cb6342eac00a5fd26";

  Future<Response> getData(String url, String token) => dio.get(
        url,
        options: Options(
          sendTimeout: const Duration(milliseconds: 10000),
          receiveTimeout: const Duration(milliseconds: 10000),
          headers: {"Authorization": "Bearer $token"},
        ),
      );

  Future<NewsDataModel?> fetchNewsData() async{

    try{
      final response = await getData(url, "");
      if(response.statusCode == 200){
        log(response.data);
        return NewsDataModel.fromJson(response.data);
      }

    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        print('Timeout error');
      } else if (e.type == DioExceptionType.badResponse) {
        print('Response error: ${e.response?.statusCode}');
        if (e.response?.statusCode == 400) {

        }
      } else if (e.type == DioExceptionType.cancel) {
        print('Request cancelled');
      } else {
        print('Other error: $e');
      }
    }

  }

}

final provider = Provider<AppController>((ref) => AppController());

final controller = FutureProvider<NewsDataModel?>((ref) => ref.watch(provider).fetchNewsData());
