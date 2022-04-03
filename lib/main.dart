import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<ApplicationColor>(
        create: (_) => ApplicationColor(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Consumer<ApplicationColor>(
              builder: (context, appColor, _) => Text(
                'Homework Provider',
                style: TextStyle(color: appColor.color),
              ),
            ),
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<ApplicationColor>(
                  builder: (context, appColor, _) => AnimatedContainer(
                    margin: EdgeInsets.all(5.0),
                    width: 200,
                    height: 200,
                    color: appColor.color,
                    duration: Duration(milliseconds: 500),
                  ),
                ),
                Consumer<ApplicationColor>(
                  builder: (context, appColor, _) => Switch(
                    value: appColor.isLightBlue,
                    onChanged: (newValue) {
                      appColor.isLightBlue = newValue;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 
class ApplicationColor extends ChangeNotifier {
  bool _isLightBlue = true;
 
  bool get isLightBlue => _isLightBlue;
  set isLightBlue(bool value) {
    _isLightBlue = value;
 
    notifyListeners();
  }
 
  Color get color => (_isLightBlue) ? UniqueMyColor.getColor() : UniqueMyColor.getColor();
}
 
class UniqueMyColor {
  static Random random = Random();
  static Color getColor() {
    return Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }
}