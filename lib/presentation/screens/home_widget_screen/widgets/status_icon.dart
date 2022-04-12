import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StatusIcon extends StatelessWidget {
  StatusIcon({
    Key? key,
  }) : super(key: key);

  @override
  List<Color> _colors = [Color(0xFF826dc6), Color(0xFF5dd3f6)];
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 70,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 4),
                child: SizedBox(
                  height: 55,
                  width: 55,
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
                                    'https://user-images.githubusercontent.com/93277108/162989002-6953530e-991e-4d42-ae4f-2cd0912ca855.jpg'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    'John Doe',
                    style: TextStyle(fontSize: 10),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment:const Alignment(.8,.2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                  child: Container(
                    child:Padding(
                      padding: const EdgeInsets.all(2),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                    color: Colors.orangeAccent,
                  ),
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
