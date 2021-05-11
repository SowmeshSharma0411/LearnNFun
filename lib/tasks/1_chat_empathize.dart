import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learnnfun/auth.dart';
import 'package:learnnfun/commonPages/completedPage.dart';
import 'package:learnnfun/commonPages/informationCard.dart';
import 'package:learnnfun/commonPages/taskIntro.dart';
import 'package:learnnfun/widgets.dart';

class EmpathizeOneOne extends StatefulWidget {
  EmpathizeOneOne({Key key}) : super(key: key);

  @override
  _EmpathizeOneOne createState() => _EmpathizeOneOne();
}

class _EmpathizeOneOne extends State<EmpathizeOneOne> {
  List<Question> questionSelected = [];
  final ScrollController _scrollController = ScrollController();
  bool _needsScroll = false;

  _scrollToEnd() async {
    _scrollController.animateTo(
        _scrollController.position.maxScrollExtent, duration: Duration(seconds: 1), curve: Curves.decelerate,);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    if (_needsScroll) {
      WidgetsBinding.instance.addPostFrameCallback(
              (_) => _scrollToEnd());
      _needsScroll = false;
    }

    return Scaffold(
        backgroundColor: Color(0xfff4f4f4),
        body: SafeArea(
            child: SingleChildScrollView(
              controller: _scrollController,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      backButton(context),
                      Text("Empathise",
                          style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                                  color: const Color(0xff489fb5),
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontSize: height * 0.05)),
                          textAlign: TextAlign.center),
                    ],
                  ),
                  Container(
                    //1
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              height: height * 0.07,
                              width: width * 0.15,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffffa62b),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: width * 0.03, right: width * 0.03),
                                child: Image.asset("assets/chatGirl.png"),
                              )),
                          // Rectangle 28
                          Container(
                            width: width * 0.7,
                            height: height * 0.3,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color(0x338b8b8b),
                                      offset: Offset(0, 4),
                                      blurRadius: 4,
                                      spreadRadius: 4)
                                ],
                                color: const Color(0xffffffff)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: width * 0.03,
                                      right: width * 0.03,
                                      top: height * 0.01),
                                  child: Text(
                                    "Hey John! It’s nice to meet you. I heard you wanted to get to know me. What would you like to know?",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.quicksand(
                                      color: Color(0xff1a1b41),
                                      fontSize: height * 0.018,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics:  ClampingScrollPhysics(),
                                    itemCount: questionList.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      Question question = questionList[index];
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            questionSelected.removeRange(0, questionSelected.length);
                                            questionSelected.add(question);
                                            _needsScroll = true;
                                          });
                                        },
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [Container(
                                            width:width * 0.7,
                                                  color: questionSelected.isEmpty?Colors.white:questionSelected[0] == questionList[index]
                                                      ? Colors.green
                                                      : Colors.white,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(top:height*0.016, bottom: height*0.016, left: width*0.01),
                                                    child: Text(question.quesText,
                                                      style: GoogleFonts.quicksand(
                                                          color: const Color(0xff1a1b41),
                                                          fontStyle: FontStyle.normal,
                                                          fontSize: height * 0.018),
                                                      textAlign: TextAlign.center),
                                                ),
                                              ),
                                            Divider(thickness: height*0.001,)
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: width * 0.015,
                          ),
                        ]),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: questionSelected.length,
                    itemBuilder: (BuildContext context, int index) {
                      Question qSel = questionSelected[index];
                      return Padding(
                        padding: EdgeInsets.only(top:height*0.02, bottom:height*0.02,),
                        child: Column(

                            children: [
                          //2
                          Padding(
                            padding: EdgeInsets.only(bottom:height*0.02,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                              children: [
                                Container(

                                  width: width * 0.75,
                                  height: height * 0.05,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(12)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: const Color(0x338b8b8b),
                                            offset: Offset(0, 4),
                                            blurRadius: 4,
                                            spreadRadius: 4)
                                      ],
                                      color: const Color(0xffffffff)),
                                  child:Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: width * 0.03,
                                                right: width * 0.03,
                                                top: height * 0.01,
                                              ),
                                              child: Text(
                                                qSel.quesText,
                                                textAlign: TextAlign.left,
                                                style: GoogleFonts.quicksand(
                                                  color: Color(0xff1a1b41),
                                                  fontSize: height * 0.018,
                                                ),
                                              ),
                                            ),

                                          ],
                                        ),
                                ),
                                    Container(
                                      height: height * 0.07,
                                      width: width * 0.15,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xff489fb5),
                                      ),
                                    ),
                              ],
                            ),
                          ),


                          Container(
                            //3
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      height: height * 0.07,
                                      width: width * 0.15,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xffffa62b),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: width * 0.03,
                                            right: width * 0.03),
                                        child: Image.asset("assets/chatGirl.png"),
                                      )),
                                  // Rectangle 28
                                  Container(
                                    width: width * 0.7,
                                    height: height * 0.3,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(20)),
                                        boxShadow: [
                                          BoxShadow(
                                              color: const Color(0x338b8b8b),
                                              offset: Offset(0, 4),
                                              blurRadius: 4,
                                              spreadRadius: 4)
                                        ],
                                        color: const Color(0xffffffff)),
                                    child: Column(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: width * 0.03,
                                                    right: width * 0.03,
                                                    top: height * 0.01),
                                                child: Text(
                                                  qSel.ansText,
                                                  textAlign: TextAlign.left,
                                                  style: GoogleFonts.quicksand(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff1a1b41),
                                                    fontSize: height * 0.022,
                                                  ),
                                                ),
                                              ),
                                              qSel.qFollowUp!=null?Expanded(
                                                child: ListView.builder(
                                                  physics: ClampingScrollPhysics(),
                                                  itemCount: qSel.qFollowUp.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int indexInner) {
                                                    Question question =
                                                        qSel.qFollowUp[indexInner];
                                                    print(question.ansText);
                                                    return GestureDetector(
                                                      onTap: () {
                                                        setState(() {

                                                          questionSelected.removeRange(index+1, questionSelected.length);
                                                          questionSelected.add(question);
                                                          _needsScroll = true;
                                                        });
                                                      },
                                                      child: Column(
                                                        children: [
                                                          Container(

                                                            width:width * 0.7,
                                                            color: questionSelected.contains(question)
                                                                ? Colors.green
                                                                : Colors.white,
                                                            child: Padding(
                                                            padding: EdgeInsets.only(top:height*0.016, bottom: height*0.016, left: width*0.01),
                                                            child:Text(
                                                                question.quesText,
                                                                style: GoogleFonts
                                                                    .quicksand(
                                                                        color: const Color(
                                                                            0xff1a1b41),
                                                                        fontStyle:
                                                                            FontStyle
                                                                                .normal,
                                                                        fontSize:
                                                                            height *
                                                                                0.018),
                                                                textAlign:
                                                                    TextAlign.center)),
                                                          ),
                                                          Divider(thickness: height*0.001,)
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ):button(context, text: "Continue", onTap: (){
                                                userDocReference.update({
                                                  "trophies":1,
                                                  "rewards":1,
                                                  "taskUnlocked":1
                                                });
                                                currentProgress.taskUnlocked = 2;
                                                currentProgress.rewards=1;
                                                currentProgress.trophies=1;
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => TaskCompleted(isTask: true,),
                                                      settings: RouteSettings(name: 'Task Completed')),
                                                );
                                              }),
                                            ],
                                          ),
                                  ),
                                  Container(
                                    width: width * 0.015,
                                  ),
                                ]),
                          )
                        ]),
                      );
                    },
                  ),
                ]),
          ),
        ));
  }
}

