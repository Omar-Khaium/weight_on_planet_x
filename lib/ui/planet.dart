import 'package:flutter/material.dart';

class Planet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new PlanetState();
  }
}

class PlanetState extends State<Planet> {
  int _groupValue = 0;
  double _weightFactor = 1.00;
  double _calculatedWeight = 0.00;
  String _selectedPlanet = "X";

  TextEditingController _weightChangeController = new TextEditingController();

  @override
  void initState() {
    _weightChangeController.addListener(calculateWeight);
  }

  @override
  void dispose() {
    _weightChangeController.dispose();
  }

  calculateWeight() {
    setState(() {
      if (_weightChangeController.text.isNotEmpty) {
        _calculatedWeight = int.parse(_weightChangeController.text) * _weightFactor;
      }
    });
  }

  void _onRadioValueChange(int position) {
    setState(() {
      _groupValue = position;
      switch (position) {
        case 0:
          _weightFactor = 0.06;
          _selectedPlanet = "Pluto";
          break;

        case 1:
          _weightFactor = 0.38;
          _selectedPlanet = "Mars";
          break;

        case 2:
          _weightFactor = 2.34;
          _selectedPlanet = "Juipter";
          break;
      }
      calculateWeight();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: Text("Weight On Planet X"),
        backgroundColor: Colors.blueGrey.shade700,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            new Container(
              margin: EdgeInsets.all(16),
              child: Image.asset(
                "images/planet.png",
                width: 100,
                height: 100,
              ),
            ),
            new Container(
              margin: EdgeInsets.all(16),
              child: TextField(
                onChanged: (text){
                  calculateWeight();
                },
                controller: _weightChangeController,
                cursorColor: Colors.white,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Weight",
                  labelStyle: new TextStyle(color: Colors.white),
                  icon: new Icon(
                    Icons.person_outline,
                    color: Colors.white,
                  ),
                  isDense: true,
                  hintText: "Enter your weight",
                ),
              ),
            ),
            new Container(
                margin: EdgeInsets.all(16),
                child: new Row(
                  children: <Widget>[
                    new Radio<int>(
                      activeColor: Colors.white,
                      value: 0,
                      groupValue: _groupValue,
                      onChanged: _onRadioValueChange,
                    ),
                    new Text(
                      "Pluto",
                      style: new TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    new Radio<int>(
                        activeColor: Colors.white,
                        value: 1,
                        groupValue: _groupValue,
                        onChanged: _onRadioValueChange),
                    new Text(
                      "Mars",
                      style: new TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    new Radio<int>(
                        activeColor: Colors.white,
                        value: 2,
                        groupValue: _groupValue,
                        onChanged: _onRadioValueChange),
                    new Text(
                      "Jupiter",
                      style: new TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                )),
            new Center(
              child: new Text(
                "Weight in Planet $_selectedPlanet is ${_calculatedWeight.toStringAsFixed(2)} lbs",
                style: new TextStyle(fontSize: 16, color: Colors.greenAccent, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
