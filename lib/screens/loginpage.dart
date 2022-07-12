import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web/core/providers/user_provider.dart';
import 'package:flutter_web/screens/home/home.dart';
// import 'package:provider/provider.dart';
// import 'package:simpletodo/core/providers/user_provider.dart';
// import 'package:simpletodo/ui/screens/front_page.dart';
// import 'package:simpletodo/ui/screens/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
final user = Provider.of<UserProvider>(context);
    Widget buildUsername() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Username',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2)),
                ]),
            height: 60,
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black87),
              validator: (String? value) {
                final login = Provider.of<UserProvider>(context, listen: false);
                if (value == null || value != value.isEmpty) {
                  return ('Username can\'t be empty');
                } else if (value != 'sample') {
                  return ('Username doesn\'t exist');
                } else {
                  login.username = value;
                  return null;
                }
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Color(0xFF1e8f6f),
                  ),
                  hintText: 'Username',
                  hintStyle: TextStyle(color: Colors.black)),
            ),
          ),
        ],
      );
    }

    Widget buildPassword() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Password',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2)),
                ]),
            height: 60,
            child: TextFormField(
              obscureText: true,
              style: TextStyle(color: Colors.black87),
              validator: (String? value) {
                final login = Provider.of<UserProvider>(context, listen: false);
                if (value == null || value != value.isEmpty) {
                  return ('Username can\'t be empty');
                } else if (value != 'sample') {
                  return ('Username doesn\'t exist');
                } else {
                  login.password = value;
                  return null;
                }
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Color(0xFF1e8f6f),
                  ),
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.black)),
            ),
          ),
        ],
      );
    }

    Widget buildLoginBtn() {
      return Container(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFade0d4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                }
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => const HomePage(),
                // //   ),
                // );
              },
              child: Text('Login'),
            ),
          ),
        ),
      );
    }

    Widget buildSignUpBtn() {
      return GestureDetector(
        onTap: () => print("Sign up Pressed"),
        child: RichText(
          text: TextSpan(children: [
            TextSpan(
              text: 'Don\'t have an account?',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            TextSpan(
                text: 'Sign Up',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold))
          ]),
        ),
      );
    }

    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFf0dcda),
                        Color(0xFF751e17),
                        Color(0xFF751e17),
                        Color(0xFF61130e),
                      ]),
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'MyTD',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Task Management',
                          style: TextStyle(
                              color: Colors.black26,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 50),
                        buildUsername(),
                        SizedBox(height: 20),
                        buildPassword(),
                        SizedBox(height: 20),
                        buildLoginBtn(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
