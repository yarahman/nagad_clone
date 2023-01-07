import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nagad_clone/pages/login_page.dart';
import 'package:nagad_clone/widgets/home_body_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 4)).then((value) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/flsh_bg.png"), fit: BoxFit.cover)
        ),
        child: Stack(
          children: [
            ///logo
            // Center(
            //   child: Container(
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         children: [
            //           SizedBox(
            //             height: MediaQuery.of(context).size.height*.15,
            //           ),
            //           Container(
            //             child: Image.asset("assets/ic_nagad.png",scale: 0.3,),
            //           ),
            //           SizedBox(height: 5,),
            //           Container(
            //             child: Image.asset("assets/nagad_label.png",scale: 7,),
            //           ),
            //           Text("ডাক বিভাগের ডিজিটাল লেনদেন", style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 10
            //           ),)
            //
            //         ],
            //       ),
            //     ),
            //
            // ),
            ///nagod version
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text("11.21.01", style: TextStyle(
                      color: Colors.white,
                      fontSize: 10
                  ),)
              ),
            ),
            ///loading
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 25),
                height: 50,
                width: 30,
                child: SpinKitThreeBounce(
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),



          ],
        ),
      )

    );
  }
}
