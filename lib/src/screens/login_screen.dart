import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qwilt/src/providers/login_form_provider.dart';
import 'package:qwilt/src/services/services.dart';
import 'package:qwilt/src/ui/custom_dialog_box.dart';
import 'package:qwilt/src/ui/input_styles.dart';
import 'package:qwilt/src/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 250,
              ),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Sign in',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(),
                      child: _LoginForm(),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
              TextButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, 'register'),
                  child: Text("Create new account",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)))
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) => loginForm.email = value,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputStyles.authInputDecoration(
                  hintText: 'john.doe@gmail.com',
                  labelText: 'Email Address',
                  prefixIcon: Icons.alternate_email_sharp),
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = RegExp(pattern);

                return regExp.hasMatch(value ?? '') ? null : 'Email invalid';
              },
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              onChanged: (value) => loginForm.password = value,
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputStyles.authInputDecoration(
                  hintText: '*************',
                  labelText: 'Password',
                  prefixIcon: Icons.lock_outline),
              validator: (value) {
                return value.toString().isEmpty
                    ? 'Password must no be empty'
                    : null;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.deepPurple,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text(
                      loginForm.isLoading ? 'Wait please moment...' : 'Login',
                      style: TextStyle(color: Colors.white)),
                ),
                onPressed: loginForm.isLoading
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();

                        final authService =
                            Provider.of<AuthService>(context, listen: false);

                        if (!loginForm.isValidForm()) return;
                        final Map<String, dynamic> authData = {
                          'email': loginForm.email,
                          'password': loginForm.password
                        };

                        final response = await authService.loginIn(authData);

                        if (response.containsKey("err")) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDialogBox(
                                    title: "Login error",
                                    descriptions: "Login no authorized",
                                    text: "Ok",
                                    iconColor: Colors.red,
                                    icon: Icons.warning);
                              });
                        } else {
                          Navigator.pushReplacementNamed(context, 'portfolios');
                        }
                      })
          ],
        ),
      ),
    );
  }
}
