import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PageC extends StatelessWidget {
  const PageC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              body: Center(
                child: Text(
                  'ログインしました',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: email,
                        decoration: InputDecoration(
                            labelText: 'メールアドレスを入力してください',
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            )),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: password,
                        decoration: InputDecoration(
                            labelText: 'パスワードを入力してください',
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            )),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          try {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: email.text, password: password.text);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'invalid-email') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('メールアドレスのフォーマットが正しくありません'),
                                ),
                              );
                            } else if (e.code == 'user-disabled') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('現在指定したメールアドレスは使用できません'),
                                ),
                              );
                              print('現在指定したメールアドレスは使用できません');
                            } else if (e.code == 'user-not-found') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('指定したメールアドレスは登録されていません'),
                                ),
                              );
                            } else if (e.code == 'wrong-password') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('パスワードが間違っています'),
                                ),
                              );
                            }
                          }
                        },
                        child: Text('ログイン'))
                  ],
                ),
              ),
            );
          }
        });
  }
}
