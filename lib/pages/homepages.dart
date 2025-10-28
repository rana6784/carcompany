import 'package:carcompany/auth/auth_service.dart';
import 'package:carcompany/components/my_drawer.dart';
import 'package:carcompany/pages/Car_Detailspage.dart';
import 'package:carcompany/pages/availables.dart';

import 'package:carcompany/pages/vehicle_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Homepages extends StatefulWidget {
  const Homepages({super.key});

  @override
  State<Homepages> createState() => _HomepagesState();
}

class _HomepagesState extends State<Homepages> {
  final _auth = AuthService();

  final _emailController = TextEditingController();

  // Car data - define a list for dynamic rendering
  final List<Map<String, dynamic>> _cars = [
    {
      'imagePath': "assets/bmwx5.png",
      'title': 'BMW X5',
      'subtitle': 'SUV-2006',
      'fuel': 'Hybrid',
      'transmission': 'Semi-Automatic',
      'location': 'New York',
      'seats': 4,
      'pricePerDay': 300.0,
    },
    {
      'imagePath': "assets/toyotacorolla.png",
      'title': "Toyota Corolla",
      'subtitle': "sedan.2021",
      'fuel': 'Diesel',
      'transmission': 'Automatic',
      'location': 'Los Angeles',
      'seats': 4,
      'pricePerDay': 130.0,
    },
    {
      'imagePath': "assets/bmwx5.png",
      'title': 'BMW X5',
      'subtitle': 'SUV-2006',
      'fuel': 'Hybrid',
      'transmission': 'Semi-Automatic',
      'location': 'Houston',
      'seats': 4,
      'pricePerDay': 300.0,
    },
    {
      'imagePath': "assets/jeep.png",
      'title': "Jeep Wrangler",
      'subtitle': "SUV- 2023",
      'fuel': 'Hybrid',
      'transmission': 'Automatic',
      'location': 'Chicago',
      'seats': 4,
      'pricePerDay': 200.0,
    },
    {
      'imagePath': "assets/bmwx5.png",
      'title': 'BMW X5',
      'subtitle': 'SUV-2006',
      'fuel': 'Hybrid',
      'transmission': 'Semi-Automatic',
      'location': 'New York',
      'seats': 4,
      'pricePerDay': 300.0,
    },
    {
      'imagePath': "assets/toyotacorolla.png",
      'title': "Toyota Corolla",
      'subtitle': "sedan.2021",
      'fuel': 'Diesel',
      'transmission': 'Manual',
      'location': 'Chicago',
      'seats': 4,
      'pricePerDay': 130.0,
    },
    {
      "imagePath": "assets/fordneo.png",
      "title": "Ford Neo",
      "subtitle": "Sedan 2022",
      "fuel": "Diesel",
      "transmission": "Semi-Automatic",
      "location": "Houston",
      "seats": 2,
      "pricePerDay": 209.0,
    },
  ];

  // Dropdown Data
  final List<String> _locations = [
    "New York",
    "Los Angeles",
    "Houston",
    "Chicago",
  ];

  String? _selectedLocation;
  DateTime? _pickupDate;
  DateTime? _returnDate;

  void logout() async {
    await _auth.signOut();
  }

  // Format date into readable string
  String _formatDate(DateTime? date) {
    if (date == null) return "dd-mm-yyyy";
    return DateFormat("dd-MM-yyyy").format(date);
  }

