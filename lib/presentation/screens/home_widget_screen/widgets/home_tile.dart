import 'package:blogging_application/core/constants/styles.dart';
import 'package:flutter/material.dart';

class HomeTile extends StatelessWidget {
  const HomeTile({
    Key? key,
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
                      image: NetworkImage(
                        "https://img.freepik.com/free-photo/virtual-reality-helmet-white-background-neon-light-vr-future-gadgets-technology-concept_308589-2781.jpg",
                      ),
                      fit: BoxFit.cover)),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('Technology',style: AppTextStyle.homeTileTitle,),
                ),
              )),
        ),
      ),
    );
  }
}
