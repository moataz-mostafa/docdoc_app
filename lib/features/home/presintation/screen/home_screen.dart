import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/core/helper/cach_helper.dart';
import 'package:grade_project/core/utils/colors_manager.dart';
import 'package:grade_project/core/utils/txt_style.dart';
import 'package:grade_project/core/widgets/row_see_all.dart';
import 'package:grade_project/features/home/logic/Home_cubit.dart';
import 'package:grade_project/features/home/presintation/widget/containor_widget.dart';
import 'package:grade_project/features/home/presintation/widget/doctor_speciality_widget.dart';
import 'package:grade_project/features/home/presintation/widget/doctors_widgets.dart';

import '../../Specialty/presentation/screens/specialty_screen.dart';
import '../../recommendation/presentation/screens/recommendation_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final userName = CacheHelper.getUserName();

    return BlocProvider(
      create: (_) => HomeCubit()..getHomeData(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                /// Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hi, $userName!",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: ColorsManager.black,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: IconButton(
                        icon: const ImageIcon(
                          AssetImage("assets/icons/bell.png"),
                          size: 22,
                          color: ColorsManager.black,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                Text(
                  "How are you today?",
                  style: TxtStyle.font14wight400grey,
                ),

                const SizedBox(height: 20),

                const ContainorWidget(),

                const SizedBox(height: 20),
                RowSeeAll(
                  title: "Recommendation Doctor",
                  onClick: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>const SpecialtyScreen()),);
                  },
                ),

                const DoctorSpecialityWidget(),

                const SizedBox(height: 15),

                RowSeeAll(
                  title: "Recommendation Doctor",
                  onClick: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>const RecommendationScreen()),);
                  },
                ),

                const SizedBox(height: 15),

                const Expanded(
                  child: DoctorsWidgets(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}