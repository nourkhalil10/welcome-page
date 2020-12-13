import 'package:clean_login/home_page.dart';
import 'package:clean_login/providers/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _myNameController = TextEditingController();
  final _myEmailController = TextEditingController();
  final _myAgeController = TextEditingController();
  final _myImageLinkController = TextEditingController();

  @override
  void dispose() {
    _myNameController.dispose();
    _myEmailController.dispose();
    _myAgeController.dispose();
    _myImageLinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final header = Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Login', style: TextStyle(color: Colors.white, fontSize: 40)),
          SizedBox(
            height: 10,
          ),
          Text('Welcome Back',
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ],
      ),
    );
    ////////////////////////////////////////////////////////////////////////////////////////////////
    Widget textFieldContainer(
        TextEditingController controller, String errorMessage, String hintText,
        [TextInputType keyboardType = TextInputType.text]) {
      return Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey[200]),
          ),
        ),
        child: TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          validator: (value) {
            if (value.isEmpty) {
              return errorMessage;
            }
            return null;
          },
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.grey),
            hintText: hintText,
            border: InputBorder.none,
          ),
        ),
      );
    }

//////////////////////////////////////////////////////////////////////////////////////////////
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orange[900],
              Colors.orange[800],
              Colors.orange[400]
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            header,
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 40),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(225, 95, 27, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                textFieldContainer(_myNameController,
                                    'Please Enter Your Name!', 'Name'),
                                textFieldContainer(
                                    _myAgeController,
                                    'Please Enter Your Age!',
                                    'Age',
                                    TextInputType.number),
                                textFieldContainer(_myEmailController,
                                    'Please Enter Your Email!', 'Email'),
                                textFieldContainer(_myImageLinkController,
                                    'Please Enter a URL', 'Image URL'),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        InkWell(
                          onTap: () {
                            if (_formKey.currentState.validate()) {
                              Provider.of<UsersProvider>(context).addUser(
                                _myNameController.text,
                                _myEmailController.text,
                                _myAgeController.text,
                                _myImageLinkController.text,
                              );
                              Navigator.of(context)
                                  .pushNamed(HomePage.routeName);
                            }
                          },
                          child: Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.orange[900],
                            ),
                            child: Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
