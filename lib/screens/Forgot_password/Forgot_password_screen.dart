import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sceelie/screens/Forgot_password/Forgot_password_screen.dart';

// import '../color_class.dart';
import 'package:sceelie/color_class.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size med = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: cColor().black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: med.height * 0.2,
            ),


            //logo image
            Center(
              child: Container(
                height: med.height * 0.2,
                width: med.width * 0.8,
                decoration: BoxDecoration(
                  color: cColor().black,
                  image: DecorationImage(
                    image: AssetImage("assets/logo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: med.height * 0.05,
            ),

            Center(child: Text("Forgot Password?",style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.bold),)),

             SizedBox(
              height: med.height * 0.03,
            ),
            Center(child: Text("A new password will be sent",style: TextStyle(fontSize: 20,color: Colors.white),)),
            Center(child: Text("to the Email below",style: TextStyle(fontSize: 18,color: Colors.white),)),
             SizedBox(
              height: med.height * 0.09,
            ),

            //email textfield
            Center(
              child: Container(
                width: med.width * 0.65,
                decoration: BoxDecoration(
                  color: cColor().blue,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextFormField(
                  style: TextStyle(
                    color: cColor().yellow,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: cColor().yellow,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        borderSide: BorderSide(color: cColor().blue)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        borderSide: BorderSide(color: cColor().blue)),
                    labelStyle: TextStyle(
                      color: cColor().yellow,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Rosario"
                    ),
                    labelText: "Email",
                    contentPadding: EdgeInsets.only(left: 18),
                    // ignore: missing_return
                  ),

                  // validator: (val) => val.length < 6 ? 'Password too short.' : null,
                  // onSaved: (val) => _password = val,
                  // obscureText: _obscureText,
                ),
              ),
            ),

            SizedBox(
              height: med.height * 0.06,
            ),

            //Password
            

            //login button
            Container(
              //margin: EdgeInsets.only(left: 15),
              height: med.height * 0.06,
              width: med.width * 0.35,
              child: RaisedButton(
                onPressed: () {
                  passwordController.clear();
                  emailController.clear();
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (_) => MainAdminPage()));
                },
                child: Text(
                  "Send",
                  style: TextStyle(
                      fontSize: 18,
                      letterSpacing: 1.0,
                      color: cColor().lightBlue,fontFamily: "Rosario"),
                ),
                color: cColor().yellow,
                textColor: cColor().lightBlue,
                hoverColor: cColor().lightYello,
                highlightColor: cColor().lightYello,
                splashColor: cColor().lightYello,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),

            SizedBox(
              height: med.height * 0.03,
            ),

            //Sign Up text
           
            
          ],
        ),
      ),
    );
  }
}
