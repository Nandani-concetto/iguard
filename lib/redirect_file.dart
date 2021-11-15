import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MaterialApp(
      home: RedirectPage(),
    ));

class RedirectPage extends StatefulWidget {
  const RedirectPage({Key? key}) : super(key: key);

  @override
  _RedirectPageState createState() => _RedirectPageState();
}

class _RedirectPageState extends State<RedirectPage> {

  static const platform = MethodChannel('com.concetto.volume');
  String? volumeLevel;

  void setMethodCallHandler() {
    platform.setMethodCallHandler((MethodCall call) async {
      switch(call.method){
        case 'entry':
          print('hello,${call.arguments}');
          try {
            setState(() {
                        volumeLevel='Volume is ${call.arguments}';
                      });

            print('Here $volumeLevel');
          } catch (e) {
            print('error is $e');
          }
          break;
      }



    });
  }

  void _getVolumeLevel() async {
    String localVolume = "No volume";
    try {
      final int result = await platform.invokeMethod('getVolumeLevel');
      localVolume = 'Volume level is $result % .';
    } on PlatformException catch (e) {
      localVolume = "Failed to get Volume level: '${e.message}'.";
    }
    print("here $localVolume");
setState(() {
  volumeLevel = localVolume;
});
  }
@override
  void initState() {
    super.initState();
    _getVolumeLevel();
    setMethodCallHandler();
  }
  updateVolumes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 50),
            child: Text(
              'Percentage of Volume',
              style: TextStyle(
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w700,
                  color: Colors.blueAccent,
                  fontSize: 30),
            ),
          ),
          Text("$volumeLevel"),
        ],
      ),
    );
  }


  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}





