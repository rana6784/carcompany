// Example details page
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CarDetailsPage extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final String fuel;
  final String transmission;
  final String location;
  final int seats;

  const CarDetailsPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.fuel,
    required this.transmission,
    required this.location,
    required this.seats,
  });

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> {
  DateTime? _pickupDate;

  DateTime? _returnDate;

  // Format date into readable string
  String _formatDate(DateTime? date) {
    if (date == null) return "dd-mm-yyyy";
    return DateFormat("dd-MM-yyyy").format(date);
  }

  // Date Picker method
  Future<void> _selectDate(BuildContext context, bool isPickup) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: DateTime.now(),
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
  void _bookCars() {
    if (_pickupDate == null || _returnDate == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please fill all fields")));
      return;
    }
    // TODO: Implement search logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Back to all cars",
          style: TextStyle(color: Colors.blueGrey),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 200,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(image: AssetImage(widget.image)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 230),
              child: Text(
                widget.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 260),
              child: Text(
                widget.subtitle,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Divider(
              color: Colors.grey,
              thickness: 1,
              endIndent: 20,
              indent: 20,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 20),
                Container(
                  height: 150,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 234, 234, 234),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      Image.asset("assets/seats.png"),
                      Text(
                        widget.seats.toString(),
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  height: 150,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 234, 234, 234),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      Image.asset("assets/fuel.png"),
                      Text(
                        widget.fuel,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 20),
                Container(
                  height: 150,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 234, 234, 234),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      Image.asset("assets/carrr.png"),
                      Text(
                        widget.transmission,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  height: 150,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 234, 234, 234),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 40),
                      Image.asset("assets/location.png"),
                      Text(
                        widget.location,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 240),
              child: Text(
                "Description",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: Text(
                "The BMW X5 is a mid-size luxury SUV",
                style: TextStyle(
                  color: const Color.fromARGB(255, 105, 104, 104),
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                "produced by BMW.The X5 made its debut",
                style: TextStyle(
                  color: const Color.fromARGB(255, 105, 104, 104),
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                "in 1999 as the first SUV ever produced by",
                style: TextStyle(
                  color: const Color.fromARGB(255, 105, 104, 104),
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 300),
              child: Text(
                "BMW.",
                style: TextStyle(
                  color: const Color.fromARGB(255, 105, 104, 104),
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(right: 250),
              child: Text(
                "Features",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(width: 30),
                Image.asset("assets/bluetick.png"),
                SizedBox(width: 10),
                Text(
                  "360 Camera",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 105, 104, 104),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 30),
                Image.asset("assets/bluetick.png"),
                SizedBox(width: 10),
                Text(
                  "360 Camera",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 105, 104, 104),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 30),
                Image.asset("assets/bluetick.png"),
                SizedBox(width: 10),
                Text(
                  "Bluetooth",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 105, 104, 104),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 30),
                Image.asset("assets/bluetick.png"),
                SizedBox(width: 10),
                Text(
                  "GPS",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 105, 104, 104),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 30),
                Image.asset("assets/bluetick.png"),
                SizedBox(width: 10),
                Text(
                  "Heated Seats",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 105, 104, 104),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 30),
                Image.asset("assets/bluetick.png"),
                SizedBox(width: 10),
                Text(
                  "Reat view Mirror",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 105, 104, 104),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [BoxShadow(blurRadius: 12, color: Colors.black12)],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "\$300",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 200),
                      Text(
                        "per day",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                    ],
                  ),
                  Divider(color: Colors.grey, thickness: 1),
                  SizedBox(height: 10),
                  Text("Pickup Date", style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 10),
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
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 100),
                    child: Text(
                      "Return Date",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () => _selectDate(context, true),
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
                  SizedBox(height: 25),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: _bookCars,
                      label: Text("Book Now"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Not credit card required to reserve",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 96, 96, 96),
                    ),
                  ),
                ],
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
              child: Text("needs.", style: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 20),
                const Icon(Icons.facebook, color: Colors.grey),
                const SizedBox(width: 10),
                Image.asset("assets/insta.png", width: 20, color: Colors.grey),
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
                const Icon(Icons.copyright, color: Colors.grey, size: 20),
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
    );
  }
}
