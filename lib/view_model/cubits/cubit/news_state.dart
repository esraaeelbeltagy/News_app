part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoadingState extends NewsState {}
final class NewsSuccessState extends NewsState {}
final class NewsFailureState extends NewsState {}
