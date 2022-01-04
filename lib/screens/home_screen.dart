import 'package:covid19_ui/constant.dart';
import 'package:covid19_ui/widgets/counter.dart';
import 'package:covid19_ui/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dropdownCountry = "Turkey";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyHeader(
              image: "assets/icons/Drcorona.svg",
              textTop: "All you need",
              textBottom: "is stay at home",
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Color(0xFFE5E5E5))),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/icons/maps-and-flags.svg"),
                      SizedBox(width: 20),
                      Expanded(
                          child: DropdownButton(
                        isExpanded: true,
                        underline: SizedBox(),
                        icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                        value: dropdownCountry,
                        items: [
                          'Turkey',
                          'Germany',
                          'England',
                          'Poland',
                          'Latvia',
                          'Italy'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            dropdownCountry = value;
                          });
                        },
                      ))
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "Case Update\n", style: kTitleTextstyle),
                            TextSpan(
                              text: "Newest update 10 January",
                              style: TextStyle(color: kTextLightColor),
                            )
                          ])),
                          Spacer(),
                          Text(
                            "See Details",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 6),
                                  blurRadius: 1,
                                  color: kShadowColor)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Counter(
                              color: kInfectedColor,
                              number: 1046,
                              title: "Intected",
                            ),
                            Counter(
                              color: kDeathColor,
                              number: 87,
                              title: "Deaths",
                            ),
                            Counter(
                              color: kRecovercolor,
                              number: 46,
                              title: "Recovered",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Spread of Virus",
                            style: kTitleTextstyle,
                          ),
                          Text(
                            "See Details",
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        padding: EdgeInsets.all(10),
                        height: 170,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 1,
                                color: kShadowColor,
                              ),
                            ]),
                        child: Image.asset(
                          "assets/images/map.png",
                          fit: BoxFit.contain,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
