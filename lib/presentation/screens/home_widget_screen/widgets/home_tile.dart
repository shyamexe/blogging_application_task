import 'package:blogging_application/core/constants/styles.dart';
import 'package:flutter/material.dart';

class HomeTile extends StatelessWidget {
  String image;
  String title;
  HomeTile({Key? key, required this.image, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
      ),
      child: Container(
          height: 280,
          width: 230,
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  offset: Offset(2, 2),
                  blurRadius: 12,
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                )
              ],
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(
                    image,
                  ),
                  fit: BoxFit.cover)),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                title,
                style: AppTextStyle.homeTileTitle,
              ),
            ),
          )),
    );
  }
}
