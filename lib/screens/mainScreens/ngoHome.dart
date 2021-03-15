import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../Utils/SizeConfig.dart';
import '../../Utils/constants.dart';

class NgoHome extends StatefulWidget {
  _NgoHomeState createState() => _NgoHomeState();
}

class _NgoHomeState extends State<NgoHome> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var h = SizeConfig.screenHeight / 896;
    var b = SizeConfig.screenWidth / 412;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(children: [
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
                Builder(
                  builder: (BuildContext context) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        height: h * 30,
                        width: b * 30,
                        decoration: BoxDecoration(
                          border: Border.all(color: mc, width: b * 1.5),
                          borderRadius: BorderRadius.circular(b * 12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: b * 5),
                          child: Icon(Icons.arrow_back_ios,
                              color: mc, size: b * 16),
                        ),
                      ),
                    );
                  },
                ),
                Spacer(),
                Text(
                  'NGO Name',
                  style: txtS(mc, 20, FontWeight.w600),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    print('Amit');
                  },
                  child: Icon(MdiIcons.send, color: mc),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(physics: BouncingScrollPhysics(), children: [
              sh(30),
              Row(children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: b * 20),
                      width: b * 145,
                      height: h * 175,
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
                        borderRadius: BorderRadius.circular(b * 12),
                      ),
                    ),
                    Positioned(
                      right: b * 30,
                      bottom: h * 7,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          width: b * 26,
                          height: h * 26,
                          decoration: BoxDecoration(
                            color: gc,
                            borderRadius: BorderRadius.circular(b * 6),
                          ),
                          child: Icon(MdiIcons.imageEdit,
                              color: Colors.white, size: b * 14),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: b * 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: b * 144,
                          child: Text(
                            'Raam Puri Ram Puri',
                            overflow: TextOverflow.ellipsis,
                            style: txtS(textColor, 20, FontWeight.w600),
                          ),
                        ),
                        InkWell(
                          child: Icon(MdiIcons.squareEditOutline,
                              color: rc, size: b * 20),
                        ),
                      ],
                    ),
                    sh(20),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: b * 26,
                          height: h * 26,
                          decoration: BoxDecoration(
                            color: mc,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xffff9001),
                                blurRadius: 24,
                                spreadRadius: -9,
                                offset: Offset(0, 8),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(b * 6),
                          ),
                          child: Icon(Icons.food_bank,
                              color: Colors.white, size: b * 14),
                        ),
                        SizedBox(width: b * 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '12',
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
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: b * 26,
                          height: h * 26,
                          decoration: BoxDecoration(
                            color: gc,
                            boxShadow: [
                              BoxShadow(
                                color: gc,
                                blurRadius: 24,
                                spreadRadius: -9,
                                offset: Offset(0, 8),
                              ),
                            ],
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
              sh(30),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: b * 20),
                    height: h * 125,
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
                      borderRadius: BorderRadius.circular(b * 12),
                    ),
                  ),
                  Positioned(
                    right: b * 30,
                    bottom: h * 7,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: b * 26,
                        height: h * 26,
                        decoration: BoxDecoration(
                          color: gc,
                          borderRadius: BorderRadius.circular(b * 6),
                        ),
                        child: Icon(MdiIcons.imageEdit,
                            color: Colors.white, size: b * 14),
                      ),
                    ),
                  ),
                ],
              ),
              sh(25),
              Container(
                margin: EdgeInsets.symmetric(horizontal: b * 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'About',
                          style: txtS(textColor, 20, FontWeight.w600),
                        ),
                        Spacer(),
                        InkWell(
                          child: Icon(MdiIcons.squareEditOutline,
                              color: rc, size: b * 20),
                        ),
                      ],
                    ),
                    sh(10),
                    Text(
                      'About About About About About About About About About About About About About About About About About About About About About About About About About About About About About About About About About About About About About About About About About About About About ',
                      style: txtS(Color(0xff828282), 14, FontWeight.w500),
                    ),
                    sh(30),
                    Text(
                      'Contact',
                      style: txtS(textColor, 20, FontWeight.w600),
                    ),
                    sh(20),
                    Row(children: [
                      Container(
                        width: b * 250,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.email_outlined,
                                  color: rc,
                                  size: b * 20,
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
                              'ritesh.shuklalmp2018@gmail.com',
                              overflow: TextOverflow.ellipsis,
                              style: txtS(textColor, 13, FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: b * 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.phone_outlined,
                                  color: rc,
                                  size: b * 15 * 1.3,
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
                              '6387246025',
                              style: txtS(textColor, 13, FontWeight.w600),
                            ),
                          ],
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
                              Icon(
                                Icons.location_on_outlined,
                                color: rc,
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
                            'Shastri Nagar, ghoshiyana road, near chitra medical center, lakhimpur kheri',
                            style: txtS(textColor, 13, FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              sh(200),
            ]),
          ),
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