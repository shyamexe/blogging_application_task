import 'package:blogging_application/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../home_widget_screen/widgets/article_view.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  List<Color> _colors = [Color(0xFF826dc6), Color(0xFF5dd3f6)];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
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
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Card(
                  elevation: .5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Container(
                    height: size.height * 0.4,
                    child: Column(
                      children: [
                        AppWIdget.sizeHeight30,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            profilePhoto(),
                            AppWIdget.sizeWidth10,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  '@JoviDan',
                                  style: AppTextStyle.profileTag,
                                ),
                                Text(
                                  'JoviDaniel',
                                  style: AppTextStyle.homeTitle,
                                ),
                                Text(
                                  'UX Designer',
                                  style: AppTextStyle.profileJob,
                                )
                              ],
                            )
                          ],
                        ),
                        AppWIdget.sizeHeight10,
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'About Me',
                                style: AppTextStyle.profileAbout,
                              ),
                              AppWIdget.sizeHeight10,
                              Text(
                                'Madison Blackstone is a director of user experience design, with experience managing global teams.',
                                style: AppTextStyle.profileText,
                                overflow: TextOverflow.visible,
                              ),
                              AppWIdget.sizeHeight20,
                              Center(
                                child: Card(
                                  color: Color(0xff386BED),
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: SizedBox(
                                    height: 60,
                                    width: size.width * .5,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          fit: FlexFit.tight,
                                          child:
                                              profileTile('52', 'Post', true),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          fit: FlexFit.tight,
                                          child: profileTile(
                                              '250', 'Following', false),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          fit: FlexFit.tight,
                                          child: profileTile(
                                              '4.5K', 'Followers', false),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              AppWIdget.sizeHeight20,
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  width: size.width,
      
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                              child: Text(
                            'Liked Blogs',
                            style: AppTextStyle.articleTitle,
                          )),
                          InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                  'assets/icons/grid_view.svg')),
                          AppWIdget.sizeWidth10,
                          InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                  'assets/icons/list_view.svg'))
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ArticleView()));
                        },
                        child: likedWdget("assets/images/image1.png", 'BIG DATA',
                            'Why Big Data Needs Thick Data?'),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ArticleView()));
                        },
                        child: likedWdget("assets/images/image2.png", 'UX DESIGN',
                            'Step design sprint for UX beginner'),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ArticleView()));
                        },
                        child: likedWdget("assets/images/image1.png", 'BIG DATA',
                            'Why Big Data Needs Thick Data?'),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding likedWdget(image, title, dics) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Colors.white,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: SizedBox(
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                        )),
                  )),
              Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(color: Colors.blue, fontSize: 15),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            dics,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/like_fliied.svg'),
                            Text(
                              ' 2.1k',
                              style: TextStyle(color: Color(0xff2D4379)),
                            ),
                            AppWIdget.sizeWidth10,
                            Icon(
                              Icons.access_time,
                              color: Colors.grey,
                              size: 18,
                            ),
                            Text(
                              ' 1hr ago',
                              style: TextStyle(color: Color(0xff2D4379)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Container profileTile(String number, String title, bool flag) {
    return Container(
      decoration: BoxDecoration(
          color: flag ? Color(0xff2151CD) : Colors.transparent,
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            number,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Padding profilePhoto() {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4),
      child: SizedBox(
        height: 80,
        width: 80,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: _colors),
            ),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(3),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                          'assets/images/image5.png'),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
