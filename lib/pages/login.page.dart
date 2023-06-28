import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/routes.dart';
import 'package:flutter_application_1/services/login_api.dart';
import 'package:flutter_application_1/services/token_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController pwdController = TextEditingController();

  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    Future<void> submit(String email, String pwd) async {
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final apiService = LoginApi();
        final data = await apiService.login(email, pwd, 'cliente');
        prefs.setString('token', data['token']);
        final tokenProvider =
            Provider.of<TokenProvider>(context, listen: false);
        await tokenProvider.setToken(data['token']);
        tokenProvider.notifyListeners();

        Navigator.of(context).pushNamed(DASHBOARD);
      } catch (error) {
        print('Ocorreu um erro durante o login:');
        print(error.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text('e-mail ou senha inválidos.'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: Colors.blue,
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              SizedBox(
                width: 256,
                height: 256,
                child: Image.asset('assets/logoBranca.png'),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailController,
                // autofocus: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite seu e-mail.';
                  }
                  return null;
                },
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: pwdController,
                // autofocus: true,
                keyboardType: TextInputType.text,
                obscureText: !_visible,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                  suffixIcon: IconButton(
                    icon: _visible
                        ? Icon(Icons.visibility_off_outlined)
                        : Icon(Icons.visibility_outlined),
                    onPressed: () {
                      setState(() {
                        _visible = !_visible;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite sua senha.';
                  }
                  return null;
                },
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Container(
                height: 40,
                alignment: Alignment.centerRight,
                child: RawMaterialButton(
                  child: Text(
                    "Recuperar Senha",
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 60,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: SizedBox.expand(
                  child: RawMaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                          Container(
                              child: SizedBox(
                            child: Image.asset('assets/favicon.png'),
                            height: 28,
                          )),
                        ]),
                    onPressed: () => {
                      if (formKey.currentState!.validate())
                        {submit(emailController.text, pwdController.text)}
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
