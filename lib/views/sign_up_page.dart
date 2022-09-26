import 'package:chat_app/common/common.dart';
import 'package:chat_app/models/model.dart';
import 'package:chat_app/view_model/auth_state.dart';
import 'package:chat_app/views/chats_page.dart';
import 'package:chat_app/views/sign_in_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpPage extends ConsumerStatefulWidget {
  static const id = 'signUp';
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<dynamic>>(
      signUpStateProvider,
      (_, state) => state.whenOrNull(
        loading: () => showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => const Loading(),
        ),
        error: (error, strace) => showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => DisplayError(
            error: error,
            onPressed: () => Navigator.pushNamed(context, SignUpPage.id),
          ),
        ),
        data: (data) => Navigator.pushNamed(context, SignInPage.id),
      ),
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign Up',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 30),
            CustomTextField(
              fieldDescription: 'Email Address',
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 30),
            CustomTextField(
              fieldDescription: 'Password',
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: 'Sign Up',
              onPressed: () async {
                ref.read(signUpStateProvider.notifier).createUser(
                      emailController.value.text,
                      passwordController.value.text,
                      context,
                    );
              },
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  'Already have an account? ',
                  style: TextStyle(color: AppColor.blackColor, fontSize: 16),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Sign In',
                    style: const TextStyle(
                        color: AppColor.blueColor, fontSize: 16),
                    recognizer: TapGestureRecognizer()
                      ..onTap =
                          () => Navigator.pushNamed(context, SignInPage.id),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
