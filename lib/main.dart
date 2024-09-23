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

  String _currentImage = 'lib/img/cat-nothing.png';

  final TextEditingController _nameController = TextEditingController();

  // Function to increase happiness and update hunger when playing with the pet

  void _playWithPet() {

    setState(() {

      happinessLevel = (happinessLevel + 10).clamp(0, 100);

      _updateHunger();

    });

  }

  Color _getPetColor() {
    if (happinessLevel > 70) {
      return Colors.green;
    } else if (happinessLevel >= 30 && happinessLevel <= 70) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }
  
  String _getMood() {
    if (happinessLevel > 70) {
      return "Happy 😄";
    } else if (happinessLevel >= 30 && happinessLevel <= 70) {
      return "Neutral 😐";
    } else {
      return "Unhappy 😢";
    }
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

  void _namePet() {
    setState(() {
      petName = _nameController.text;
    });
    _nameController.clear();
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
            Image.asset(
              _currentImage,
              width: 200,
              height: 200,
              color: _getPetColor(),
              colorBlendMode: BlendMode.modulate,
            ),
            SizedBox(height: 20),
            Text(_getMood(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
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

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Pet Name',
                ),
              ),
            ),

            ElevatedButton(

              onPressed: _namePet,

              child: Text('Name Your Pet'),

            ),

            SizedBox(height: 16.0),

          ],

        ),

      ),

    );

  }

}