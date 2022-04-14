import 'package:blogging_application/core/constants/styles.dart';
import 'package:blogging_application/logic/onboading_page_cubit/onboarding_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF4F7FF),
        body: Stack(
          children: [
            BlocBuilder<OnboardingPageCubit, OnboardingPageState>(
              builder: (context, state) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipRRect(
                    borderRadius:const BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35)),
                    child: Container(
                      color: Colors.white,
                      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                      width: size.width,
                      height: size.height * .35,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Padding(
                            padding:  EdgeInsets.only(top: 10),
                            child: Text(
                              'Read the article you want instantly',
                              style: AppTextStyle.titleBlack,
                            ),
                          ),
        
                          const Padding(
                            padding:  EdgeInsets.all(10),
                            child:  Text(
                                'You can read thousands of articles on Blog Club, save them in the application and share them with your loved ones.',
                                style: AppTextStyle.textBlack,
                                textScaleFactor: 1.1,
                              ),
                          ),
                          
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  
                                  children: [
                                    indicatorWidget(0 == state.pageNo),
                                    indicatorWidget(1 == state.pageNo),
                                    indicatorWidget(2 == state.pageNo),
                                    indicatorWidget(3 == state.pageNo),
                                  ],
                                ),
                                InkWell(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Container(
                                      height: 55,
                                      width: 80,
                                      color: const Color(0xff376AED),
                                      child: const Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    if (state.pageNo < 3) {
                                      context
                                          .read<OnboardingPageCubit>()
                                          .onNext();
                                    } else {
                                      Navigator.pushReplacementNamed(
                                          context, '/login');
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                          AppWIdget.sizeHeight20,
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  indicatorWidget(bool value) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 8,
          width: value ? 20 : 8,
          color: value ? Color(0xff376AED) : Color(0xffDEE7FF),
        ),
      ),
    );
  }
}
