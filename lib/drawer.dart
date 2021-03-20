import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gur/screens/authScreens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Utils/SizeConfig.dart';
import 'Utils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerCode extends StatefulWidget {
  final String userName;
  final String designation;
  final bool hide;
  final String mobileNumber;
  DrawerCode({
    @required this.hide,
    this.userName,
    this.designation,
    this.mobileNumber,
  });
  _DrawerCodeState createState() => _DrawerCodeState();
}

class _DrawerCodeState extends State<DrawerCode> {
  SharedPreferences preferences;
  String userName = "Not Provided";
  String userPhone = "Not Provided";

  loadData() async {
    preferences = await SharedPreferences.getInstance();

    setState(() {
      if (preferences.containsKey('currentUserName'))
        userName = preferences.getString("currentUserName");

      if (preferences.containsKey("currentUserPhone"))
        userPhone = preferences.getString("currentUserPhone");
    });
  }

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 414;
    var h = SizeConfig.screenHeight / 896;
    return Drawer(
      child: Container(
        padding: EdgeInsets.only(
          left: b * 25,
        ),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sh(100),
            Text(
              userName, //this.userName
              style: txtS(textColor, 30, FontWeight.w500),
            ),
            sh(20),
            Text(
              "Designation", // this.designation
              style: txtS(textColor, 16, FontWeight.w400),
            ),
            // Mobile Number
            sh(10),
            InkWell(
              child: Row(
                children: [
                  Container(
                    height: h * 20,
                    width: b * 20,
                    child: SvgPicture.asset(
                      'images/Call.svg',
                      allowDrawingOutsideViewBox: true,
                      width: h * 20,
                      height: b * 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: b * 10),
                  Text(
                    userPhone, // this.phoneNumber
                    style: txtS(textColor, 14, FontWeight.w400),
                  ),
                ],
              ),
            ),
            sh(20),
            Container(
                margin: EdgeInsets.only(right: b * 20),
                color: rc,
                height: h * 1),
            sh(50),
            row('images/Document.svg', 'Complaints', sendComplaintMail),
            row('images/Chat.svg', 'Suggestions', sendSuggestionMail),
            row('images/Heart.svg', 'Mission', null),
            row('images/Info Square.svg', 'About the App', null),
            row('images/Ticket.svg', 'My Coupons', null),
            row('images/Logout.svg', 'Log Out', logOut),
            sh(100),
            Container(
                margin: EdgeInsets.only(right: b * 20),
                color: rc,
                height: h * 1),
            row('images/Send.svg', 'Share the App', null),
            row('images/group.svg', 'Version', null),
          ],
        ),
      ),
    );
  }

  InkWell row(String ic, String tit, Function fn) {
    SizeConfig().init(context);
    var b = SizeConfig.screenWidth / 414;
    var h = SizeConfig.screenHeight / 896;
    return InkWell(
      splashColor: mc,
      onTap: () {
        fn();
      },
      child: Container(
        height: SizeConfig.screenHeight * 50 / 896,
        child: Row(
          children: [
            SizedBox(width: SizeConfig.screenWidth * 12 / 414),
            SvgPicture.asset(
              ic,
              allowDrawingOutsideViewBox: true,
              width: h * 20,
              height: b * 20,
            ),
            SizedBox(width: SizeConfig.screenWidth * 25 / 375),
            Text(
              tit,
              style: txtS(textColor, 16, FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox sh(double h) {
    return SizedBox(height: SizeConfig.screenHeight * h / 896);
  }

  TextStyle txtS(Color col, double siz, FontWeight wg) {
    return TextStyle(
      color: col,
      fontWeight: wg,
      fontSize: SizeConfig.screenWidth * siz / 414,
    );
  }

  void logOut() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    GoogleSignIn googleSignIn = GoogleSignIn();
    SharedPreferences preferences = await SharedPreferences.getInstance();

    try {
      await firebaseAuth.signOut().then((value) {
        preferences.setBool('isLoggedIn', false);
        preferences.remove('currentUserName');
        preferences.remove('currentUserPhone');
        preferences.remove('currentUserEmail');
        print("Signed Out");
        Navigator.of(context).pop();
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
            return Login();
          }),
          (route) => false,
        );
      }).catchError((e) {
        print(e);
      });
      googleSignIn.signOut();
    } on FirebaseAuthException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }

  void sendComplaintMail() async {
    Email email = Email(
        recipients: ['sisodiasuraj2000@gmail.com'],
        subject: 'Complaint regarding DSC App',
        isHTML: false);

    await FlutterEmailSender.send(email);
  }

  void sendSuggestionMail() async {
    Email email = Email(
        recipients: ['sisodiasuraj2000@gmail.com'],
        subject: 'Suggestion regarding DSC App',
        isHTML: false);

    await FlutterEmailSender.send(email);
  }
}
