import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health App Interface',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFCC33), Color(0xFF6699CC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://s3.amazonaws.com/cdn.designcrowd.com/blog/15-Famous-Heart-Logos/Unilever.png',
                height: 100,
                width: 100,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RelativeScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  side: BorderSide(color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text("RELATIVE"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PatientScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  side: BorderSide(color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text("PATIENT"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/* original relative screen
class RelativeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Relative Screen")),
      body: Center(child: Text("Relative Screen Content")),
    );
  }
}*/

/* original patient screen
class PatientScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Patient Screen")),
      body: Center(child: Text("Patient Screen Content")),
    );
  }
}*/
// relatvie login screen 

class RelativeScreen extends StatefulWidget {
  @override
  _RelativeScreenState createState() => _RelativeScreenState();
}

class _RelativeScreenState extends State<RelativeScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController patientNameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

  bool isSignedUp = false;
  String? nameError;
  String? patientNameError;
  String? contactError;

  void validateAndSave() {
    setState(() {
      nameError = nameController.text.isEmpty ? "Please fill up the text field" : null;
      patientNameError = patientNameController.text.isEmpty ? "Please fill up the text field" : null;
      contactError = contactController.text.isEmpty ? "Please fill up the text field" : null;
    });

    if (nameError != null || patientNameError != null || contactError != null) {
      // Show Snackbar if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill up all the text fields"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
      return; // Stop execution if there are errors
    }

    // If all fields are filled, proceed
    setState(() {
      isSignedUp = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isSignedUp) {
      return RelativeDashboardScreen(
        relativeName: nameController.text,
        patientName: patientNameController.text,
        contact: contactController.text,
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text("Relative Sign-Up")),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFCC33), Color(0xFF6699CC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "RELATIVE",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Name: ",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    errorText: nameError, // Shows error if field is empty
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: patientNameController,
                  decoration: InputDecoration(
                    labelText: "Name of Patient: ",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    errorText: patientNameError, // Shows error if field is empty
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: contactController,
                  decoration: InputDecoration(
                    labelText: "Contact: ",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    errorText: contactError, // Shows error if field is empty
                  ),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: validateAndSave,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("Save"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Updated screen name: RelativeDashboardScreen
class RelativeDashboardScreen extends StatelessWidget {
  final String relativeName;
  final String patientName;
  final String contact;

  RelativeDashboardScreen({
    required this.relativeName,
    required this.patientName,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Relative Dashboard")),
      body: Center(
        child: Text("Welcome, $relativeName!"),
      ),
    );
  }
}


//relative monitoring screen
class RelativeMonitoringScreen extends StatelessWidget {
  final String relativeName;
  final String patientName;
  final String contact;

  RelativeMonitoringScreen({
    required this.relativeName,
    required this.patientName,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFCC33), Color(0xFF6699CC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //mali display lang yan susunod dapat yung battery percentage
            Align(
              alignment: Alignment.topRight,
              child: Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.battery_full, color: Colors.green, size: 30),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Current",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          "90 ❤️",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "100% SpO2",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                        onPressed: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HotlineScreen()),
                          );
                        },
                        backgroundColor: Colors.black,
                        child: Icon(Icons.phone, color: Colors.white),
                        ),
                      SizedBox(width: 20),
                      FloatingActionButton(
                        onPressed: () {
                        Navigator.push(
                          context,
                        MaterialPageRoute(builder: (context) => FirstAidScreen()),
                      );
                        },
                        backgroundColor: Colors.black,
                        child: Icon(Icons.medical_services, color: Colors.white),
                      ),
                      ],
                    ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person, color: Colors.black, size: 30),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("RELATIVE", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text("Name: $relativeName"),
                          Text("Name of Patient: $patientName"),
                          Text("Contact: $contact"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class FirstAidScreen extends StatelessWidget {
  final List<String> firstAidTips = [
    "1. Stop bleeding by applying pressure.",
    "2. Perform CPR if necessary.",
    "3. Treat burns with cool running water.",
    "4. Immobilize broken bones.",
    "5. Check for breathing and call emergency services."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First Aid Guide")),
      body: ListView.builder(
        itemCount: firstAidTips.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Icon(Icons.health_and_safety, color: Colors.red),
              title: Text(firstAidTips[index]),
            ),
          );
        },
      ),
    );
  }
}

class PatientScreen extends StatefulWidget {
  @override
  _PatientScreenState createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController relativeNameController = TextEditingController();
  final TextEditingController relativeContactController = TextEditingController();

  bool isSignedUp = false; // Track whether the patient has signed up

  @override
  Widget build(BuildContext context) {
    if (isSignedUp) {
      return PatientMonitoringScreen(
        patientName: nameController.text,
        relativeName: relativeNameController.text,
        relativeContact: relativeContactController.text,
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text("Patient Sign-Up")),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFCC33), Color(0xFF6699CC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "PATIENT",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: "Name: ",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: relativeNameController,
                  decoration: InputDecoration(
                    labelText: "Name of Relative: ",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: relativeContactController,
                  decoration: InputDecoration(
                    labelText: "Contact of Relative: ",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    String name = nameController.text;
                    String relativeName = relativeNameController.text;
                    String relativeContact = relativeContactController.text;

                    print(
                      "Patient: $name, Relative: $relativeName, Contact: $relativeContact",
                    );

                    setState(() {
                      isSignedUp = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("Save"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PatientMonitoringScreen extends StatelessWidget {
  final String patientName;
  final String relativeName;
  final String relativeContact;

  PatientMonitoringScreen({
    required this.patientName,
    required this.relativeName,
    required this.relativeContact,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFCC33), Color(0xFF6699CC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.battery_full, color: Colors.green, size: 30),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Current",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          "90 ❤️",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "100% SpO2",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HotlineScreen()),
                      );
                    },
                    backgroundColor: Colors.black,
                    child: Icon(Icons.phone, color: Colors.white),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person, color: Colors.black, size: 30),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("PATIENT", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text("Name: $patientName"),
                          Text("Name of Relative: $relativeName"),
                          Text("Contact of Relative: $relativeContact"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class HotlineScreen extends StatelessWidget {
  final List<String> hotlines = [
    "911",
    "112",
    "999",
    "123-456-7890" // Example number
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Emergency Hotlines")),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFCC33), Color(0xFF6699CC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "SOS",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Emergency Hotlines:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Column(
                  children: hotlines.map((number) {
                    return Text(
                      number,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                Text(
                  "Name of Relative: [Relative Name]",
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "Contact of Relative: [Relative Contact]",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}