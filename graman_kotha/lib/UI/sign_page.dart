import 'package:flutter/material.dart';
import 'package:graman_kotha/UI/homepage.dart';
import 'package:graman_kotha/unilt/customtextfile.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
   bool _isRememberMeChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                 Image.asset("image/2.png",height: 112,width: 112,fit: BoxFit.contain,),
                 SizedBox(height: 10,),
                 Text("German Kotha",style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                 ),),
                 SizedBox(height: 10,),
                 Text("Pleace enter your details to sign up ",style: TextStyle(
                  color: Color(0xff58615F),
                 ),),
                 SizedBox(height: 20,),
                 Container(
                  height: 48,
                  width: 343,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                    
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 48,
                        width: 172,
                        decoration: BoxDecoration(
                        color: Color(0xff2E826E),
                        borderRadius: BorderRadius.circular(20)
                        ),
                        child: MaterialButton(onPressed: (){

                        },
                        child: Text('Sign in',style: TextStyle(
                          color: Colors.white
                        ),),),
                      ),
                      SizedBox(width: 20,),
                      Container(
                        height: 48,
                        child: MaterialButton(onPressed: (){

                        },child: Text('Sign up'),),
                      )
                    ],
                  ),
                 ),
                SizedBox(height: 30,),
                Customtextfile(hinttext: 'Enter your email ', text: "Email "),
                SizedBox(height: 10,),
                Customtextfile(hinttext: "Password", text: "Password",),
                Row(
                  children: [
                    Checkbox(
                      value: _isRememberMeChecked,
                      onChanged: (value) {
                        setState(() {
                          _isRememberMeChecked = value!;
                        });
                      },
                    ),
                    Text("Remember Me"),
                    SizedBox(width: 150,),
                    TextButton(
                  onPressed: () {
                    
                  },
                  child: Text("Forgot password?"),
                ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){

                      },
                      child: Image.asset("image/4.png")),
                    SizedBox(width: 5,),
                     GestureDetector(
                      onTap: (){

                      },
                      child: Image.asset("image/6.png")),
                    
                     GestureDetector(
                      onTap: (){

                      },
                      child: Image.asset("image/7.png")),
                     SizedBox(width: 5,),
                      GestureDetector(
                        onTap: (){

                        },
                        child: Image.asset("image/5.png")),


                  ],
                ),
                SizedBox(height: 40,),
                
                ElevatedButton(
              onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (_)=> LevelSelectionPage()));},
              child: Text("Sign In"),
              
              style: ElevatedButton.styleFrom(
                minimumSize: Size(343, 43),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
            ),
            SizedBox(height: 15,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have a account?"),
              TextButton(onPressed: (){
               
              
              },child: Text("Sign up",style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),)
                ],
              ),
            )
            
                
              ],
            ),
                )
              ],
            ),
          );
         


  }
}