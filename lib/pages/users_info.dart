import 'package:flutter/material.dart';
import 'package:nav/models/users.dart';

class UserInfoPage extends StatefulWidget {
  Users userInfo;
  UserInfoPage({required this.userInfo});

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info about you'),
        centerTitle: true,
      ),
      body: Card(
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            ListTile(
              title: Text('${widget.userInfo.name}', style: TextStyle(fontWeight: FontWeight.w400),),
            ),
            ListTile(
              title: Text('${widget.userInfo.phone}', style: TextStyle(fontWeight: FontWeight.w400),),
            ),
            ListTile(
              title: Text('${widget.userInfo.nicknames}', style: TextStyle(fontWeight: FontWeight.w400),),
            ),
            ListTile(
              title: Text('${widget.userInfo.email}', style: TextStyle(fontWeight: FontWeight.w400),),
            ),
          ],
        ),
      ),
    );
  }
}
