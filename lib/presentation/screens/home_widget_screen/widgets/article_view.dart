import 'package:blogging_application/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({Key? key}) : super(key: key);

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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Unlocking Web 3.0',
                  style: AppTextStyle.title,
                ),
              ),
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
                          child: Image.asset(
                            'assets/images/image5.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(bottom: 2),
                              child: Text(
                                'Content Team TATOS',
                                style: AppTextStyle.userTitleblue,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 3),
                              child: Text(
                                '2m ago',
                                style: AppTextStyle.userTimeGrey,
                              ),
                            ),
                          ],
                        ),
                      )),
                      IconButton(
                          onPressed: () {},
                          icon:
                              SvgPicture.asset('assets/icons/share_icon.svg')),
                      IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset('assets/icons/save_svg.svg')),
                    ],
                  )),
              AppWIdget.sizeHeight20,
              Center(
                  child: Image.asset(
                'assets/images/articlebg.png',
                fit: BoxFit.fitWidth,
              )),
              AppWIdget.sizeHeight20,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'What is Web 3.0 Why does it matter?',
                  style: AppTextStyle.articleTitle,
                  overflow: TextOverflow.visible,
                ),
              ),
              AppWIdget.sizeHeight20,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  '''With the latest technological advancements like Cryptocurrencies, NFTs, metaverse and DeFi ( Decentralized Finance spaces) in place, you may have come across a buzzy term Web 3.0. In case you feel you missed the bus, don't worry we got your back. Let's dive in together to explore what Web 3.0 is and why it matters.

Story behind
Knowing a little history does no harm. In 1989, the term Web 1.0 was first coined by Tim Berners-Lee. Web 1.0 was decentralized, open-source and read-only. Fast forward a decade, Web 2.0 made it possible to not just read but publish information online. Tech giants like YouTube, Facebook and Twitter continue to pull in millions of users around the world, until today. The Web 2.0 internet is centralized, social and more open. It is the Web 2.0 that still keeps us connected. But is the Web 2.0 picture as rosy as we are presented with?


''',
                  style: AppTextStyle.articleText,
                  overflow: TextOverflow.visible,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 90,
        child: ElevatedButton(
          onPressed: (){},
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
      )
    );
  }
}
