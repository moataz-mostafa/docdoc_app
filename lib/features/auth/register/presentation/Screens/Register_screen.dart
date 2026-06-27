import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/core/utils/txt_style.dart';
import 'package:grade_project/core/widgets/custom_snack_bar.dart';
import 'package:grade_project/core/widgets/txt_feild.dart';
import 'package:grade_project/features/auth/register/data/user_model.dart';
import 'package:grade_project/features/auth/register/logic/register_cubit.dart';
import 'package:grade_project/features/auth/register/logic/register_states.dart';
import 'package:grade_project/features/home/presintation/screen/home_screen.dart';

import '../../../../../core/widgets/button_widget.dart';
import '../widget/divider_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen(userName:state.userName,)),
            );
          } else if (state is RegisterErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(CustomSnackBar.error(state.errorMessage, context));
          }
        },

        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 64,
                  ),
                  child: Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create Account',
                        style: TxtStyle.font24wight700blue,
                      ),
                      Text(
                        "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                        style: TxtStyle.font14wight400grey,
                      ),
                      TxtFeild(
                        hintText: 'Name',
                        textEditingController: nameController,
                      ),
                      TxtFeild(
                        hintText: 'Email',
                        textEditingController: emailController,
                      ),
                      TxtFeild(
                        hintText: 'Password',
                        textEditingController: passwordController,
                      ),
                      TxtFeild(
                        hintText: 'Password Confirmation',
                        textEditingController: passwordConfirmationController,
                      ),
                      TxtFeild(
                        hintText: 'Phone',
                        textEditingController: phoneController,
                      ),
                      TxtFeild(
                        hintText: 'Gender',
                        textEditingController: genderController,
                      ),
                      (state is RegisterLoadingState)
                          ? Center(child: CircularProgressIndicator())
                          : ButtonWidget(
                              buttonTxt: 'Create Account',
                              onPressed: () {
                                context.read<RegisterCubit>().register(
                                  UserModel(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                    passwordConfirmation:
                                        passwordConfirmationController.text,
                                    phone: phoneController.text,
                                    gender: genderController.text,
                                  ),
                                );
                              },
                            ),
                      AuthFooterSection(
                        title: "Already have an account? ",
                        actionText: "Sign In",
                        onTap: () {},
                        divTxt: 'Or Sign Up With',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
