import 'package:flutter/material.dart';
import 'package:flutter_web/components/main_button.dart';
import 'package:flutter_web/responsive.dart';

class Welcome extends StatelessWidget {
  const Welcome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(right: !isMobile(context) ? 40 : 0),
              child: Column(
                mainAxisAlignment: !isMobile(context)
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                crossAxisAlignment: !isMobile(context)
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: <Widget>[
                  if (isMobile(context))
                    Image.asset(
                      'assets/images/logo1.png',
                      height: size.height * 0.3,
                    ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Welcome',
                        style: TextStyle(
                          fontSize: isDesktop(context) ? 40 : 30,
                          fontWeight: FontWeight.bold,
                        )),
                  ])),
                  SizedBox(height: 10),
                  Wrap(
                    runSpacing: 10,
                    children: <Widget>[
                      MainButton(
                        title: 'Sign in',
                        color: Color(0xFF8c140b),
                        tapEvent: () {
                          Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                        },
                      ),
                      SizedBox(width: 10),
                      MainButton(
                        title: 'Register',
                        color: Color(0xFF6e2f2b),
                        tapEvent: () {},
                      )
                    ],
                  )
                ],
              ),
            )),
            if (isDesktop(context) || isTab(context))
              Expanded(
                  child: Image.asset(
                'assets/images/illustration.png',
                height: size.height * 0.5,
              ))
          ],
        ));
  }
}
