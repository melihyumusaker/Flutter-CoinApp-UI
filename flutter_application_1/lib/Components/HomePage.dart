// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/CoinPage.dart';
import 'package:flutter_application_1/colors/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: null,
      body: Column(
        children: const [
          appBarSkip(),
          Img(),
          Text1(),
          Text2(),
          EmptyIcon(),
          CreateButton(),
          LoginButton()
        ],
      ),
    );
  }
}

class EmptyIcon extends StatelessWidget {
  const EmptyIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Icon(
          Icons.more_horiz,
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already has an account?",
          style: TextStyle(color: Color(0xff7d8796), fontSize: 14),
        ),
        TextButton(
            onPressed: () {},
            child: const Text("Login",
                style: TextStyle(color: Colors.grey, fontSize: 14)))
      ],
    );
  }
}

class CreateButton extends StatelessWidget {
  const CreateButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 50,
        height: 60,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: const Color(0xff6f8a9d),
            ),
            onPressed: () {},
            child: const Text("Create New Wallet")),
      ),
    );
  }
}

class Text2 extends StatelessWidget {
  const Text2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: SizedBox(
        width: 270,
        child: Text(
          "Trade will the Crypto world with an app, easy to use and secure",
          style: TextStyle(color: Color(0xff7d8796), fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class Text1 extends StatelessWidget {
  const Text1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 30.0, bottom: 20),
      child: Text(
        "Crupto Wallet",
        style: TextStyle(
            color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class Img extends StatelessWidget {
  const Img({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 200,
        child: Image.asset(
          'assets/images/watch.png',
          fit: BoxFit.fill,
        ));
  }
}

// ignore: camel_case_types
class appBarSkip extends StatelessWidget {
  const appBarSkip({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, bottom: 40),
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Align(
          alignment: Alignment.bottomRight,
          child: InkWell(
              onTap: () {
                Navigator.of(context).push(createRoute());
              },
              child: const Text("Skip",
                  style: TextStyle(color: MyColor.skipButtonColor))),
        ),
      ),
    );
  }
}

Route createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const CoinPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}
