import 'package:crypto_font_icons/crypto_font_icon_data.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:flutter_application_1/colors/colors.dart';

class CoinDetailPage extends StatefulWidget {
  const CoinDetailPage({super.key});

  @override
  State<CoinDetailPage> createState() => _CoinDetailPageState();
}

class _CoinDetailPageState extends State<CoinDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyAppBar(),
          ChoosenIcon(),
          Text1(),
          Text2(),
          Text3(),
          TimeRow(),
          Graphic(),
          BuyButton()
        ],
      ),
    );
  }
}

class Graphic extends StatelessWidget {
  const Graphic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(),
        series: <ChartSeries>[
          ColumnSeries<SalesData, String>(
              pointColorMapper: (SalesData sales, _) => MyColor.skipButtonColor,
              dataSource: getColumnData(),
              xValueMapper: (SalesData sales, _) => sales.x,
              yValueMapper: (SalesData sales, _) => sales.y)
        ],
      ),
    );
  }
}

class SalesData {
  String x;
  int y;
  SalesData({required this.x, required this.y});
}

dynamic getColumnData() {
  List<SalesData> columnData = <SalesData>[
    SalesData(x: "Mon", y: 65),
    SalesData(x: "Tue", y: 55),
    SalesData(x: "Wed", y: 63),
    SalesData(x: "Thu", y: 72),
    SalesData(x: "Fri", y: 75),
    SalesData(x: "Sat", y: 80),
    SalesData(x: "Sun", y: 90)
  ];

  return columnData;
}

class TimeRow extends StatefulWidget {
  TimeRow({
    Key? key,
  }) : super(key: key);

  @override
  State<TimeRow> createState() => _TimeRowState();
}

class _TimeRowState extends State<TimeRow> {
  List<String> values = ["1D", "7D", "1M", "1Y", "5Y", "ALL"];

  @override
  Widget build(BuildContext context) {
    int selectedItemIndex = 1;
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 20,
        color: Colors.transparent,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: values.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  setState(() {
                    selectedItemIndex = index;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: selectedItemIndex == index
                          ? MyColor.skipButtonColor
                          : Colors.transparent),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      values[index],
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class BuyButton extends StatelessWidget {
  const BuyButton({
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
            child: const Text("Buy Etherium")),
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
    return const Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Text(
        "-0,72%",
        style: TextStyle(color: Colors.red),
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
      padding: EdgeInsets.only(bottom: 10.0),
      child: Text(
        "\$35025,70",
        style: TextStyle(color: Colors.white, fontSize: 25),
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
      padding: EdgeInsets.only(bottom: 15.0),
      child: Text(
        "Ethereum (ETH)",
        style: TextStyle(color: MyColor.skipButtonColor),
      ),
    );
  }
}

class ChoosenIcon extends StatelessWidget {
  const ChoosenIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: SizedBox(
        width: 90,
        height: 90,
        child: Card(
          elevation: 1,
          color: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: const Icon(
            CryptoFontIcons.ETH,
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Row(
        children: [
          const SizedBox(width: 15),
          SizedBox(
            width: 50,
            height: 50,
            child: Card(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 1,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 4 - 5,
          ),
          const Center(
            child: Text(
              "Ethereum",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          )
        ],
      ),
    );
  }
}
