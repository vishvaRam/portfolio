import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/Constants/Constants.dart';
import 'package:portfolio/Custom_Widgets/MaxWidthWidget.dart';
import 'package:portfolio/Custom_Widgets/ResponsiveLayOutBuilder.dart';
import 'package:portfolio/Custom_Widgets/SectionTitle.dart';
import 'package:url_launcher/url_launcher.dart';


class Contacts extends StatefulWidget {
  final GlobalKey<ScaffoldState> sacffoldKey;
  const Contacts({Key key, this.sacffoldKey}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {

  String name, emailOfClient, subjectOfClient;
  String emailId = "backbenchdevelopersin@gmail.com";
  String pass = "Vishva@badminton";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isEmailSent;

  // String appID = "EE570C4F-97E1-40CA-9A64-17D9070EB0F2";
  // String jsID = "D6F83479-F460-45BA-BE6D-DB82E18233F8";
  //
  // emailSender() async {
  //   // Backendless.messaging.sendTextEmail("Portfolio Contact", "$name $emailOfClient $subjectOfClient",
  //   //     ["backbenchdevelopersin@gmail.com"]).then((response) {
  //   //   print("Email has been sent");
  //   // });
  //
  //   Map<String, String> header = {
  //     "Content-Type": "application/json",
  //     "Access-Control_Allow_Origin": "*"
  //   };
  //
  //   var res = await http.post(
  //       Uri.https("api.backendless.com", "/$appID/$jsID/messaging/email"),
  //       headers: header,
  //       body: jsonEncode(<String, dynamic>{
  //         "subject": subjectOfClient,
  //         "bodyparts": <String, dynamic>{
  //           "textmessage": subjectOfClient,
  //           "htmlmessage": null
  //         },
  //         "to": [emailId],
  //       }));
  //   print(res.statusCode);
  //   print(res.body);
  // }

  // validateForm() {
  //   if (formKey.currentState.validate()) {
  //     print("Validated");
  //     // emailSender();
  //   } else {
  //     print("Not Validate");
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // Backendless.initWebApp(appID, jsID);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height / 2,
      color: kDarkGreyColor,
      child: ResponsiveLayoutBuilder(
        mobile: Container(
          height: screenSize.height - kNavBarHeightMobile,
          child: buildContactMobile(),
        ),
        tablet: Container(
          height: screenSize.height - kNavBarHeightTab,
          width: screenSize.width / 1.4,
          child: MaxWidth(child: buildContactTab()),
        ),
        desktop: MaxWidth(
          child: buildContactDeskTop(),
        ),
      ),
    );
  }

