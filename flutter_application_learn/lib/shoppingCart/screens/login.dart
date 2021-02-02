import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    userNameController.dispose();
    super.dispose();
  }

  void _loginAuth() {
    Login login = new Login(
        password: passwordController.text, userName: userNameController.text);
    LoginState loginState = login.getDet();

    if (loginState == LoginState.success) {
      Navigator.pushReplacementNamed(context, '/catalog');
    } else
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("AuthFailed"),
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(80.0),
          child: Column(
            children: [
              Text(
                "Hello",
                style: Theme.of(context).textTheme.headline1,
              ),
              TextFormField(
                controller: userNameController,
                decoration: InputDecoration(hintText: 'UserName'),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                controller: passwordController,
                obscureText: true,
                obscuringCharacter: '*',
              ),
              SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () => _loginAuth(),
                child: Text("ENTER"),
                style: ElevatedButton.styleFrom(primary: Colors.teal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//

enum LoginState {
  success,
  failure,
}

class Login {
  final String userName;
  final String password;
  Login({this.userName, this.password});

  LoginState getDet() {
    //get username and password from database
    String dataBaseUserName = 'login';
    String dataBasepassword = '123';

    if (dataBaseUserName == userName && dataBasepassword == password) {
      return LoginState.success;
    } else
      return LoginState.failure;
  }
}
