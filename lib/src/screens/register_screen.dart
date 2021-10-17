import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qwilt/src/providers/login_form_provider.dart';
import 'package:qwilt/src/services/auth_services.dart';
import 'package:qwilt/src/ui/custom_dialog_box.dart';
import 'package:qwilt/src/ui/input_styles.dart';
import 'package:qwilt/src/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

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
                      'Register',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(),
                      child: _RegisterForm(),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
              TextButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, 'login'),
                  child: Text("Do you have an account?",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)))
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        key: registerForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              onChanged: (value) => registerForm.email = value,
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
              onChanged: (value) => registerForm.password = value,
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
            TextFormField(
              onChanged: (value) => registerForm.firstName = value,
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: InputStyles.authInputDecoration(
                  hintText: 'john',
                  labelText: 'First Name',
                  prefixIcon: Icons.alternate_email_sharp),
              validator: (value) {
                return value.toString().isEmpty
                    ? 'First Name must no be empty'
                    : null;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              onChanged: (value) => registerForm.lastName = value,
              autocorrect: false,
              keyboardType: TextInputType.text,
              decoration: InputStyles.authInputDecoration(
                  hintText: 'doe', labelText: 'Last Name'),
              validator: (value) {
                return value.toString().isEmpty
                    ? 'Last Name must no be empty'
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
                      registerForm.isLoading
                          ? 'Wait please moment...'
                          : 'Register',
                      style: TextStyle(color: Colors.white)),
                ),
                onPressed: registerForm.isLoading
                    ? null
                    : () async {
                        FocusScope.of(context).unfocus();

                        final authService =
                            Provider.of<AuthService>(context, listen: false);

                        if (!registerForm.isValidForm()) return;

                        final Map<String, dynamic> authData = {
                          'email': registerForm.email,
                          'password': registerForm.password,
                          'firstName': registerForm.firstName,
                          'lastName': registerForm.lastName
                        };

                        final response = await authService.createUser(authData);

                        if (response.containsKey("err")) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDialogBox(
                                    title: "Custom Dialog Demo",
                                    descriptions:
                                        "Hii all this is a custom dialog in flutter and  you will be use in your flutter applications",
                                    text: "Yes",
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