  Column buildContactDeskTop() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: SectionTitle(
            title: "Contact",
            fontSize: 38,
            lineHeight: 6,
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child:Image.asset( "Assets/Images/contact.png",fit: BoxFit.contain)
                ),
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: FittedBox(
                          child: Text(
                            "Estimate your project?\nLet me know here.",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 38,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Container( 
                        child: Builder(
                          builder: (context) => InkWell(
                            onTap: () async {
                              await Clipboard.setData(ClipboardData(
                                      text: "backbenchdevelopersin@gmail.com"))
                                  .then((value) {
                                print("Copied");
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text("Copied"),
                                  behavior: SnackBarBehavior.floating,
                                ));
                              });
                            },
                            child: FittedBox(
                              child: SelectableText(
                                "backbenchdevelopersin@gmail.com",
                                style: TextStyle(
                                    fontSize: 34,
                                    color: kYellowColor,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    // Expanded(
                    //   child: Container(
                    //     alignment: Alignment.centerLeft,
                    //     child: FittedBox(
                    //       child: Text(
                    //         "What's your name?",
                    //         style: TextStyle(
                    //           color: kYellowColor,
                    //           fontSize: 28,
                    //         ),
                    //         textAlign: TextAlign.start,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Expanded(
                    //   child: Container(
                    //     padding: EdgeInsets.symmetric(horizontal: 8),
                    //     child: TextFormField(
                    //       textCapitalization: TextCapitalization.sentences,
                    //       textAlign: TextAlign.start,
                    //       style: TextStyle(fontSize: 24, color: Colors.white),
                    //       onChanged: (value) {
                    //         setState(() {
                    //           name = value;
                    //         });
                    //       },
                    //       validator: MultiValidator([
                    //         RequiredValidator(errorText: 'Name is required!'),
                    //         MinLengthValidator(3,
                    //             errorText:
                    //                 'Name must be at least 3 characters long'),
                    //       ]),
                    //       decoration: InputDecoration(
                    //           // errorText: validateName(nameC.text),
                    //           errorStyle: TextStyle(color: Colors.redAccent),
                    //           errorBorder: UnderlineInputBorder(
                    //               borderSide: BorderSide(
                    //                   color: Colors.red, width: 1)),
                    //           fillColor: Colors.white70,
                    //           focusColor: kYellowColor,
                    //           enabledBorder: UnderlineInputBorder(
                    //               borderSide: BorderSide(
                    //                   color: Colors.white70, width: 1)),
                    //           border: UnderlineInputBorder(
                    //               borderSide: BorderSide(
                    //                   color: Colors.white70, width: 2)),
                    //           focusedBorder: UnderlineInputBorder(
                    //               borderSide: BorderSide(
                    //                   color: kYellowColor, width: 2))),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // Expanded(
                    //   child: Container(
                    //     alignment: Alignment.centerLeft,
                    //     child: FittedBox(
                    //       child: Text(
                    //         "Your fancy email",
                    //         style: TextStyle(
                    //           color: kYellowColor,
                    //           fontSize: 28,
                    //         ),
                    //         textAlign: TextAlign.start,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Expanded(
                    //   child: Container(
                    //     padding: EdgeInsets.symmetric(horizontal: 8),
                    //     child: TextFormField(
                    //       textCapitalization: TextCapitalization.sentences,
                    //       textAlign: TextAlign.start,
                    //       onChanged: (value) {
                    //         setState(() {
                    //           emailOfClient = value;
                    //         });
                    //       },
                    //       validator: MultiValidator([
                    //         EmailValidator(
                    //             errorText: 'Enter a valid email address'),
                    //         RequiredValidator(
                    //             errorText: "Your Email is required")
                    //       ]),
                    //       style: TextStyle(fontSize: 24, color: Colors.white),
                    //       decoration: InputDecoration(
                    //           fillColor: Colors.white70,
                    //           focusColor: kYellowColor,
                    //           errorStyle: TextStyle(color: Colors.redAccent),
                    //           enabledBorder: UnderlineInputBorder(
                    //               borderSide: BorderSide(
                    //                   color: Colors.white70, width: 1)),
                    //           border: UnderlineInputBorder(
                    //               borderSide: BorderSide(
                    //                   color: Colors.white70, width: 2)),
                    //           focusedBorder: UnderlineInputBorder(
                    //               borderSide: BorderSide(
                    //                   color: kYellowColor, width: 2))),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // Expanded(
                    //   child: Container(
                    //     alignment: Alignment.centerLeft,
                    //     child: FittedBox(
                    //       child: Text(
                    //         "Tell me about your project",
                    //         style: TextStyle(
                    //           color: kYellowColor,
                    //           fontSize: 28,
                    //         ),
                    //         textAlign: TextAlign.start,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Expanded(
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //         flex: 8,
                    //         child: Container(
                    //           padding: EdgeInsets.symmetric(horizontal: 8),
                    //           child: TextFormField(
                    //             textCapitalization:
                    //                 TextCapitalization.sentences,
                    //             textAlign: TextAlign.start,
                    //             onChanged: (value) {
                    //               setState(() {
                    //                 subjectOfClient = value;
                    //               });
                    //             },
                    //             style: TextStyle(
                    //                 fontSize: 24, color: Colors.white),
                    //             validator: MultiValidator([
                    //               RequiredValidator(
                    //                   errorText: 'Subject is required!'),
                    //               MinLengthValidator(3,
                    //                   errorText:
                    //                       'Name must be at least 50 characters long'),
                    //             ]),
                    //             decoration: InputDecoration(
                    //                 errorStyle:
                    //                     TextStyle(color: Colors.redAccent),
                    //                 fillColor: Colors.white70,
                    //                 focusColor: kYellowColor,
                    //                 enabledBorder: UnderlineInputBorder(
                    //                     borderSide: BorderSide(
                    //                         color: Colors.white70, width: 1)),
                    //                 border: UnderlineInputBorder(
                    //                     borderSide: BorderSide(
                    //                         color: Colors.white70, width: 2)),
                    //                 focusedBorder: UnderlineInputBorder(
                    //                     borderSide: BorderSide(
                    //                         color: kYellowColor, width: 2))),
                    //           ),
                    //         ),
                    //       ),
                    //       Expanded(
                    //           flex: 1,
                    //           child: IconButton(
                    //               icon: Icon(
                    //                 Icons.arrow_forward_rounded,
                    //                 color: kYellowColor,
                    //                 size: 38,
                    //               ),
                    //               onPressed: () {
                    //                 validateForm();
                    //               }))
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // )
                  ],
                ),
              ))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.instagram,
                    color: kYellowColor,
                    size: 32,
                  ),
                  onPressed: () async {
                    String url =
                        "https://www.instagram.com/backbenchdevelopers/";
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              ),
              SizedBox(width: 10,),
              Container(
                child: IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.linkedin,
                    color: kYellowColor,
                    size: 32,
                  ),
                  onPressed: () async {
                    String url =
                        "https://www.linkedin.com/in/vishva-murthy-8ab273181/";
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Column buildContactMobile() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: SectionTitle(
            title: "Contact",
            fontSize: 28,
            lineHeight: 5,
          ),
        ),
        Expanded(
            child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: Text(
                        "Estimate your project?\nLet me know here.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    child: Builder(
                      builder: (context) => InkWell(
                        onTap: () async {
                          await Clipboard.setData(ClipboardData(
                              text: "backbenchdevelopersin@gmail.com"))
                              .then((value) {
                            print("Copied");
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text("Copied"),
                              behavior: SnackBarBehavior.floating,
                            ));
                          });
                        },
                        child: FittedBox(
                          child: SelectableText(
                            "backbenchdevelopersin@gmail.com",
                            style: TextStyle(
                                fontSize: 28,
                                color: kYellowColor,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                    ),
                  ),
                )

                // Expanded(
                //   child: Container(
                //     alignment: Alignment.centerLeft,
                //     child: FittedBox(
                //       child: Text(
                //         "What's your name?",
                //         style: TextStyle(
                //           color: kYellowColor,
                //           fontSize: 26,
                //         ),
                //         textAlign: TextAlign.center,
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Expanded(
                //   child: Container(
                //     padding: EdgeInsets.symmetric(horizontal: 8),
                //     child: TextFormField(
                //       textCapitalization: TextCapitalization.sentences,
                //       textAlign: TextAlign.center,
                //       style: TextStyle(fontSize: 22, color: Colors.white),
                //       onChanged: (value) {
                //         setState(() {
                //           name = value;
                //         });
                //       },
                //       validator: MultiValidator([
                //         RequiredValidator(errorText: 'Name is required!'),
                //         MinLengthValidator(3,
                //             errorText:
                //                 'Name must be at least 3 characters long'),
                //       ]),
                //       decoration: InputDecoration(
                //           // errorText: validateName(nameC.text),
                //           errorStyle: TextStyle(color: Colors.redAccent),
                //           errorBorder: UnderlineInputBorder(
                //               borderSide:
                //                   BorderSide(color: Colors.red, width: 1)),
                //           fillColor: Colors.white70,
                //           focusColor: kYellowColor,
                //           enabledBorder: UnderlineInputBorder(
                //               borderSide:
                //                   BorderSide(color: Colors.white70, width: 1)),
                //           border: UnderlineInputBorder(
                //               borderSide:
                //                   BorderSide(color: Colors.white70, width: 2)),
                //           focusedBorder: UnderlineInputBorder(
                //               borderSide:
                //                   BorderSide(color: kYellowColor, width: 2))),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 15,
                // ),
                // Expanded(
                //   child: Container(
                //     alignment: Alignment.centerLeft,
                //     child: FittedBox(
                //       child: Text(
                //         "Your fancy email",
                //         style: TextStyle(
                //           color: kYellowColor,
                //           fontSize: 26,
                //         ),
                //         textAlign: TextAlign.center,
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Expanded(
                //   child: Container(
                //     padding: EdgeInsets.symmetric(horizontal: 8),
                //     child: TextFormField(
                //       textCapitalization: TextCapitalization.sentences,
                //       textAlign: TextAlign.center,
                //       onChanged: (value) {
                //         setState(() {
                //           emailOfClient = value;
                //         });
                //       },
                //       validator: MultiValidator([
                //         EmailValidator(
                //             errorText: 'Enter a valid email address'),
                //         RequiredValidator(errorText: "Your Email is required")
                //       ]),
                //       style: TextStyle(fontSize: 22, color: Colors.white),
                //       decoration: InputDecoration(
                //           fillColor: Colors.white70,
                //           focusColor: kYellowColor,
                //           errorStyle: TextStyle(color: Colors.redAccent),
                //           enabledBorder: UnderlineInputBorder(
                //               borderSide:
                //                   BorderSide(color: Colors.white70, width: 1)),
                //           border: UnderlineInputBorder(
                //               borderSide:
                //                   BorderSide(color: Colors.white70, width: 2)),
                //           focusedBorder: UnderlineInputBorder(
                //               borderSide:
                //                   BorderSide(color: kYellowColor, width: 2))),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 15,
                // ),
                // Expanded(
                //   child: Container(
                //     alignment: Alignment.centerLeft,
                //     child: FittedBox(
                //       child: Text(
                //         "Tell me about your project",
                //         style: TextStyle(
                //           color: kYellowColor,
                //           fontSize: 26,
                //         ),
                //         textAlign: TextAlign.center,
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Expanded(
                //   child: Row(
                //     children: [
                //       Expanded(
                //         flex: 8,
                //         child: Container(
                //           padding: EdgeInsets.symmetric(horizontal: 8),
                //           child: TextFormField(
                //             textCapitalization: TextCapitalization.sentences,
                //             textAlign: TextAlign.center,
                //             onChanged: (value) {
                //               setState(() {
                //                 subjectOfClient = value;
                //               });
                //             },
                //             style: TextStyle(fontSize: 22, color: Colors.white),
                //             validator: MultiValidator([
                //               RequiredValidator(
                //                   errorText: 'Subject is required!'),
                //               MinLengthValidator(3,
                //                   errorText:
                //                       'Name must be at least 50 characters long'),
                //             ]),
                //             decoration: InputDecoration(
                //                 errorStyle: TextStyle(color: Colors.redAccent),
                //                 fillColor: Colors.white70,
                //                 focusColor: kYellowColor,
                //                 enabledBorder: UnderlineInputBorder(
                //                     borderSide: BorderSide(
                //                         color: Colors.white70, width: 1)),
                //                 border: UnderlineInputBorder(
                //                     borderSide: BorderSide(
                //                         color: Colors.white70, width: 2)),
                //                 focusedBorder: UnderlineInputBorder(
                //                     borderSide: BorderSide(
                //                         color: kYellowColor, width: 2))),
                //           ),
                //         ),
                //       ),
                //       Expanded(
                //           flex: 1,
                //           child: IconButton(
                //               icon: Icon(
                //                 Icons.arrow_forward_rounded,
                //                 color: kYellowColor,
                //                 size: 38,
                //               ),
                //               onPressed: () {
                //                 validateForm();
                //               }))
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 10,
                // )
              ],
            ),
          ),
        )),
        Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.instagram,
                    color: kYellowColor,
                    size: 28,
                  ),
                  onPressed: () async {
                    String url =
                        "https://www.instagram.com/backbenchdevelopers/";
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              ),
              Container(
                child: IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.linkedin,
                    color: kYellowColor,
                    size: 28,
                  ),
                  onPressed: () async {
                    String url =
                        "https://www.linkedin.com/in/vishva-murthy-8ab273181/";
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Container buildContactTab() {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width / 1.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SectionTitle(
              title: "Contact",
              fontSize: 38,
              lineHeight: 6,
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.topCenter,
                      child: FittedBox(
                        child: Text(
                          "Estimate your project?\nLet me know here.",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Builder(
                        builder: (context) => InkWell(
                          onTap: () async {
                            await Clipboard.setData(ClipboardData(
                                text: "backbenchdevelopersin@gmail.com"))
                                .then((value) {
                              print("Copied");
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text("Copied"),
                                behavior: SnackBarBehavior.floating,
                              ));
                            });
                          },
                          child: FittedBox(
                            child: Text(
                              "backbenchdevelopersin@gmail.com",
                              style: TextStyle(
                                  fontSize: 28,
                                  color: kYellowColor,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ),
          )),
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.instagram,
                      color: kYellowColor,
                      size: 28,
                    ),
                    onPressed: () async {
                      String url =
                          "https://www.instagram.com/backbenchdevelopers/";
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
                ),
                Container(
                  child: IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.linkedin,
                      color: kYellowColor,
                      size: 28,
                    ),
                    onPressed: () async {
                      String url =
                          "https://www.linkedin.com/in/vishva-murthy-8ab273181/";
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
