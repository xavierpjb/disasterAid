import 'package:flutter/material.dart';


void main() => runApp(new App());

class App extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Disaster Aid',
    home: MyApp(),
  );
}
}

//First View Of App
class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text("Disaster AID"),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Container(
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(10.0),
          //alignment: Alignment.center,
          //margin: EdgeInsets.only(
            // left: 10.0, right: 10.0, top: 100.0, bottom: 10.0),
          child: RaisedButton(
            textColor: Colors.white,
            color: Colors.blueAccent,
            child: Text('I want to volunteer!'),
            onPressed: () {
              navigateToSubPage(context);
              }
            ),
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            padding: EdgeInsets.all(10.0),
          //alignment: Alignment.topCenter,
          //margin: EdgeInsets.only(
            //left: 10.0, right: 10.0, top: 100.0, bottom: 10.0),
          child: RaisedButton(
            textColor: Colors.white,
            color: Colors.blueAccent,
            child: Text('I Need Help!'),
            // Within the `FirstRoute` widget
          onPressed: () {
            navigateToSubPage(context);
              }
            ),
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            padding: EdgeInsets.all(10.0),
          //alignment: Alignment.bottomCenter,
          // margin: EdgeInsets.only(
            //left: 10.0, right: 10.0, top: 100.0, bottom: 10.0),
          child: RaisedButton(
            textColor: Colors.white,
            color: Colors.blueAccent,
            child: Text('I want to donate!'),
            onPressed: () {
              navigateToSubPage(context);
              }
            ),
          )
      ]),
  );
}
Future navigateToSubPage(context) async {
Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp2()));
}
}

//Second View Of App
class MyApp2 extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text("Disaster AID"),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Container(
        margin: EdgeInsets.all(5.0),
        padding: EdgeInsets.all(10.0),
          child: RaisedButton(
            textColor: Colors.white,
            color: Colors.blueAccent,
            child: Text('Hurricane'),
            onPressed: () {
              navigateToSubPage(context);
              }
            ),
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            padding: EdgeInsets.all(10.0),
          child: RaisedButton(
            textColor: Colors.white,
            color: Colors.blueAccent,
            child: Text('Flood'),
          onPressed: () {
            navigateToSubPage(context);
              }
            ),
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            padding: EdgeInsets.all(10.0),
          child: RaisedButton(
            textColor: Colors.white,
            color: Colors.blueAccent,
            child: Text('Earthquake'),
            onPressed: () {
              navigateToSubPage(context);
              }
            ),
          )
      ]),
  );
}
Future navigateToSubPage(context) async {
Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
}
}

//Third View Of App
class MyHomePage extends StatefulWidget {
@override
_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
bool monVal = false;
bool tuVal = false;
bool wedVal = false;
bool thurVal = false;
bool friVal = false;
bool satVal = false;
bool sunVal = false;
Widget checkbox(String title, bool boolValue) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(title),
      Checkbox(
        value: boolValue,
        onChanged: (bool value) {
          /// manage the state of each value
          setState(() {
            switch (title) {
              case "Water":
                monVal = value;
                break;
              case "Food":
                tuVal = value;
                break;
              case "Clothes":
                wedVal = value;
                break;
              case "BatteryPack":
                thurVal = value;
                break;
              case "FlashLight":
                friVal = value;
                break;
              case "Women's Needs":
                satVal = value;
                break;
              case "First Aid Kit":
                sunVal = value;
                break;
            }
          });
        },
      )
    ],
  );
}
@override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic Checkboxes"),
        automaticallyImplyLeading: true,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                checkbox("Water", monVal),
                checkbox("Food", tuVal),
                checkbox("Clothes", wedVal),
                checkbox("BatteryPack", thurVal),
                checkbox("FlashLight", friVal),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                checkbox("Women's Needs", satVal),
                checkbox("First Aid Kit", sunVal),
              ],
            ),
            Container(
            margin: EdgeInsets.all(5.0),
            padding: EdgeInsets.all(10.0),
          //alignment: Alignment.bottomCenter,
          // margin: EdgeInsets.only(
            //left: 10.0, right: 10.0, top: 100.0, bottom: 10.0),
          child: RaisedButton(
            textColor: Colors.white,
            color: Colors.blueAccent,
            child: Text('Submit'),
            onPressed: () {
              navigateToSubPage(context);
            }
            ),
          ),
          ],
        ),
      )
    );
  }
  Future navigateToSubPage(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp5()));
  }
}

//Fourth View Of App
class MyApp5 extends StatelessWidget {
static const String _title = 'Flutter Code Sample';

@override
Widget build(BuildContext context) {
  return MaterialApp(
    title: _title,
    home: MyStatefulWidget(),
  );
}
}

class MyStatefulWidget extends StatefulWidget {
MyStatefulWidget({Key key}) : super(key: key);

@override
_MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
int _selectedIndex = 0;
static const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
static const List<Widget> _widgetOptions = <Widget>[
  Text(
    'Help',
    style: optionStyle,
  ),
  Text(
    'Tasks',
    style: optionStyle,
  ),
  Text(
    'Profile',
    style: optionStyle,
  ),
];

void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Tasks'),
    ),
    body: Center(
      child: _widgetOptions.elementAt(_selectedIndex),
    ),
    bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.help),
          title: Text('Help'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event_note),
          title: Text('Tasks'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.blueAccent,
      onTap: _onItemTapped,
    ),
  );
}
}
