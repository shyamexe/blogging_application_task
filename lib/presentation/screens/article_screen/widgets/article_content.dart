import 'package:blogging_application/core/constants/styles.dart';
import 'package:blogging_application/logic/post_content_cubit/post_content_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_html/flutter_html.dart';

class ArticleContent extends StatelessWidget {
  const ArticleContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: SvgPicture.asset('assets/icons/back_svg.svg'),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/options_svg.svg'))
          ],
        ),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: BlocBuilder<PostContentCubit, PostContentState>(
              builder: (context, state) {
                if(state is PostContentLoaded){
                  return Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.all(20),
                    //   child: Text(
                    //     'Unlocking Web 3.0',
                    //     style: AppTextStyle.title,
                    //   ),
                    // ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(13),
                              child: SizedBox(
                                height: 40,
                                width: 40,
                                child: Image.network(
                                  'https:${state.postData.author!.image!.url}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 2),
                                    child: Text(
                                      '${state.postData.author!.displayName}',
                                      style: AppTextStyle.userTitleblue,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 3),
                                    child: Text(
                                      '${state.postData.published}',
                                      style: AppTextStyle.userTimeGrey,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                            IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                    'assets/icons/share_icon.svg')),
                            IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                    'assets/icons/save_svg.svg')),
                          ],
                        )),
                    // AppWIdget.sizeHeight20,
                    // Center(
                    //     child: Image.asset(
                    //   'assets/images/articlebg.png',
                    //   fit: BoxFit.fitWidth,
                    // )),
                    AppWIdget.sizeHeight20,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        '${state.postData.title}',
                        style: AppTextStyle.articleTitle,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                    AppWIdget.sizeHeight20,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Html(data: state.postData.content,)
                    )
                  ],
                );
                }else if(state is PostContentLoading){
                  return const Center(child: CircularProgressIndicator());
                }else{
                  return const Center(child: Text('please relode'),);
                }
              },
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          width: 90,
          child: ElevatedButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/like_outline.svg',
                  color: Colors.white,
                ),
                AppWIdget.sizeWidth10,
                Text(
                  '2.5k',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ));
  }
}
