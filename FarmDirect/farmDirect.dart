import 'package:flutter/material.dart';

void main() {
  runApp(FarmDirectApp());
}

class FarmDirectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FarmDirect',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LanguageSelectionScreen(),
    );
  }
}

class LanguageSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/plant.png'),
            Text(
              'FarmDirect',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Select your language',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 50,
              runSpacing: 50,
              alignment: WrapAlignment.center,
              children: [
                languageButton(context, 'English', Colors.grey[300]!),
                languageButton(context, 'हिंदी\nHindi', Colors.yellow[300]!),
                languageButton(context, 'தமிழ்\nTamil', Colors.blue[300]!),
                languageButton(context, 'ಕನ್ನಡ\nKannada', Colors.purple[300]!),
                languageButton(context, 'తెలుగు\nTelugu', Colors.green[300]!),
                languageButton(context, 'മലയാളം\nMalayalam', Colors.red[300]!),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget languageButton(BuildContext context, String language, Color color) {
    return InkWell(
      onTap: () {
        print('Selected language: $language');
        if (language == 'English') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RoleSelectionScreen()),
          );
        }
      },
      child: Container(
        width: 120,
        height: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          language,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class RoleSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/plant.png'),
            Text(
              'FarmDirect',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Select your role',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            roleButton(context, 'Farmer', Icons.agriculture),
            SizedBox(height: 10),
            roleButton(context, 'Market', Icons.storefront),
            SizedBox(height: 10),
            roleButton(context, 'Consumer', Icons.shopping_cart),
          ],
        ),
      ),
    );
  }

  Widget roleButton(BuildContext context, String role, IconData icon) {
    return InkWell(
      onTap: () {
        print('Selected role: $role');
        if (role == 'Farmer') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegistrationScreen()),
          );
        }
      },
      child: Container(
        width: 250,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.brown[50],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(icon, size: 40, color: Colors.black),
            SizedBox(width: 20),
            Text(
              role,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegistrationScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController aadharController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'FarmDirect For Farmers',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'REGISTER',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: aadharController,
              decoration: InputDecoration(
                labelText: 'Enter your Aadhar number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (nameController.text == '1' && aadharController.text == '1') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OTPVerificationScreen()),
                  );
                } else {
                  print('Invalid inputs');
                }
              },
              child: Text('Get OTP'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Handle login navigation
              },
              child: Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class OTPVerificationScreen extends StatelessWidget {
  final List<TextEditingController> otpControllers = List.generate(6, (index) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '''FarmDirect 
               For Farmers''',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'OTP Verification',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'We have sent the One time password to your Aadhaar-registered mobile number',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: otpControllers.map((controller) => otpBox(controller)).toList(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (otpControllers.every((controller) => controller.text == '1')) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddressInputScreen()),
                  );
                } else {
                  print('Invalid OTP');
                }
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }

  Widget otpBox(TextEditingController controller) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        decoration: InputDecoration(border: InputBorder.none),
        keyboardType: TextInputType.number,
        maxLength: 1,
      ),
    );
  }
}

class AddressInputScreen extends StatelessWidget {
  final TextEditingController addressLine1Controller = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressLine2Controller = TextEditingController();
  final TextEditingController stateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/plant.png'),
            TextField(
              controller: addressLine1Controller,
              decoration: InputDecoration(
                labelText: 'Flat, House No., Building, Company, Apartment',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: pincodeController,
                    decoration: InputDecoration(
                      labelText: '6-digit pincode',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: cityController,
                    decoration: InputDecoration(
                      labelText: 'Town/City',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              controller: addressLine2Controller,
              decoration: InputDecoration(
                labelText: 'Additional Address Info',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: null,
              hint: Text('Select State'),
              onChanged: (String? newValue) {
                stateController.text = newValue ?? '';
              },
              items: <String>[
                'Andhra Pradesh', 'Arunachal Pradesh', 'Assam', 'Bihar', 
                'Chhattisgarh', 'Goa', 'Gujarat', 'Haryana', 'Himachal Pradesh',
                'Jharkhand', 'Karnataka', 'Kerala', 'Madhya Pradesh', 'Maharashtra',
                'Manipur', 'Meghalaya', 'Mizoram', 'Nagaland', 'Odisha', 
                'Punjab', 'Rajasthan', 'Sikkim', 'Tamil Nadu', 'Telangana', 
                'Tripura', 'Uttar Pradesh', 'Uttarakhand', 'West Bengal'
              ]
              .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (addressLine1Controller.text.isNotEmpty &&
                    pincodeController.text.isNotEmpty &&
                    cityController.text.isNotEmpty &&
                    stateController.text.isNotEmpty) {
                  print('Address Submitted');
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => FarmerHomePage()),
                  );
                } else {
                  print('Please fill all fields');
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

class FarmerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(width: 5),
            Text('FarmDirect'),
            SizedBox(width: 5),
            Text('For Farmers',
                style: TextStyle(fontSize: 14, color: Colors.black)),
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.brown,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.black),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for supplies',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Welcome Text
            Text(
              'Welcome to FarmDirect :)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Your Crops Section
            Text(
              'Your crops',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CropCard(
                    imagePath: 'assets/images/add_crops.png',
                    label: 'Add/Edit crops',
                  ),
                  CropCard(
                    imagePath: 'assets/images/ivy_gourd.png',
                    label: 'Ivy gourd',
                  ),
                  CropCard(
                    imagePath: 'assets/images/onion.png',
                    label: 'Onion',
                  ),
                  CropCard(
                    imagePath: 'assets/images/beetroot.png',
                    label: 'Beetroot',
                  ),
                  // Add more CropCards as needed
                ],
              ),
            ),
            SizedBox(height: 20),
            // Services Section
            Text(
              'FarmDirect services',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  ServiceCard(
                      imagePath: 'assets/images/market_price.png',
                      label: 'Market price'),
                  ServiceCard(
                      imagePath: 'assets/images/crop_doctor.png',
                      label: 'Crop Doctor'),
                  ServiceCard(
                      imagePath: 'assets/images/weather.png', label: 'Weather'),
                  ServiceCard(
                      imagePath: 'assets/images/soil_test.png',
                      label: 'Soil Test'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Sales',
          ),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class CropCard extends StatelessWidget {
  final String imagePath;
  final String label;

  CropCard({required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
            backgroundColor: Colors.white,
          ),
        ),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String imagePath;
  final String label;

  ServiceCard({required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      elevation: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, height: 60),
          SizedBox(height: 10),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}