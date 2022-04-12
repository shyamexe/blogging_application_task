import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        child: Image.network(
                          "https://png.pngtree.com/thumb_back/fw800/back_our/20190621/ourmid/pngtree-creative-technology-wind-vr-technology-psd-layering-image_194855.jpg",
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
                      children: const [
                        Text(
                          'BIG DATA',
                          style: TextStyle(color: Colors.blue, fontSize: 15),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            'Why Big Data Needs',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Text(
                          'Thick Data?',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
