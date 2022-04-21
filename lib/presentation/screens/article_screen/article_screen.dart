import 'package:blogging_application/logic/post_content_cubit/post_content_cubit.dart';
import 'package:blogging_application/logic/post_cubit/post_cubit.dart';
import 'package:blogging_application/presentation/screens/article_screen/widgets/article_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF4F7FF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Articles',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostLoaded) {
            return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: state.posts.items!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      BlocProvider.of<PostContentCubit>(context).getPostContent(
                          state.posts.items![index].selfLink.toString());
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BlocProvider.value(
                                value: context.read<PostContentCubit>(),
                                child: ArticleContent(),
                              )));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                  fit: FlexFit.loose,
                                  flex: 1,
                                  child: SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          "assets/images/image1.png",
                                          fit: BoxFit.cover,
                                        )),
                                  )),
                              Flexible(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Text(
                                            "${state.posts.items![index].title}",
                                            style: const TextStyle(
                                                color: Colors.blue,
                                                fontSize: 16),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 8),
                                          child: Text(
                                            "Author : ${state.posts.items![index].author!.displayName}",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey),
                                          ),
                                        ),
                                        // Text(
                                        //   'Thick Data?',
                                        //   style: TextStyle(fontSize: 15),
                                        // ),
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  );

                  //   return Card(
                  //     child: ListTile(
                  //       leading: Image.network("https:${state.posts.items![index].author!.image!.url}"),
                  //       title: Text("${state.posts.items![index].title}"),
                  //       subtitle: Text("Author : ${state.posts.items![index].author!.displayName}"),
                  //     ),
                  //   );
                });
          } else if (state is PostLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Center(child: const Text('Please restart your app!'));
          }
        },
      ),
    );
  }
}
