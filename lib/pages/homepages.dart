import 'package:carcompany/auth/auth_service.dart';
import 'package:carcompany/components/my_drawer.dart';
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
              Color(0xFFE6E4E4), // Light gray (top color)
              Color(0xFFFFFFFF), // White (bottom color)
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
                height: 4000,
                width: 700,
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: 150),
                    Center(
                      child: Text(
                        "Featured Vehicles",
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Explore our selection of premium vehicles ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "available for your next adventure",
                      style: TextStyle(color: Colors.grey),
                    ),

                    SizedBox(height: 30),
                    VehicleCard(
                      imagePath: 'assets/bmwx5.png',
                      title: "BMW X5",
                      subtitle: "SUV - 2006",
                      price: '\$300 / day',
                      details: [
                        '4 Seats',
                        'Hybrid',
                        'Semi-Automatic',
                        'New York',
                      ],
                      isAvailable: true,
                    ),
                    SizedBox(height: 30),
                    VehicleCard(
                      imagePath: 'assets/toyotacorolla.png',
                      title: "Toyota Corolla",
                      subtitle: "Sedan . 2021",
                      price: '\$130 / day',
                      details: ['4 Seats', 'Diesel', 'Manual', 'Chicago'],
                      isAvailable: true,
                    ),
                    SizedBox(height: 30),
                    VehicleCard(
                      imagePath: 'assets/bmwx5.png',
                      title: "BMW X5",
                      subtitle: "SUV - 2006",
                      price: '\$300 / day',
                      details: [
                        '4 Seats',
                        'Hybrid',
                        'Semi-Automatic',
                        'New York',
                      ],
                      isAvailable: true,
                    ),
                    SizedBox(height: 30),
                    VehicleCard(
                      imagePath: 'assets/jeep.png',
                      title: "Jeep Wrangler",
                      subtitle: "SUV - 2023",
                      price: '\$200 / day',
                      details: [
                        '4 Seats',
                        'Hybrid',
                        'Automatic',
                        'Los Angeles',
                      ],
                      isAvailable: true,
                    ),
                    SizedBox(height: 30),
                    VehicleCard(
                      imagePath: 'assets/toyotacorolla.png',
                      title: "Toyota Corolla",
                      subtitle: "Sedan . 2021",
                      price: '\$130 / day',
                      details: ['4 Seats', 'Diesel', 'Manual', 'Chicago'],
                      isAvailable: true,
                    ),
                    SizedBox(height: 30),
                    VehicleCard(
                      imagePath: 'assets/fordneo.png',
                      title: "Ford Neo 6",
                      subtitle: "Sedan . 2022",
                      price: '\$209 / day',
                      details: [
                        '2 Seats',
                        'Diesel',
                        'Semi-Automatic',
                        'Houston',
                      ],
                      isAvailable: true,
                    ),
                    SizedBox(height: 100),
                    Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Row(
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
                    SizedBox(height: 100),
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
                            gradient: LinearGradient(
                              colors: [Colors.blue, Colors.white],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 10),
                              SizedBox(
                                height: 90,
                                width: 250,
                                child: Text(
                                  "Do You Own a Luxury Car?",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  // textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 20),
                              Column(
                                children: [
                                  Text(
                                    "Monetize your vehicle effortlessly by",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 120),
                                    child: Text(
                                      "listing it on CarRental.",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 40),
                                    child: Text(
                                      "We take care of insurance, driver",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Text(
                                      "Verification and secure payments -",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 40),
                                    child: Text(
                                      "so you can earn passive income,",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 210),
                                    child: Text(
                                      "stress-free.",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 150),
                                    child: Container(
                                      height: 50,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),
                                      child: Center(
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
                                  SizedBox(height: 50),
                                  Image.asset('assets/whitecar.png'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 150),
                    Column(
                      children: [
                        Text(
                          "What Our",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Customers Say",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Discover by discerning travelers choose",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "Stay venture for their luxury accommodations.",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          "arround their world.",
                          style: TextStyle(color: Colors.grey),
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