class Question {
  final String quesText;
  final String ansText;
  final List<Question> qFollowUp;

  Question({
    @required this.quesText,
    @required this.ansText,
    this.qFollowUp,
  });
}


///Add a list of Questions in qFollowUp to be able to continue the chat. if there is no qFollowp, it will end there.
final questionList = [
  Question(
    quesText: "What sport do you like to play the most?",
    ansText:
        "I like to play basketball",
    qFollowUp: [
      Question(
          quesText: "Which position do you play",
          ansText: 'Center',
          qFollowUp: [
            Question(ansText: "Lebron James", quesText: "Do you have a favourite player?" )
          ]
          ),
      Question(
          quesText: "Which player do you like?",
          ansText: 'Lebron James',
          ),
      Question(
          quesText: "How often do you watch it ",
          ansText: 'Regularly',
          qFollowUp: [
            Question(ansText: "Lebron James", quesText: "Do you have a favourite player?" )
          ]
          ),
    ],
  ),
  Question(
    quesText: "What do you like to do in your free time?",
    ansText:
        "I enjoy playing Basketball a lot",
    qFollowUp: [
      Question(
        quesText: "Which position do you play",
        ansText: 'Center',
          qFollowUp: [
            Question(ansText: "Lebron James", quesText: "Do you have a favourite player?" )
          ]
      ),
      Question(
        quesText: "Which player do you like?",
        ansText: 'Lebron James',
      ),
      Question(
        quesText: "How often do you watch it ",
        ansText: 'Regularly',
          qFollowUp: [
            Question(ansText: "Lebron James", quesText: "Do you have a favourite player?" )
          ]
      ),
    ],
  ),
  Question(
    quesText: "Do you like to play sports?",
    ansText:
        "Yes I do. I enjoy playing Basketball the most",
    qFollowUp: [
      Question(
        quesText: "Which position do you play",
        ansText: 'Center',
          qFollowUp: [
            Question(ansText: "Lebron James", quesText: "Do you have a favourite player?" )
          ]
      ),
      Question(
        quesText: "Which player do you like?",
        ansText: 'Lebron James',
      ),
      Question(
        quesText: "How often do you watch it ",
        ansText: 'Regularly',
          qFollowUp: [
            Question(ansText: "Lebron James", quesText: "Do you have a favourite player?" )
          ]
      ),
    ],
  ),
];