part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostsInitial extends PostsState {}

class LoadingState extends PostsState {}

class LoadedState extends PostsState {
  List<Post> posts;

  LoadedState({required this.posts});
}

class FaildToLoadState extends PostsState {
  String error;
  FaildToLoadState({required this.error});
}
