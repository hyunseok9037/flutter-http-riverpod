import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod/controller/post_controller.dart';
import 'package:http_riverpod/model/post/post.dart';
import 'package:http_riverpod/view/pages/post/home/post_home_page_view_model.dart';

class PostHomePage extends ConsumerWidget {
  const PostHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PostController pc= ref.read(postController);
    PostHomePageModel? pm = ref.watch(postHomePageProvider);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child:
              pm != null ? buildListView(pm.posts) : buildListView([]),
          ),
          ElevatedButton(
            onPressed: () {
              pc.findPosts();
            },
            child: Text("페이지로드"),
          ),
          ElevatedButton(onPressed: (){
            pc.addPost("제목4");
          },
              child: Text("한건추가")),
          ElevatedButton(onPressed: (){
            pc.removePost(1);
          },
              child: Text("한건삭제")),
          ElevatedButton(onPressed: (){
            pc.updatePost(Post(id: 2, title: "제목하하"));
          },
              child: Text("한건수정")
          ),
        ],
      ),
    );
  }

  Widget buildListView(List<Post> posts) {
    return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) => ListTile(
                leading: Text("${posts[index].id}"),
                title: Text("${posts[index].title}"),
              ),
            );
  }
}