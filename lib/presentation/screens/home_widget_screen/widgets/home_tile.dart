import 'package:blogging_application/core/constants/styles.dart';
import 'package:flutter/material.dart';

class HomeTile extends StatelessWidget {
  String image;
  String title;
   HomeTile({
    Key? key,
    required this.image,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SizedBox(
        height: 280,
        width: 230,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        image,
                      ),
                      fit: BoxFit.cover)),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(title,style: AppTextStyle.homeTileTitle,),
                ),
              )),
        ),
      ),
    );
  }
}
