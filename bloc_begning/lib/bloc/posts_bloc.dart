import 'package:bloc/bloc.dart';
import 'package:bloc_begning/Services/data_services.dart';
import 'package:bloc_begning/Model/post.dart';
import 'package:equatable/equatable.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final DataServices _dataServices = DataServices();

  PostsBloc() : super(LoadingState()) {
    on<PostsEvent>((event, emit) async {
      if (event is LoadEvent || event is PullToRefereshEvent) {
        emit(LoadingState());
        try {
          final posts = await _dataServices.getPosts();
          emit(LoadedState(posts: posts));
        } catch (e) {
          emit(FaildToLoadState(error: e.toString()));
        }
      } else {}
    });
  }
}
