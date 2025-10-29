import 'package:carcompany/pages/Car_Detailspage.dart';
import 'package:flutter/material.dart';

class Car {
  final String imagePath;
  final String title;
  final String subtitle;
  final String fuel;
  final String transmission;
  final String location;
  final int seats;
  final bool availableNow;
  final double price;

  Car({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.fuel,
    required this.transmission,
    required this.location,
    required this.seats,
    this.availableNow = false,
    required this.price,
  });
}

class Availables extends StatelessWidget {
  const Availables({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample car data - replace with your actual data (e.g., from API)
    final List<Car> cars = [
      Car(
        imagePath: "assets/bmwx5.png", // Replace with your asset path
        title: 'BMW X5',
        subtitle: 'SUV • 2006',
        fuel: 'Hybrid',
        transmission: 'Semi-Automatic',
        location: 'New York',
        seats: 4,
        availableNow: true,
        price: 300.0,
      ),
      Car(
        imagePath: 'assets/toyotacorolla.png', // Replace with your asset path
        title: 'Toyota Corolla',
        subtitle: 'Sedan • 2021',
        fuel: 'Diesel',
        transmission: 'Automatic',
        location: 'Los Angeles',
        seats: 4,
        availableNow: true,
        price: 130.0,
      ),
      Car(
        imagePath: "assets/bmwx5.png", // Replace with your asset path
        title: 'BMW X5',
        subtitle: 'SUV • 2006',
        fuel: 'Hybrid',
        transmission: 'Semi-Automatic',
        location: 'New York',
        seats: 4,
        availableNow: true,
        price: 300.0,
      ),
      Car(
        imagePath: 'assets/toyotacorolla.png', // Replace with your asset path
        title: 'Toyota Corolla',
        subtitle: 'Sedan • 2021',
        fuel: 'Diesel',
        transmission: 'Automatic',
        location: 'Los Angeles',
        seats: 4,
        availableNow: true,
        price: 130.0,
      ),
      Car(
        imagePath: "assets/jeep.png", // Replace with your asset path
        title: 'Jeep Wrangler',
        subtitle: 'SUV • 2023',
        fuel: 'Hybrid',
        transmission: 'Automatic',
        location: 'Los Angeles',
        seats: 4,
        availableNow: true,
        price: 200.0,
      ),
      Car(
        imagePath: "assets/fordneo.png", // Replace with your asset path
        title: 'Ford Neo',
        subtitle: 'Sedan • 2022',
        fuel: 'Diesel',
        transmission: 'Semi-Automatic',
        location: 'Houston',
        seats: 2,
        availableNow: true,
        price: 209.0,
      ),
      Car(
        imagePath: "assets/fordneo.png", // Replace with your asset path
        title: 'BMW M4',
        subtitle: 'Sedan • 2021',
        fuel: 'Hybrid',
        transmission: 'Automatic',
        location: 'New York',
        seats: 2,
        availableNow: true,
        price: 220.0,
      ),
      Car(
        imagePath: "assets/jeep.png", // Replace with your asset path
        title: 'Volvo C40 EV',
        subtitle: 'SUV • 2021',
        fuel: 'Electric',
        transmission: 'Automatic',
        location: 'New York',
        seats: 5,
        availableNow: true,
        price: 300.0,
      ),
      // Add more cars up to 8 as needed
    ];

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                "Available Cars",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Browse our selection of premium vehicles available",
              style: TextStyle(color: const Color.fromARGB(255, 152, 152, 152)),
            ),
            Text(
              "for your next adventure",
              style: TextStyle(color: const Color.fromARGB(255, 152, 152, 152)),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search by make, model, or features',
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  suffixIcon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(right: 250),
              child: Text(
                'Showing 8 Cars',
                style: TextStyle(
                  fontSize: 14,
                  color: const Color.fromARGB(255, 87, 87, 87),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // SizedBox(height: 50),
            ...cars.map(
              (car) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => CarDetailsPage(
                                image: car.imagePath,
                                title: car.title,
                                subtitle: car.subtitle,
                                fuel: car.fuel,
                                transmission: car.transmission,
                                location: car.location,
                                seats: car.seats,
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
                                  car.imagePath,
                                  height: 150,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              // Available now badge
                              if (car.availableNow)
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
                                    child: Text(
                                      "Available Now",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              // price overlay
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
                                    '\$${car.price.toStringAsFixed(0)}/day',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // details section
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  car.title,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  car.subtitle,
                                  style: TextStyle(
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
                                    SizedBox(width: 4.0),
                                    Text('${car.seats} seats'),
                                    SizedBox(width: 16.0),
                                    Icon(
                                      Icons.electrical_services,
                                      size: 20.0,
                                      color: Colors.grey[600],
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(car.fuel),
                                  ],
                                ),
                                const SizedBox(height: 4.0),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.speed,
                                      size: 20.0,
                                      color: Colors.grey[600],
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(car.transmission),
                                    const Spacer(),
                                    Icon(
                                      Icons.location_on,
                                      size: 20.0,
                                      color: Colors.grey[600],
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(car.location),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
