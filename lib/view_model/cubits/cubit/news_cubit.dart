import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/new_model.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) {
    return BlocProvider.of(context);
  }

  TextEditingController searchController = TextEditingController();
  List<New> allNews = [];
  final Dio dio = Dio();

  void callApiRequest() async {
    allNews.clear();
    emit(NewsLoadingState());
    try {
      final Response response =
          await dio.get('https://newsapi.org/v2/everything', queryParameters: {
        'q': searchController.text,
        'apiKey': 'd7d6828378c246859f8b05155e92a3b3',
      });

      log(jsonEncode(response.data));

      for (var i in response.data['articles']) {
        allNews.add(New.fromJson(i));
      }
      emit(NewsSuccessState());
    } catch (e) {
      print(e);
      emit(NewsFailureState());
    }
  }
}
