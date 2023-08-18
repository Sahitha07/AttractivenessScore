import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Person {
  String? name, sex, haircolor, eyecolor, facialhair, role;
  int? age, weight, height;

  Person(
      String name,
      String sex,
      String haircolor,
      String eyecolor,
      String facialhair,
      String role,
      int age,
      int weight,
      int height,
      ) {
    this.name = name;
    this.haircolor = haircolor;
    this.eyecolor = eyecolor;
    this.facialhair = facialhair;
    this.sex = sex;
    this.role = role;
    this.age = age;
    this.weight = weight;
    this.height = height;
  }
}

int rateAttractiveness(Person person) {
  int attractivenessScore = 0;

  if (person.haircolor == "blonde") {
    attractivenessScore += 95;
  }
  if (person.role == "leader") {
    attractivenessScore += 100;
  }

  if (person.facialhair == "yes") {
    attractivenessScore += 97;
  }

  if (person.eyecolor == "grey") {
    attractivenessScore += 99;
  }

  if (person.height == 180) {
    attractivenessScore += 89;
  }

  return attractivenessScore;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attractiveness App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AttractivenessScreen(),
    );
  }
}

class AttractivenessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attractiveness Scores'),
      ),
    body: Container(
    decoration: BoxDecoration(
    image: DecorationImage(
    image: NetworkImage(
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI3fi4vfifagGrTNECDKyZVPQePaL53m5_dQ&usqp=CAU"
    ),
    fit: BoxFit.cover,
    ),
    ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PersonCard(person: Person(
                "Namjoon", "Male", "black", "brown", "yes", "leader", 29, 65, 185),
              color: Colors.purpleAccent,
            ),
            PersonCard(person: Person(
                "Seokjin", "Male", "blonde", "black", "no", "visual", 30, 62, 186),
            color: Colors.purpleAccent,
            ),
            PersonCard(person: Person(
               "Yoongi", "Male", "black", "brown", "no","rapper", 28, 62, 180),
            color: Colors.purpleAccent,
            ),
            PersonCard(person: Person(
                "Hoseok", "Male", "blonde", "black", "no","dancer", 28, 62, 18),
            color:Colors.purpleAccent,
            ),

            PersonCard(person: Person(
                "Jimin", "Male", "Pink", "grey", "yes", "vocal", 27, 60, 175),
            color: Colors.purpleAccent,
            ),
            PersonCard(person: Person(
                "Taehyung", "Male", "blue", "hazel", "yes", "vocal", 28, 65, 180),
            color: Colors.purpleAccent,
            ),
            PersonCard(person: Person(
              "Jungkook", "Male", "purple", "grey", "yes", "vocal", 26, 62, 184),
            color: Colors.purpleAccent,
            ),







    // Add other PersonCard widgets for the remaining persons
          ],
        ),
      ),
    ),
    );
  }
}
class PersonCard extends StatelessWidget {
  final Person person;
  final Color color;

  PersonCard({required this.person, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PersonDetailsPage(person: person)),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: color,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            person.name!,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class PersonDetailsPage extends StatelessWidget {
  final Person person;

  PersonDetailsPage({required this.person});

  @override
  Widget build(BuildContext context) {
    int attractivenessScore = rateAttractiveness(person);

    return Scaffold(
      appBar: AppBar(
        title: Text('Person Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${person.name}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("Sex: ${person.sex}"),
            Text("Hair Color: ${person.haircolor}"),
            Text("Eye Color: ${person.eyecolor}"),
            Text("Facial Hair: ${person.facialhair}"),
            Text("Role: ${person.role}"),
            Text("Age: ${person.age}"),
            Text("Weight: ${person.weight}"),
            Text("Height: ${person.height}"),
            SizedBox(height: 20),
            Text("Attractiveness Score: $attractivenessScore", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
