import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../Utils/SizeConfig.dart';
import '../../Utils/constants.dart';

class AboutNgo extends StatefulWidget {
  final String? uidNGO;

  AboutNgo({this.uidNGO});
  _AboutNgoState createState() => _AboutNgoState();
}

void launchUrl(String url) async {
  if (await canLaunchUrlString(url)) {
    launchUrlString(url);
  } else {
    throw "Could not launch $url";
  }
}

class _AboutNgoState extends State<AboutNgo> {
  String uid = '';
  String ngoName = 'NA';
  String email = "NA";
  String phone = 'NA';
  String address = 'NA';
  String photo = 'NA';
  String photo2 = 'NA';
  String summary = 'NA';
  int packageNo = 0;
  bool isVerified = false;

  @override
  void initState() {
    super.initState();

    getDataFromDb();
  }

  getDataFromDb() async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uidNGO)
        .snapshots()
        .listen((snap) {
      setState(() {
        ngoName = snap.data()?['name'];
        email = snap.data()?['email'];
        phone = snap.data()?['phone'];
        if (snap.data()?['address'] != null) address = snap.data()?['address'];

        if (snap.data()?['image1'] != null) photo = snap.data()?['image1'];

        if (snap.data()?['image2'] != null) photo2 = snap.data()?['image2'];

        if (snap.data()?['summary'] != null) summary = snap.data()?['summary'];

        if (snap.data()?['packagesDelivered'] != null)
          packageNo = snap.data()?['packagesDelivered'];

        if (snap.data()?['isVerified'] != null)
          isVerified = snap.data()?['isVerified'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.uidNGO);
    SizeConfig().init(context);
    var h = SizeConfig.screenHeight / 896;
    var b = SizeConfig.screenWidth / 412;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(children: [
          Column(children: [
            Container(
              height: h * 60,
              padding: EdgeInsets.symmetric(horizontal: b * 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.07),
                    blurRadius: b * 4,
                    spreadRadius: 0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      child: SvgPicture.asset(
                        'images/Arrow1.svg',
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    ngoName,
                    style: txtS(mc, 20, FontWeight.w600),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Expanded(
              child: ListView(physics: BouncingScrollPhysics(), children: [
                sh(29),
                Row(children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: b * 20),
                    width: b * 140,
                    height: h * 177,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 24,
                          spreadRadius: -7,
                          offset: Offset(0, 6),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(b * 6),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: b * 140,
                          height: h * 138,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(b * 6),
                          ),
                          child: photo == 'NA'
                              ? Image.asset('images/headNoImage.png')
                              : CachedNetworkImage(
                                  imageUrl: photo,
                                  fit: BoxFit.cover,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(b * 10),
                                      image: DecorationImage(
                                        image: imageProvider,
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                        sh(5),
                        Container(
                          child: Column(
                            children: [
                              Text(
                                'Working Since',
                                style: txtS(textColor, 12, FontWeight.w400),
                              ),
                              Text(
                                '2021',
                                style: txtS(textColor, 12, FontWeight.w800),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: b * 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: b * 200,
                        child: Text(
                          ngoName,
                          overflow: TextOverflow.ellipsis,
                          style: txtS(textColor, 20, FontWeight.w600),
                        ),
                      ),
                      sh(20),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: b * 26,
                            height: h * 30,
                            decoration: BoxDecoration(
                              color: mc,
                              borderRadius: BorderRadius.circular(b * 6),
                            ),
                            child: Container(
                              height: h * 18,
                              width: b * 18,
                              child: SvgPicture.asset(
                                'images/rest.svg',
                                allowDrawingOutsideViewBox: true,
                              ),
                            ),
                          ),
                          SizedBox(width: b * 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                packageNo.toString(),
                                style: txtS(textColor, 16, FontWeight.w500),
                              ),
                              Text(
                                'Packages Delivered',
                                style: txtS(rc, 10, FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                      sh(20),
                      !isVerified
                          ? SizedBox()
                          : Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: b * 26,
                                  height: h * 30,
                                  decoration: BoxDecoration(
                                    color: Color(0xff28797c),
                                    borderRadius: BorderRadius.circular(b * 6),
                                  ),
                                  child: Icon(Icons.verified,
                                      color: Colors.white, size: b * 14),
                                ),
                                SizedBox(width: b * 10),
                                Text(
                                  'Verified',
                                  style: txtS(textColor, 16, FontWeight.w500),
                                ),
                              ],
                            ),
                    ],
                  ),
                ]),
                sh(40),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: b * 20),
                  height: h * 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 12,
                        spreadRadius: 1,
                        offset: Offset(0, 6),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(b * 6),
                  ),
                  child: photo2 == 'NA'
                      ? Image.asset('images/baseNoImage.png')
                      : CachedNetworkImage(
                          imageUrl: photo2,
                          fit: BoxFit.fitHeight,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(b * 10),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                        ),
                ),
                sh(25),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: b * 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About',
                        style: txtS(textColor, 20, FontWeight.w600),
                      ),
                      sh(10),
                      Text(
                        summary,
                        style: txtS(Color(0xff828282), 14, FontWeight.w500),
                      ),
                      sh(30),
                      Text(
                        'Contact',
                        style: txtS(textColor, 20, FontWeight.w600),
                      ),
                      sh(20),
                      Row(children: [
                        InkWell(
                          onTap: () {
                            launchUrl(
                                "mailto:$email?subject=Regarding Ngo Information&body=Can I get information regarding your employees");
                          },
                          child: Container(
                            width: b * 250,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: h * 25,
                                      width: b * 25,
                                      child: SvgPicture.asset(
                                        'images/Message.svg',
                                        allowDrawingOutsideViewBox: true,
                                      ),
                                    ),
                                    SizedBox(width: b * 7),
                                    Text(
                                      'Email',
                                      style: txtS(rc, 14, FontWeight.w500),
                                    ),
                                  ],
                                ),
                                sh(2),
                                Text(
                                  email,
                                  overflow: TextOverflow.ellipsis,
                                  style: txtS(textColor, 13, FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.white,
                          highlightColor: Colors.white,
                          onTap: () {
                            launchUrl("tel:$phone");
                          },
                          child: Container(
                            width: b * 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: h * 25,
                                      width: b * 25,
                                      child: SvgPicture.asset(
                                        'images/Call.svg',
                                        allowDrawingOutsideViewBox: true,
                                      ),
                                    ),
                                    SizedBox(width: b * 7),
                                    Text(
                                      'Phone',
                                      style: txtS(rc, 14, FontWeight.w500),
                                    ),
                                  ],
                                ),
                                sh(2),
                                Text(
                                  phone,
                                  style: txtS(textColor, 13, FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                      sh(30),
                      Container(
                        width: b * 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: h * 25,
                                  width: b * 25,
                                  child: SvgPicture.asset(
                                    'images/Location.svg',
                                    allowDrawingOutsideViewBox: true,
                                  ),
                                ),
                                SizedBox(width: b * 7),
                                Text(
                                  'Address',
                                  style: txtS(rc, 14, FontWeight.w500),
                                ),
                              ],
                            ),
                            sh(3),
                            Text(
                              address,
                              style: txtS(textColor, 13, FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      sh(30),
                    ],
                  ),
                ),
              ]),
            ),
          ]),
        ]),
      ),
    );
  }

  SizedBox sh(double h) {
    return SizedBox(height: h * SizeConfig.screenHeight / 896);
  }

  TextStyle txtS(Color col, double siz, FontWeight wg) {
    return TextStyle(
      color: col,
      fontWeight: wg,
      fontSize: SizeConfig.screenWidth / 412 * siz,
    );
  }
}
