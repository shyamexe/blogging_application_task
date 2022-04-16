import 'package:flutter/material.dart';

//in this widget provide structure for status
class StoryData extends StatelessWidget {
  String image;
  String? text;
  String? url;
  StoryData({Key? key, required this.image, this.text, this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    image,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          if (text != null)
            Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  padding: EdgeInsets.all(30),
                  width: size.width*.7,
                  color: Colors.grey.withOpacity(.6),
                  child: Text(
                    text!,
                    overflow: TextOverflow.visible,
                    style:const TextStyle(
                      color: Colors.white,
                      fontSize: 14
                    ),
                  ),
                ),
              ),
            ),
          if (url != null) urlWidget(size),
        ],
      ),
    );
  }

  Align urlWidget(Size size) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          color: Color(0xff376AED),
          height: 120,
          width: size.width,
          child: Row(
            children: [
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: SizedBox(),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: FlatButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Text(
                      'Read More',
                      style: TextStyle(color: Color(0xff376AED)),
                    )),
              ),
               Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const[
                     Center(
                        child: Icon(
                      Icons.favorite,
                      size: 40,
                      color: Colors.red,
                    )),
                    Text('450 K',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