  // Date picker method
  Future<void> _selectDate(BuildContext context, bool isPickup) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        if (isPickup) {
          _pickupDate = picked;
        } else {
          _returnDate = picked;
        }
      });
    }
  }

  // Search cars method
  void _searchCars() {
    if (_selectedLocation == null ||
        _pickupDate == null ||
        _returnDate == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please fill all fields")));
      return;
    }
    // TODO: Implement search logic
  }

  // Build a single car card widget
  Widget _buildCarCard(Map<String, dynamic> car) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: InkWell(
        onTap: () {
          // Navigate to car details page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => CarDetailsPage(
                    image: car['imagePath'],
                    title: car['title'],
                    subtitle: car['subtitle'],
                    fuel: car['fuel'],
                    transmission: car['transmission'],
                    location: car['location'],
                    seats: car['seats'],
                  ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image section
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12.0),
                    ),
                    child: Image.asset(
                      car['imagePath'],
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Available Now badge
                  Positioned(
                    top: 8.0,
                    left: 8.0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Text(
                        'Available Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // Price overlay
                  Positioned(
                    bottom: 8.0,
                    right: 8.0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 6.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Text(
                        '\$${car['pricePerDay'].toStringAsFixed(0)}/day',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Details section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      car['title'],
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      car['subtitle'],
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Row(
                      children: [
                        Icon(
                          Icons.event_seat,
                          size: 20.0,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4.0),
                        Text('${car['seats']} seats'),
                        const SizedBox(width: 16.0),
                        Icon(
                          Icons.electrical_services,
                          size: 20.0,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4.0),
                        Text(car['fuel']),
                      ],
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      children: [
                        Icon(Icons.speed, size: 20.0, color: Colors.grey[600]),
                        const SizedBox(width: 4.0),
                        Text(car['transmission']),
                        const Spacer(),
                        Icon(
                          Icons.location_on,
                          size: 20.0,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4.0),
                        Text(car['location']),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 230, 228, 228),
        elevation: 1,
        title: Image.asset('assets/logoo.png', height: 28),
      ),
      drawer: const MyDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFE6E4E4), // Light gray (top color)
              const Color(0xFFFFFFFF), // White (bottom color)
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 29),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "Luxury Cars On Rent",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(blurRadius: 12, color: Colors.black12),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Pickup Location"),
                    const SizedBox(height: 6),
                    DropdownButtonFormField<String>(
                      value: _selectedLocation,
                      items:
                          _locations.map((location) {
                            return DropdownMenuItem(
                              value: location,
                              child: Text(location),
                            );
                          }).toList(),
                      decoration: InputDecoration(
                        hintText: 'Please select location',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _selectedLocation = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    const Text("Pick-up Date"),
                    const SizedBox(height: 6),
                    GestureDetector(
                      onTap: () => _selectDate(context, true),
                      child: AbsorbPointer(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: _formatDate(_pickupDate),
                            suffixIcon: const Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text("Return Date"),
                    const SizedBox(height: 6),
                    GestureDetector(
                      onTap: () => _selectDate(context, false),
                      child: AbsorbPointer(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: _formatDate(_returnDate),
                            suffixIcon: const Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: _searchCars,
                        label: const Text("Search"),
                        icon: const Icon(Icons.search),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Image.asset('assets/car.png', height: 180),
              const SizedBox(height: 40),
              Container(
                color: Colors.white,
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 150),
                    const Center(
                      child: Text(
                        "Featured Vehicles",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Explore our selection of premium vehicles ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const Text(
                      "available for your next adventure",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 30),
                    ..._cars.map(
                      (car) => Column(
                        children: [
                          _buildCarCard(car),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                    const SizedBox(height: 100),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Availables()),
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: const Row(
                          children: [
                            SizedBox(width: 50),
                            Text(
                              "Explore all cars",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Icon(Icons.arrow_forward, color: Colors.black),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 100),
                    Center(
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          height: 580,
                          width: 350,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.blue, Colors.white],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              const SizedBox(
                                height: 90,
                                width: 250,
                                child: Text(
                                  "Do You Own a Luxury Car?",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Column(
                                children: [
                                  const Text(
                                    "Monetize your vehicle effortlessly by",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 120),
                                    child: Text(
                                      "listing it on CarRental.",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 40),
                                    child: Text(
                                      "We take care of insurance, driver",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Text(
                                      "Verification and secure payments -",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 40),
                                    child: Text(
                                      "so you can earn passive income,",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 210),
                                    child: Text(
                                      "stress-free.",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 150),
                                    child: Container(
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "List your car",
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 50),
                                  Image.asset('assets/whitecar.png'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 150),
                    Column(
                      children: [
                        const Text(
                          "What Our",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const Text(
                          "Customers Say",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Discover why discerning travelers choose",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const Text(
                          "our venture for their luxury accommodations",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const Text(
                          "around their world.",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage: const AssetImage(
                                    "assets/girl1.png",
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Emma Rodriguez",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 40),
                                      child: Text(
                                        "Barcelona, Spain",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 20),
                                ),
                                Image.asset("assets/stars.png", height: 20),
                                Image.asset("assets/stars.png", height: 20),
                                Image.asset("assets/stars.png", height: 20),
                                Image.asset("assets/stars.png", height: 20),
                                Image.asset("assets/stars.png", height: 20),
                              ],
                            ),
                            const SizedBox(height: 20),
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "I've rented cars from various companies,",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "but the experience with CarRental",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "was exceptional!",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage: const AssetImage(
                                    "assets/girl2.png",
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "John Smith",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      "New York, USA",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 20),
                                ),
                                Image.asset("assets/stars.png", height: 20),
                                Image.asset("assets/stars.png", height: 20),
                                Image.asset("assets/stars.png", height: 20),
                                Image.asset("assets/stars.png", height: 20),
                                Image.asset("assets/stars.png", height: 20),
                              ],
                            ),
                            const SizedBox(height: 20),
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "CarRental made my trip so much",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "easier. The car was delivered right to",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "my door, and the customer service",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "was fantastic!",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundImage: const AssetImage(
                                    "assets/girl1.png",
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Ava Johnson",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      "Sydney, Australia",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 40),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 20),
                                ),
                                Image.asset("assets/stars.png", height: 20),
                                Image.asset("assets/stars.png", height: 20),
                                Image.asset("assets/stars.png", height: 20),
                                Image.asset("assets/stars.png", height: 20),
                                Image.asset("assets/stars.png", height: 20),
                              ],
                            ),
                            const SizedBox(height: 20),
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "I highly recommend CarRental!",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "Their fleet is amazing, and I always",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "feel like I'm getting the best deal with",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "excellent service!",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 150),
                    const Text(
                      "Never Miss a Deal! ",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      "Subscribe to get the latest offers, new",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const Text(
                      "arrivals and exclusive discounts",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 50),
                    Center(
                      child: Container(
                        height: 45,
                        width: 320,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                child: TextField(
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                    hintText: "Enter your email id",
                                    border: InputBorder.none,
                                  ),
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  // TODO: Implement subscribe logic
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(6),
                                      bottomRight: Radius.circular(6),
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18,
                                  ),
                                ),
                                child: const Text(
                                  "Subscribe",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 200),
                    Padding(
                      padding: const EdgeInsets.only(right: 200),
                      child: Image.asset("assets/logoo.png"),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                      padding: EdgeInsets.only(right: 0),
                      child: Text(
                        "Premium car rental service with a wide selection ",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    const Text(
                      "of luxury and everyday vehicles for all your driving ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 300),
                      child: Text(
                        "needs.",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        const Icon(Icons.facebook, color: Colors.grey),
                        const SizedBox(width: 10),
                        Image.asset(
                          "assets/insta.png",
                          width: 20,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          "assets/twitter.png",
                          width: 20,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.email, color: Colors.grey),
                      ],
                    ),
                    const SizedBox(height: 50),
                    const Padding(
                      padding: EdgeInsets.only(right: 220),
                      child: Text(
                        "QUICK LINKS",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.only(right: 280),
                      child: Text(
                        "Home",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.only(right: 230),
                      child: Text(
                        "Browse Cars",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.only(right: 230),
                      child: Text(
                        "List Your Car",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.only(right: 260),
                      child: Text(
                        "About Us",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Padding(
                      padding: EdgeInsets.only(right: 220),
                      child: Text(
                        "RESOURCES",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.only(right: 230),
                      child: Text(
                        "Help Centre",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.only(right: 190),
                      child: Text(
                        "Terms Of Service",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.only(right: 210),
                      child: Text(
                        "Privacy Policy",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.only(right: 240),
                      child: Text(
                        "Insurance",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Padding(
                      padding: EdgeInsets.only(right: 230),
                      child: Text(
                        "CONTACT",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.only(right: 180),
                      child: Text(
                        "1234 Luxury Drive",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.only(right: 130),
                      child: Text(
                        "San Francisco, CA 94107",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.only(right: 200),
                      child: Text(
                        "+1 234 567890",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.only(right: 160),
                      child: Text(
                        "info@example.com",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
                      endIndent: 20,
                      indent: 20,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const SizedBox(width: 50),
                        const Icon(
                          Icons.copyright,
                          color: Colors.grey,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          "2025 Brand. All rights reserved.",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const SizedBox(width: 80),
                        const Text(
                          "Privacy",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        const SizedBox(width: 10),
                        Container(height: 15, width: 1, color: Colors.grey),
                        const SizedBox(width: 10),
                        const Text(
                          "Terms",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        const SizedBox(width: 10),
                        Container(height: 15, width: 1, color: Colors.grey),
                        const SizedBox(width: 10),
                        const Text(
                          "Cookies",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
