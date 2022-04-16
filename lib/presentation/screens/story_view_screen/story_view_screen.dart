import 'package:blogging_application/logic/status_indux_cubit/status_index_cubit.dart';
import 'package:blogging_application/logic/status_timer_cubit/status_timer_cubit.dart';
import 'package:blogging_application/presentation/screens/story_view_screen/widgets/story_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/styles.dart';

class StoryViewScreen extends StatelessWidget {
  StoryViewScreen({Key? key}) : super(key: key);

  List _widgets = [
    StoryData(
      image: 'assets/images/statusbg.png',
      url: 'https://www.google.co.in/',
      text:
          'One reason. 60% of the global population are netizens. And also the future generations will be heavily dependent on the internet.',
    ),
    StoryData(image: 'assets/images/image3.png'),
    StoryData(image: 'assets/images/articlebg.png'),
  ]; //this list contain status data

  @override
  Widget build(BuildContext context) {
    context.read<StatusTimerCubit>().startTimer(_widgets.length);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          BlocBuilder<StatusIndexCubit, StatusIndexState>(
            builder: (context, state) {
              return _widgets[state.index];
            },
          ),
          Align(
            alignment: Alignment(0, -0.8),
            child: SizedBox(
              width: size.width * .8,
              height: 80,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(19),
                    child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Image.asset(
                          'assets/images/image4.png',
                          fit: BoxFit.cover,
                        )),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(bottom: 2),
                          child: Text(
                            'Jasmine Levin',
                            style: AppTextStyle.statusTitle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 3),
                          child: Text(
                            '4m ago',
                            style: AppTextStyle.statusTime,
                          ),
                        ),
                      ],
                    ),
                  )),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        // context.read<StatusTimerCubit>().close();
                      },
                      child: SvgPicture.asset('assets/icons/close_svg.svg')),
                ],
              ),
            ),
          ), //user title
          Align(
            alignment: Alignment(0, -0.87),
            child: SizedBox(
              width: size.width * .8,
              height: 9,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _widgets.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: size.width * .8 / _widgets.length,
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: BlocBuilder<StatusTimerCubit, StatusTimerState>(
                          builder: (context, timeState) {
                            return BlocBuilder<StatusIndexCubit, StatusIndexState>(
                              builder: (context, indexState) {
                                if(index==indexState.index){
                                  if (index==_widgets.length) {
                                  //  context.read<StatusTimerCubit>().close();
                                  Navigator.of(context).pop();
                                  }
                                  return LinearProgressIndicator(
                                  value: timeState.timer,
                                  backgroundColor: Colors.grey.withOpacity(.5),
                                  color: Colors.white,
                                  
                                );
                                }if (index<indexState.index) {
                                  return LinearProgressIndicator(
                                  value: 10,
                                  backgroundColor: Colors.grey.withOpacity(.5),
                                  color: Colors.white,
                                );
                                } else {
                                  return LinearProgressIndicator(
                                  value: 0,
                                  backgroundColor: Colors.grey.withOpacity(.5),
                                  color: Colors.white,
                                );
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ), //status progress indicator
          )
        ],
      )),
    );
  }
}
