import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:save_a_life_2024/shared/components/shared_component.dart';
import 'package:save_a_life_2024/shared/style/colors.dart';
import 'package:url_launcher/link.dart';
import '../home_page/home_page.dart';
import '../user_cubit/userCubit.dart';
import '../user_cubit/userStatus.dart';
import 'nearst_blood_bank.dart';
import 'package:flutter_charts/flutter_charts.dart';

class BloodChart {
  final String bloodType;
  final int bages;
  final Color color;

  BloodChart({
    required this.bloodType,
    required this.bages,
    this.color = Colors.red,
  });
}

class BankInfo extends StatelessWidget {
  BankInfo({Key? key}) : super(key: key);
  List<BloodChart> bloodCount = [
    BloodChart(
      bloodType: "A+",
      bages: 15,
    ),
    BloodChart(
      bloodType: "A-",
      bages: 15,
    ),
    BloodChart(
      bloodType: "AB+",
      bages: 15,
    ),
    BloodChart(
      bloodType: "AB-",
      bages: 15,
    ),
    BloodChart(
      bloodType: "B+",
      bages: 15,
    ),
    BloodChart(
      bloodType: "B-",
      bages: 15,
    ),
    BloodChart(
      bloodType: "O+",
      bages: 15,
    ),
    BloodChart(
      bloodType: "O-",
      bages: 15,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStatus>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = UserCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                navigateTo(context, UserHomePage());
              },
              icon: const Icon(
                Icons.double_arrow_rounded,
                size: 35,
              ),
            ),
          ),
          body: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${NearestBank.BankName}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(40),
                                  boxShadow: [
                                    BoxShadow(
                                      color: HexColor('#EAEAEA'),
                                      blurRadius: 4.0,
                                      spreadRadius: 2.0,
                                    ),
                                  ]),
                              child: Row(
                                children: [
                                  const Text("الموقع",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900,
                                      )),
                                  const Spacer(),
                                  Link(
                                    target: LinkTarget.blank,
                                    uri: Uri.parse(NearestBank.BankLocation),
                                    builder: (BuildContext context,
                                        Future<void> Function()? followLink) {
                                      return IconButton(
                                          onPressed: followLink,
                                          icon: Icon(
                                            Icons
                                                .keyboard_double_arrow_left_rounded,
                                            size: 35,
                                            color: defultColor,
                                          ));
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        "عدد الفصائل المتوفره",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: defultColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: BarChart(
                        BarChartData(
                        borderData: FlBorderData(
                            border: const Border(
                          top: BorderSide.none,
                          right: BorderSide.none,
                          bottom: BorderSide(width: 1),
                          left: BorderSide(width: 1),
                        )),
                        groupsSpace: 8,
                        barGroups: [
                          bloodPageeQuantity(1, 10),
                          bloodPageeQuantity(2, 8),
                          bloodPageeQuantity(3, 11),
                          bloodPageeQuantity(4, 15),
                          bloodPageeQuantity(5, 5),
                          bloodPageeQuantity(6, 2),
                          bloodPageeQuantity(7, 6),
                          bloodPageeQuantity(8, 9),
                        ],
                          titlesData: FlTitlesData(
                        bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                            getTitlesWidget: getTitles,
                            showTitles: true,
                            reservedSize: 38),
                    ),
                                    ),
                        )),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

BarChartGroupData bloodPageeQuantity(int bloodId, double quantity) =>
    BarChartGroupData(
        x: bloodId,
        barRods: [
      BarChartRodData(fromY: 0, toY: quantity, width: 10, color: defultColor,),

    ]);

Widget getTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  Widget text;
  switch (value.toInt()) {
    case 1:
      text = const Text(' -A ', style: style);
      break;
    case 2:
      text = const Text(' +A ', style: style);
      break;
    case 3:
      text = const Text(' -AB ', style: style);
      break;
    case 4:
      text = const Text(' +AB ', style: style);
      break;
    case 5:
      text = const Text(' +B ', style: style);
      break;
    case 6:
      text = const Text(' -B ', style: style);
      break;
    case 7:
      text = const Text(' +O ', style: style);
      break;
    case 8:
      text = const Text(' -O ', style: style);
      break;
    default:
      text = const Text(' default ', style: style);
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 16,
    child: text,
  );
}
