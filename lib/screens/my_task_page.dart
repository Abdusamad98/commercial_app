import 'package:commercial_app/service/api_provider.dart';
import 'package:flutter/material.dart';

class MyTaskPage extends StatefulWidget {
  const MyTaskPage({Key? key}) : super(key: key);

  @override
  State<MyTaskPage> createState() => _MyTaskPageState();
}

class _MyTaskPageState extends State<MyTaskPage> {
  var provider = ApiProvider();
  String myToken = "";

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordController,
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () async {
                  var username = usernameController.text;
                  var password = passwordController.text;
                  String token = await provider.loginUser(
                    username: username,
                    password: password,
                  );
                  setState(() {
                    myToken = token;
                  });
                  print(myToken);
                },
                child: Text("LOGIN")),
            Row(
              children: [
                Text("Token"),
                Expanded(child: Text(myToken)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
