import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';

class AppController extends ChangeNotifier {
  Dio dio = Dio();

  Future<Response> getData(String url, String token) => dio.get(
        url,
        options: Options(
          sendTimeout: const Duration(milliseconds: 10000),
          receiveTimeout: const Duration(milliseconds: 10000),
          headers: {"Authorization": "Bearer $token"},
        ),
      );


}

final controller = Provider<AppController>((ref) => AppController());

final futureController = FutureProvider((ref) => ref.watch(controller));
