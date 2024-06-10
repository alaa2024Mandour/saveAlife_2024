import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class BloodBanks extends StatefulWidget {
  const BloodBanks({Key? key}) : super(key: key);

  @override
  State<BloodBanks> createState() => _BloodBanksState();
}

class _BloodBanksState extends State<BloodBanks> {
  int _selectedIndex = 0;

  List<String> _tabs = ["الشاطبي", "كوم الدكة", "الهلال الأحمر"];
  List<double> _bloodQuantities = [458, 254, 356, 320, 342, 34, 50];
  List<String> _bloodTypes = ['B+', 'B-', 'A+', 'A-', 'AB+', 'O+', 'O-'];

  void _onTabPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Positioned(
                left: 0,
                top:25 ,
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/icons/icons8-back-100.png',
                    width: 40,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 40,horizontal: 120),
                child: Image.asset(
                  'assets/images/icons/icons8-glucometer-96.png',
                  width: 150,
                  height: 80,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_tabs.length, (index) {
              return TextButton(
                onPressed: () => _onTabPressed(index),
                child: Text(
                  _tabs[index],
                  style: TextStyle(
                    color: _selectedIndex == index ? Colors.red : Colors.black,
                  ),
                ),
              );
            }),
          ),
          Divider(color: Colors.grey),
          Expanded(
            child: ListView.builder(
              itemCount: _bloodQuantities.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _bloodTypes[index],
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
                        textAlign: TextAlign.right,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Slider(
                              value: _bloodQuantities[index],
                              min: 0,
                              max: 500,
                              activeColor: Colors.purple,
                              inactiveColor: Colors.grey,
                              onChanged: (value) {
                                setState(() {
                                  _bloodQuantities[index] = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 50,
                            child: Text(
                              _bloodQuantities[index].toInt().toString(),
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'يمكنك تغيير الكمية من الزر أدناه.',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    locale: Locale('ar', 'AE'), // Set Arabic locale
    supportedLocales: [
      Locale('ar', 'AE'),
    ],
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    home: Directionality(
      textDirection: TextDirection.rtl, // Set text direction to RTL
      child: BloodBanks(),
    ),
  ));
}
