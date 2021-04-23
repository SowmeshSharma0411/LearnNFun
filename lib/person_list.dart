import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/taskIntro.dart';
import 'package:learnnfun/widgets.dart';

class PersonList extends StatefulWidget {
  @override
  _PersonListState createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color(0xfff4f4f4),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                backButton(context),
                Text(
                  "Select a Gift Receiver",
                  style: GoogleFonts.quicksand(
                      textStyle: TextStyle(
                          color: const Color(0xffffa62b),
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: height * 0.04)),
                ),
                Text("Click on the person card to know more",
                    style: GoogleFonts.quicksand(
                      color: Color(0xff16697A),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    )),
                Expanded(
                  child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: personList.length,
                    itemBuilder: (BuildContext context, int index) {
                      Person person = personList[index];
                      return GestureDetector(
                        onTap: () => showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              personPopup(context, person),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                              height: height * 0.20,
                              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x33000000),
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: width * 0.3,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, top: 20, bottom: 20),
                                      child: SvgPicture.asset(person.imageUrl),
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Jessica Pearson
                                        Text(
                                            person.firstName +
                                                " " +
                                                person.lastName,
                                            style: GoogleFonts.quicksand(
                                                color: const Color(0xff489fb5),
                                                fontWeight: FontWeight.w700,
                                                fontStyle: FontStyle.normal,
                                                fontSize: height * 0.02),
                                            textAlign: TextAlign.left),
                                        // A lawyer in her mid 30s, loves to cook and watch s
                                        Text(person.description,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.quicksand(
                                                color: const Color(0xff16697a),
                                                fontWeight: FontWeight.w400,
                                                fontStyle: FontStyle.normal,
                                                fontSize: height * 0.02),
                                            textAlign: TextAlign.left),
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget personPopup(context, Person person) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            child: whiteScreen(context,
                height: MediaQuery.of(context).size.height * 0.7,
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => Navigator.pop(context))),
                  Row(
                    children: [
                      Container(
                        height: height * 0.2,
                        child: SvgPicture.asset(person.imageUrl),
                      ),
                      // Jessica Pearson
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            style: GoogleFonts.quicksand(
                                color: const Color(0xff489fb5),
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                fontSize: height * 0.04),
                            text: person.firstName + "\n"),
                        TextSpan(
                            style: GoogleFonts.quicksand(
                                color: const Color(0xff489fb5),
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontSize: height * 0.03),
                            text: person.lastName)
                      ]))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Age:" + "\n",
                              style: GoogleFonts.quicksand(
                                  color: const Color(0xff489fb5),
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: height * 0.02),
                            ),
                            Text(
                              "Profession:" + "\n",
                              style: GoogleFonts.quicksand(
                                  color: const Color(0xff489fb5),
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: height * 0.02),
                            ),
                            Text(
                              "Likes:" + "\n",
                              style: GoogleFonts.quicksand(
                                  color: const Color(0xff489fb5),
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: height * 0.02),
                            ),
                            Text(
                              "Dislikes:" + "\n",
                              style: GoogleFonts.quicksand(
                                  color: const Color(0xff489fb5),
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: height * 0.02),
                            ),
                            Text(
                              "Hobbies:" + "\n",
                              style: GoogleFonts.quicksand(
                                  color: const Color(0xff489fb5),
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: height * 0.02),
                            ),
                          ]),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              person.age.toString() + "\n",
                              style: GoogleFonts.quicksand(
                                  color: const Color(0xff489fb5),
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: height * 0.02),
                            ),
                            Text(
                              person.profession + "\n",
                              style: GoogleFonts.quicksand(
                                  color: const Color(0xff489fb5),
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: height * 0.02),
                            ),
                            Text(
                              person.likes + "\n",
                              style: GoogleFonts.quicksand(
                                  color: const Color(0xff489fb5),
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: height * 0.02),
                            ),
                            Text(
                              person.dislikes + "\n",
                              style: GoogleFonts.quicksand(
                                  color: const Color(0xff489fb5),
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: height * 0.02),
                            ),
                            Text(
                              person.hobbies + "\n",
                              style: GoogleFonts.quicksand(
                                  color: const Color(0xff489fb5),
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontSize: height * 0.02),
                            ),
                          ])
                    ],
                  ),
                  button(context, text: "Select Receiver", onTap: () {Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TaskIntro(taskNumber: 0),
                        settings: RouteSettings(name: 'Task Introduction')),
                  );})
                ])));
  }
}

class Person {
  final String imageUrl;
  final String firstName;
  final String lastName;
  final int age;
  final String profession;
  final String likes;
  final String dislikes;
  final String hobbies;
  final String description;

  Person(
      {@required this.firstName,
      @required this.lastName,
      @required this.age,
      @required this.profession,
      @required this.likes,
      @required this.dislikes,
      @required this.hobbies,
      @required this.imageUrl,
      @required this.description});
}

final personList = [
  Person(
    firstName: "Jessica",
    lastName: "Pearson",
    description:
        "A lawyer in her mid 30s, loves to cook and watch sports during",
    profession: "Lawyer",
    age: 30,
    hobbies: 'Watching Tv, Dancing',
    dislikes: "Cats, Heels, Makeup",
    imageUrl: "assets/gifting/JessicaPearson.svg",
    likes: "Gym, Dog, Travel",
  ),
  Person(
    firstName: "Jessica",
    lastName: "Pearson",
    description:
        "A lawyer in her mid 30s, loves to cook and watch sports during",
    profession: "Lawyer",
    age: 30,
    hobbies: 'Watching Tv, Dancing',
    dislikes: "Cats, Heels, Makeup",
    imageUrl: "assets/gifting/JessicaPearson.svg",
    likes: "Gym, Dog, Travel",
  ),
  Person(
    firstName: "Jessica",
    lastName: "Pearson",
    description:
        "A lawyer in her mid 30s, loves to cook and watch sports during",
    profession: "Lawyer",
    age: 30,
    hobbies: 'Watching Tv, Dancing',
    dislikes: "Cats, Heels, Makeup",
    imageUrl: "assets/gifting/JessicaPearson.svg",
    likes: "Gym, Dog, Travel",
  ),
  Person(
    firstName: "Jessica",
    lastName: "Pearson",
    description:
        "A lawyer in her mid 30s, loves to cook and watch sports during",
    profession: "Lawyer",
    age: 30,
    hobbies: 'Watching Tv, Dancing',
    dislikes: "Cats, Heels, Makeup",
    imageUrl: "assets/gifting/JessicaPearson.svg",
    likes: "Gym, Dog, Travel",
  ),
];
