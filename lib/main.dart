import 'package:flutter/material.dart';

void main() {

  runApp(MaterialApp(

    home: DigitalPetApp(),

  ));

}


class DigitalPetApp extends StatefulWidget {

  @override

  _DigitalPetAppState createState() => _DigitalPetAppState();

}


class _DigitalPetAppState extends State<DigitalPetApp> {

  String petName = "Your Pet";

  int happinessLevel = 50;

  int hungerLevel = 50;

  int _imageCounter = 0;

  String _currentImage = 'lib/img/cat-nothing.png';

  // Function to increase happiness and update hunger when playing with the pet

  void _playWithPet() {

    setState(() {

      happinessLevel = (happinessLevel + 10).clamp(0, 100);

      _updateHunger();

    });

  }

  void _changeCatImage() {
    setState(() {
      _imageCounter++;
      switch (_imageCounter) {
        case 0:
          _currentImage = 'lib/img/cat-nothing.png';
          break;
        case 1:
          _currentImage = 'lib/img/2.png';
          break;
        case 2:
          _currentImage = 'lib/img/3.png';
          break;
        default:
          _currentImage = 'lib/img/1.png';
          break;
      }
      if (_imageCounter > 2) {
        _imageCounter = 0;
      }
    });
  }

// Function to decrease hunger and update happiness when feeding the pet

  void _feedPet() {

    setState(() {

      hungerLevel = (hungerLevel - 10).clamp(0, 100);

      _updateHappiness();

    });

  }


// Update happiness based on hunger level

  void _updateHappiness() {

    if (hungerLevel < 30) {

      happinessLevel = (happinessLevel - 20).clamp(0, 100);

    } else {

      happinessLevel = (happinessLevel + 10).clamp(0, 100);

    }

  }


// Increase hunger level slightly when playing with the pet

  void _updateHunger() {

    hungerLevel = (hungerLevel + 5).clamp(0, 100);

    if (hungerLevel > 100) {

      hungerLevel = 100;

      happinessLevel = (happinessLevel - 20).clamp(0, 100);

    }

  }


  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text('Digital Pet'),

      ),

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Image.asset(_currentImage, width: 400, height: 400,),
            
            Text(

              'Name: $petName',

              style: TextStyle(fontSize: 20.0),

            ),

            SizedBox(height: 16.0),

            Text(

              'Happiness Level: $happinessLevel',

              style: TextStyle(fontSize: 20.0),

            ),

            SizedBox(height: 16.0),

            Text(

              'Hunger Level: $hungerLevel',

              style: TextStyle(fontSize: 20.0),

            ),

            SizedBox(height: 32.0),

            ElevatedButton(

              onPressed: _playWithPet,

              child: Text('Play with Your Pet'),

            ),

            SizedBox(height: 16.0),

            ElevatedButton(

              onPressed: _feedPet,

              child: Text('Feed Your Pet'),

            ),

          ],

        ),

      ),

    );

  }

}