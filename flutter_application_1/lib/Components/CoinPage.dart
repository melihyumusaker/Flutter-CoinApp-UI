// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/CoinDetailPage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:flutter_application_1/colors/colors.dart';

class CoinPage extends StatelessWidget {
  const CoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MyBottomNavigationBar(),
      body: Column(
        children: const [
          AppBar(),
          Text1(),
          Text2(),
          Text3(),
          CoinValue(),
          OperationCards(),
          CoinInformationHeader(),
          CoinInformation(),
        ],
      ),
    );
  }
}

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: MyColor.homeColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.graphic_eq), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "")
      ],
    );
  }
}

class CoinInformation extends StatelessWidget {
  const CoinInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      Icons.currency_bitcoin,
      Icons.attach_money_outlined,
      Icons.storage,
      CupertinoIcons.bell
    ];

    final text1 = ["BTC", "ETH", "SQL", "RING"];
    final text2 = ["Bitcoin", "Etherium", "MsSQL", "Ring Tone"];
    final price = ["\$23,000", "\$15,000", "\$1240", "\$45800"];
    final text3 = ["\$35025,70", "\$35025,70", "\$0,430400", "\$2,01608"];
    final text4 = ["+05,64%", "-0,72%", "+05,64%", "+04,15"];

    return Expanded(
      child: ListView.builder(
          padding: const EdgeInsets.all(25),
          itemCount: icons.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CoinDetailPage()));
                },
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.white30,
                  child: Center(
                    child: SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Icon(
                                icons[index],
                                color: Colors.amber,
                              ),
                              const SizedBox(width: 10),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    text1[index],
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    text2[index],
                                    style:
                                        const TextStyle(color: Colors.black54),
                                  )
                                ],
                              )
                            ],
                          ),
                          Text(price[index]),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(text3[index],
                                  style: const TextStyle(color: Colors.white)),
                              Text(
                                text4[index],
                                style: const TextStyle(color: Colors.black87),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class CoinInformationHeader extends StatelessWidget {
  const CoinInformationHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Text(
            "Best Indicators",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "Price",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "24h Change",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}

class OperationCards extends StatelessWidget {
  const OperationCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CardBuilder(
            icon: const Icon(
              Icons.arrow_upward,
              size: 60,
              color: Colors.white,
            ),
            text: "Buy"),
        CardBuilder(
            icon: const Icon(
              Icons.change_circle,
              size: 60,
              color: Colors.white,
            ),
            text: "Change"),
        CardBuilder(
            icon: const Icon(
              Icons.arrow_drop_down,
              size: 60,
              color: Colors.white,
            ),
            text: "Deposit"),
      ],
    );
  }
}

// ignore: must_be_immutable
class CardBuilder extends StatelessWidget {
  CardBuilder({
    required this.icon,
    required this.text,
    Key? key,
  }) : super(key: key);

  late Icon icon;
  late String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 120,
      child: Card(
        elevation: 7,
        color: const Color(0xff1a3139),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            icon,
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class CoinValue extends StatelessWidget {
  const CoinValue({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.currency_bitcoin, color: Colors.orange),
          Text("BTC 8,57", style: TextStyle(color: Colors.white)),
          Icon(Icons.attach_money_outlined, color: Colors.green),
          Text("USD 19,05", style: TextStyle(color: Colors.white)),
          Icon(MdiIcons.alphaL, color: Colors.grey),
          Text("LTC 14,47", style: TextStyle(color: Colors.white))
        ],
      ),
    );
  }
}

class Text3 extends StatelessWidget {
  const Text3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "+\$1245     +6,54%",
      style: TextStyle(color: Colors.white),
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
      padding: EdgeInsets.only(bottom: 15.0),
      child: Text(
        '\$34,000',
        style: TextStyle(color: Colors.white, fontSize: 32),
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
      padding: EdgeInsets.only(top: 20.0, bottom: 15),
      child: Text(
        "My Banance",
        style: TextStyle(color: Color(0xff7d8796), fontSize: 16),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 55.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(
            Icons.notifications_on_rounded,
            color: Colors.white,
          ),
          SizedBox(
            width: 250,
            height: 50,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xff273c44),
                hintText: "Type to Search",
                hintStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
              ),
            ),
          ),
          const Icon(
            Icons.fullscreen,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
