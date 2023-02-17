import 'package:flutter/material.dart';
import 'package:jono/common/widgets/common_textfield.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/login-page';
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                const Spacer(),
                Text(
                  'Login',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 44),
            const CommonTextField(
              hintText: 'Enter your email',
              prefixIcon: Icon(Icons.message_rounded),
            ),
            const SizedBox(height: 16),
            const CommonTextField(
              hintText: 'Enter your password',
              prefixIcon: Icon(Icons.lock_outline_rounded),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Password?'),
                )
              ],
            ),
            const SizedBox(height: 32),
            ElevatedButton(onPressed: () {}, child: const Text('Login'))
          ],
        ),
      )),
    );
  }
}
