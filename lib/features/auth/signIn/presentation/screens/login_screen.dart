import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/core/widgets/button_widget.dart';
import 'package:grade_project/features/auth/register/presentation/Screens/Register_screen.dart';
import 'package:grade_project/features/auth/signIn/logic/login_cubit.dart';
import 'package:grade_project/features/auth/signIn/logic/login_state.dart';
import 'package:grade_project/features/auth/register/presentation/widget/divider_widget.dart';
import 'package:grade_project/features/home/presintation/screen/home_screen.dart';
import 'package:grade_project/features/layout/nav_bar.dart';
import '../../../../../core/utils/txt_style.dart';
import '../../../../../core/widgets/txt_feild.dart';
import '../widgets/remember_me_widget.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: BlocConsumer<LoginCubit, LoginStates>(
                  listener: (context, state) {
                    if (state is LoginSuccessState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Welcome"),
                        ),
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => NavBar(),
                        ),
                      );
                    } else if (state is LoginErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.errorMessage),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome Back',
                          style: TxtStyle.font24wight700blue,
                        ),
                        const SizedBox(height: 17),

                        const Text(
                          "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                          style: TxtStyle.font14wight400grey,
                        ),
                        const SizedBox(height: 17),

                        TxtFeild(
                          hintText: 'Email',
                          textEditingController: emailController,
                        ),
                        const SizedBox(height: 17),

                        TxtFeild(
                          hintText: 'Password',
                          textEditingController: passwordController,
                        ),
                        const SizedBox(height: 17),

                        const RememberMeWidget(),
                        const SizedBox(height: 17),

                        state is LoginLoadingState
                            ? const Center(
                          child: CircularProgressIndicator(),
                        )
                            : ButtonWidget(
                          buttonTxt: 'Log In',
                          onPressed: () {
                            context.read<LoginCubit>().login(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          },
                        ),

                        const SizedBox(height: 17),

                        AuthFooterSection(
                          title: 'Already have an account yet? ',
                          actionText: ' Sign Up',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => RegisterScreen(),
                              ),
                            );
                          },
                          divTxt: 'Or Sign In With',
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}