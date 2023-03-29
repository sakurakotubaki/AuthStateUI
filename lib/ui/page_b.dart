import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PageB extends StatelessWidget {
  const PageB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.hasData) {
          // ログインしている場合の表示するウィジェット
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ログインしました！', style: TextStyle(fontSize: 30)),
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                      },
                      child: Text('Logout'))
                ],
              ),
            ),
          );
        } else {
          // ログインしていない場合の表示するウィジェット
          return Scaffold(
            body: Center(
              child: Text('ログインしていません'),
            ),
          );
        }
      },
    );
  }
}
