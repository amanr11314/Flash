import 'package:flash/screens/login_screen.dart';
import 'package:flash/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flash/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: Duration(seconds: 1), vsync: this);
    controller.forward();

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
     .animate(controller);

    // animation = CurvedAnimation(parent: controller,curve: Curves.easeIn,);
    // animation.addStatusListener(  //To loop back and forth in animation
    //   (status){
    //     if(status == AnimationStatus.completed){
    //       controller.reverse(from: 1.0);
    //     }
    //     else if(status == AnimationStatus.dismissed){
    //       controller.forward();
    //     }
    //   }
    // );

    controller.addListener( (){
        setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  speed: Duration(milliseconds: 300),
                  text: ['Flash Chat'],  // to show loading screen like animation '${controller.value.toInt()}%',
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Hero(
              tag: 'login',
              child: RoundedButton(
               text: 'Log in',
               color: Colors.lightBlueAccent,
               onPressed: (){
                Navigator.pushNamed(context, LoginScreen.id);
               },
              ),
            ),
            Hero(
              tag: 'register',
              child: RoundedButton(
                text: 'Register',
                color: Colors.blueAccent,
                onPressed: (){
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


