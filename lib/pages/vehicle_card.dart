import 'package:flutter/material.dart';

class VehicleCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String price;
  final List<String> details;
  final bool isAvailable;

  const VehicleCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.details,
    required this.isAvailable,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  imagePath,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              if (isAvailable)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Available Now',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    price,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),

                if (details.isNotEmpty) ...[
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children:
                        details.map((detail) {
                          // Map each detail to an icon and text pair dynamically
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _getIconForDetail(detail),
                              SizedBox(width: 4),
                              Text(
                                detail,
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to return appropriate icon based on detail
  Widget _getIconForDetail(String detail) {
    switch (detail) {
      case '4 Seats':
        return Icon(Icons.people_outline, size: 16, color: Colors.grey[600]);
      case 'Hybrid':
        return Icon(
          Icons.local_gas_station_outlined,
          size: 16,
          color: Colors.grey[600],
        );
      case 'Semi-Automatic':
        return Icon(
          Icons.directions_car_outlined,
          size: 16,
          color: Colors.grey[600],
        );
      case 'New York':
        return Icon(
          Icons.location_on_outlined,
          size: 16,
          color: Colors.grey[600],
        );
      default:
        return SizedBox.shrink(); // Return empty widget for unknown details
    }
  }
}


