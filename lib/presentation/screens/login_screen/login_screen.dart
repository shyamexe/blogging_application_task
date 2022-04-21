import 'package:blogging_application/core/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: const Color(0xffF4F7FF),
          body: Stack(
            children: [
              Align(
                alignment: Alignment(0, -.76),
                child: SvgPicture.asset(
                  'assets/icons/logo_svg.svg',
                  height: 50,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xff376AED),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  height: size.height * 0.8,
                  width: size.width,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: size.width * .7,
                      child: const TabBar(
                          indicatorColor: Colors.transparent,
                          tabs: [
                            Tab(
                              height: 60,
                              child: Text(
                                'LOGIN',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  height: size.height * 0.73,
                  width: size.width,
                  child: TabBarView(
                    children: [
                      Tab(child: loginForm(size,context)),
                      Tab(child: Text('dsf')),
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

  loginForm(Size size,context) {
    return Padding(
      padding: EdgeInsets.all(size.width * .1),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Welcome back',
              style: AppTextStyle.articleTitle,
            ),
          ),
          AppWIdget.sizeHeight10,
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Sign in With your account',
              style: TextStyle(
                  color: Color(0xff2D4379),
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
          ),
          AppWIdget.sizeHeight30,
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Username',
              style: TextStyle(
                color: Color(0xff2D4379),
                fontSize: 14,
              ),
            ),
          ),
          TextField(
            textInputAction: TextInputAction.next,
          ),
          AppWIdget.sizeHeight20,
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Password',
              style: TextStyle(
                color: Color(0xff2D4379),
                fontSize: 14,
              ),
            ),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
                suffix: SizedBox(
              height: 15,
              child: InkWell(
                  onTap: () {},
                  child: Text(
                    'Show',
                    style: TextStyle(color: Color(0xff376AED)),
                  )),
            )),
          ),
          AppWIdget.sizeHeight30,
          InkWell(
            onTap: (){
              // Navigator.of(context).pushReplacementNamed('/');
              Navigator.pop(context);
            },
            child: Container(
              height: 50,
              width: size.width * .7,
              decoration: BoxDecoration(
                  color: Color(0xff376AED),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  'LOGIN',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
          AppWIdget.sizeHeight20,
          RichText(
            text: const TextSpan(
              style: TextStyle(color: Color(0xff2D4379), fontSize: 15),
              children: <TextSpan>[
                TextSpan(text: 'Forgot your password? ', ),
                TextSpan(text: 'Reset here',style: TextStyle(color: Color(0xff376AED))),
                
              ],
            ),
          ),
          AppWIdget.sizeHeight30,
          Text(
            'OR SIGN IN WITH',
            style: AppTextStyle.homeName,
          ),
          AppWIdget.sizeHeight20,
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/google_logo.svg'),
              AppWIdget.sizeWidth20,
              SvgPicture.asset('assets/icons/facebook_logo.svg'),
              AppWIdget.sizeWidth20,
              SvgPicture.asset('assets/icons/twitwr_logo.svg')
            ],
          )
        ],
      ),
    );
  }
}
