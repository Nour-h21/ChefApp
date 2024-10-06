import 'package:flutter/material.dart';
import 'package:project_cook/model/user_model.dart';
import 'package:project_cook/service/auth_service.dart';
import 'package:project_cook/view/naveg.dart';

class LogIn extends StatelessWidget {
  LogIn({super.key});
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 240,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('images/background_image 1.png'),
              )),
              child: const Center(
                child: Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 103,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 52,
                    width: 350,
                    child: TextField(
                      controller: email,
                      decoration: InputDecoration(
                        hintText: 'E-mail',
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF9D9FA0),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                            borderSide: const BorderSide(
                              color: Color(0xFF9D9FA0),
                            )),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF9D9FA0),
                          ),
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    height: 52,
                    width: 350,
                    child: TextField(
                      controller: password,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF9D9FA0),
                        ),
                        suffixIcon: const Icon(
                          Icons.visibility_off_outlined,
                          color: Color(0xFF9D9FA0),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                            borderSide: const BorderSide(
                              color: Color(0xFF9D9FA0),
                            )),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFF9D9FA0),
                          ),
                          borderRadius: BorderRadius.circular(
                            8,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 24,

                  // ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10, top: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          child: Text(
                            'forget password ?',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFB5B7B8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  SizedBox(
                    height: 42,
                    width: 350,
                    child: ElevatedButton(
                      onPressed: () async {
                        bool status = await signin(UserModel(
                            email: email.text, password: password.text));
                        if (status) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Success"),
                            backgroundColor: Color(0xFFFA9A0C),
                          ));

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Nav(),
                              ));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Failed"),
                            backgroundColor: Colors.red,
                          ));
                          // print(token);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFA9A0C),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const InkWell(
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account?',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF7D8FAB),
                        ),
                      ),
                      Text(
                        ' Sign Up',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFA9A0C),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
