import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nav/pages/users_info.dart';

import '../models/users.dart';

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({Key? key}) : super(key: key);

  @override
  State<RegisterFormPage> createState() => _RegisterFormPageState();
}

final _formkey = GlobalKey<FormState>();
bool _hidePassword = true;
bool _hideConfirmPassword = true;
final _controllerName = TextEditingController();
final _controllerPhone = TextEditingController();
final _controllerEmail = TextEditingController();
final _controllerDescription = TextEditingController();
final _controllerPassword = TextEditingController();
final _controllerConfirmPassword = TextEditingController();
List<String> nickname = [
  'FUUCKER',
  'DOUBBLEFUCKER',
  'SUCKER',
  'DOUBLESUCCKERRR'
];
String _selectNickname='';
Users user  = Users();

@override
void dispose() {
  _controllerName.dispose();
  _controllerPhone.dispose();
  _controllerEmail.dispose();
  _controllerDescription.dispose();
  _controllerPassword.dispose();
  _controllerConfirmPassword.dispose();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Form'),
        centerTitle: true,
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
                controller: _controllerName,
                onSaved: (value) async => user.name=value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {

                    return 'Name is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  hintText: 'What do people call u?',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _controllerName.clear();
                      });
                    },
                    icon: const Icon(Icons.delete_forever),
                  ),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide(width: 2.5, color: Colors.blueGrey)),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          width: 2.5, color: Colors.lightBlueAccent)),
                )),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _controllerPhone,
              onSaved: (value) => user.phone=value!,
              decoration: InputDecoration(
                labelText: 'Phone',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _controllerPhone.clear();
                    });
                  },
                  icon: const Icon(Icons.delete_forever),
                ),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 2.5, color: Colors.blueGrey)),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(width: 2.5, color: Colors.lightBlueAccent)),
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _controllerEmail,
              onSaved: (value) => user.email=value!,
              decoration: InputDecoration(
                labelText: 'Сранная почта',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _controllerEmail.clear();
                    });
                  },
                  icon: const Icon(Icons.delete_forever),
                ),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 2.5, color: Colors.blueGrey)),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(width: 2.5, color: Colors.lightBlueAccent)),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _controllerDescription,
              decoration: InputDecoration(
                labelText: 'Description',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _controllerDescription.clear();
                    });
                  },
                  icon: const Icon(Icons.delete_forever),
                ),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 2.5, color: Colors.blueGrey)),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(width: 2.5, color: Colors.lightBlueAccent)),
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(50),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            DropdownButtonFormField(
                decoration: const InputDecoration(
                  labelText: 'WHO??',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide(width: 2.5, color: Colors.blueGrey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          width: 2.5, color: Colors.lightBlueAccent)),
                ),
                items: nickname
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (selectnick) {

                  setState(() {
                    _selectNickname = selectnick!;
                    user.nicknames=selectnick;
                  });
                }),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _controllerPassword,
              obscureText: _hidePassword,
              maxLength: 12,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                      _hidePassword ? Icons.visibility : Icons.visibility_off),
                  color: Colors.blueGrey,
                  onPressed: () {
                    setState(() {
                      _hidePassword = !_hidePassword;
                    });
                  },
                ),
                prefixIcon: const Icon(Icons.security),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 2.5, color: Colors.blueGrey)),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(width: 2.5, color: Colors.lightBlueAccent)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _controllerConfirmPassword,
              maxLength: 12,
              obscureText: _hideConfirmPassword,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                suffixIcon: IconButton(
                  icon: Icon(_hideConfirmPassword
                      ? Icons.visibility
                      : Icons.visibility_off),
                  color: Colors.blueGrey,
                  onPressed: () {
                    setState(() {
                      _hideConfirmPassword = !_hideConfirmPassword;
                    });
                  },
                ),
                prefixIcon: const Icon(Icons.security),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 2.5, color: Colors.blueGrey)),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(width: 2.5, color: Colors.lightBlueAccent)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blueGrey)),
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UserInfoPage(
                      userInfo: user,
                    ),));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              'Form is not valid! Pls, enter your name!',
                              style: TextStyle(color: Colors.black, fontSize: 17.0),
                            )));
                  }

                },
                child: const Text('Press to register'))
          ],
        ),
      ),
    );
  }
}
