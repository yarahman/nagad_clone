import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:nagad_clone/database/data_lists.dart';
import 'package:nagad_clone/widgets/home_body_widget.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String phone = "${LocalDatabase.phone_number}";
  TextEditingController password = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.deepOrange
    ));
   // detectPhoneNumber();

  }
  // detectPhoneNumber()async{
  //
  //   try{
  //     phone = (await MobileNumber.mobileNumber)!;
  //     setState(() {
  //
  //     });
  //   }catch(e){
  //     print(e);
  //   }
  //
  // }

  bool isKeyShow = false;
  bool isShowInput = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(

      backgroundColor: Colors.white,

      body: SafeArea(
        child:  SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Container(
                //height: MediaQuery.of(context).size.height*.6,

                child: Column(
                  children: [
                    Container(

                      child: Row(

                        children: [

                          Align(

                            child: Container(
                              child: Row(
                                children: [
                                  Container(
                                    height:28,
                                    padding:EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                                    child: Text("বাং"),
                                    decoration: BoxDecoration(

                                        border: Border.all(color: Colors.deepOrange),
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomLeft:Radius.circular(15) )

                                    ),
                                  ),
                                  Container(
                                    height:28,

                                    padding:EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                                    child: Text("Eng",style: TextStyle(
                                        color: Colors.white
                                    ),),
                                    decoration: BoxDecoration(
                                        color: Colors.deepOrange,
                                        border: Border.all(color: Colors.deepOrange),
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight:Radius.circular(15) )

                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                        mainAxisAlignment: MainAxisAlignment.end,
                      ),
                    ),

                    Container(
                        height: 100,
                        width: 100,
                        child: Image.asset("assets/nagad_app_Icon.png", fit: BoxFit.cover,)
                    ),
                    Text(
                      "নগদ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                          fontSize: 40
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("Mobile Number", style: TextStyle(
                        color: Colors.grey.withOpacity(0.5)

                    ),),
                    SizedBox(height: 10,),
                    Text(
                      phone,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,

                      ),),

                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(Icons.lock_outline_rounded,color: Colors.deepOrange, ),
                        SizedBox(width: 15,),

                        isShowInput ? InkWell(
                          onTap: (){
                            setState(() {
                              isKeyShow = !isKeyShow;
                            });
                          },
                          child: Container(
                            width: size.width/1.3,
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(width: 1.6, color: Colors.deepOrange, )
                                )
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("PIN",
                                  style: TextStyle(
                                      color: Colors.deepOrange
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  children: [

                                    for(var i=0; i<text.length; i++)
                                      if(i < 4)
                                        Container(
                                          width: 15,
                                          height: 15,
                                          margin: EdgeInsets.only(right: 10),
                                          decoration: BoxDecoration(
                                              color: Color(0xFF182739),
                                              borderRadius: BorderRadius.circular(100)
                                          ),
                                        )
                                  ],
                                )

                              ],
                            ),
                          ),
                        ):InkWell(
                          onTap: (){
                            setState(() {
                              isKeyShow = true;
                              isShowInput = true;
                            });
                          },
                          child: Container(
                            width: size.width/1.3,
                            height: 30,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(width: 1.5, color: Colors.grey, )
                                )
                            ),
                            child: Text("PIN",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black45
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 35,),

                    InkWell(
                      onTap: (){
                        login();
                      },
                      child: Container(
                        width: 240,
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                            color: text.length != 4 ? Colors.white : Colors.deepOrange,
                            border: Border.all(color: Colors.deepOrange),
                            borderRadius: BorderRadius.circular(25)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            isLoading ? SpinKitCircle(
                              color: Colors.white,
                              size: 20,
                            ) : Center(),
                            SizedBox(width: 5,),
                            Text(" ${isLogdin ? "LOGED IN" : "LOGIN" }", style: TextStyle(
                                color:  text.length != 4 ? Colors.black45 : Colors.white,
                                fontWeight: FontWeight.w600
                            ),),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 35,),
                    Text("Forgot PIN?", style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey.withOpacity(0.8)
                    ),)

                  ],
                ),
              ),



            ],
          ),
        )
      ),

      bottomNavigationBar: isKeyShow ? Container(
        width: size.width,
        height: 270,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 2),
              height: 45,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width*.3,
                        color: Colors.white,
                        child: Image.asset("assets/ic_storelocator.png"),
                      ),
                      Text("Store Locator", style: TextStyle(
                          fontSize: 12,
                          color: Colors.black45
                      ),)
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width*.3,
                        color: Colors.white,
                        child: Image.asset("assets/ic_offers.png"),
                      ),
                      Text("Offers", style: TextStyle(
                          fontSize: 12,
                          color: Colors.black45
                      ),)
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width*.3,
                        color: Colors.white,
                        child: Image.asset("assets/ic_faq.png"),
                      ),
                      Text("Help", style: TextStyle(
                          fontSize: 12,
                          color: Colors.black45
                      ),)
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 3,),
            Container(
              height: 220,
              color: Color(0xFF182739),
              child: NumericKeyboard(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                onKeyboardTap: _onKeyboardTap,
                textColor: Colors.white,
                rightButtonFn: () {
                  setState(() {
                    text.removeLast();
                  });
                },
                rightIcon: Icon(
                  Icons.backspace,
                  color: Colors.white,
                ),
                leftButtonFn: () {
                  setState(() {
                    isKeyShow = false;
                  });
                  print('left button clicked');
                },
                leftIcon: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      )
          :Container(
        margin: EdgeInsets.only(bottom: 2),
        height: 60,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width*.3,
                  color: Colors.white,
                  child: Image.asset("assets/ic_storelocator.png"),
                ),
                Text("Store Locator", style: TextStyle(
                  fontSize: 12,
                  color: Colors.black45
                ),)
              ],
            ),
            Column(
              children: [
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width*.3,
                  color: Colors.white,
                  child: Image.asset("assets/ic_offers.png"),
                ),
                Text("Offers", style: TextStyle(
                    fontSize: 12,
                    color: Colors.black45
                ),)
              ],
            ),
            Column(
              children: [
                Container(
                  height: 35,
                  width: MediaQuery.of(context).size.width*.3,
                  color: Colors.white,
                  child: Image.asset("assets/ic_faq.png"),
                ),
                Text("Help", style: TextStyle(
                    fontSize: 12,
                    color: Colors.black45
                ),)
              ],
            )
          ],
        ),
      ),

    );
  }
List text = [];

  _onKeyboardTap(String value) {
    if(text.length != 4){
      setState(() {
        text.add(value);
      });
    }

    password.text = text[0];
    print(text[0]);
  }

  ///this is for login
  bool isLoading = false;
  bool isLogdin = false;
  void login() {
    setState(() {
      isLoading = true;
    });
    Future.delayed(Duration(seconds: 2)).then((value) {
      setState(() {
        isLoading = false;
        isLogdin = true;
      });
      Future.delayed(Duration(milliseconds: 200)).then((value) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>MyHomePage(title: '',)));
      });

    });


  }
}
