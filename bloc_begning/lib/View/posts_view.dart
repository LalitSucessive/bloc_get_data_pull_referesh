import 'package:bloc_begning/bloc/posts_bloc.dart';
import 'package:bloc_begning/Model/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsView extends StatelessWidget {
  const PostsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Get Data From API BLOC')),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          print('object${state}');
          if (state is LoadedState) {
            return RefreshIndicator(
              onRefresh: () async {
                state.posts = [];
                BlocProvider.of<PostsBloc>(context).add(PullToRefereshEvent());
              },
              child: ListView.builder(
                  itemCount: state.posts.length,
                  itemBuilder: ((context, index) {
                    Post posts = state.posts[index];

                    return Card(
                      child: ExpansionTile(
                        leading: CircleAvatar(
                          child: Text(posts.id.toString()),
                        ),
                        title: Text(
                          posts.title,
                          maxLines: 1,
                        ),
                        // subtitle: Text(
                        //   posts.body,
                        //   maxLines: 2,
                        // ),
                        children: [
                          ListTile(
                            subtitle: Text(posts.body),
                          )
                        ],
                      ),
                    );
                  })),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
