import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final String company;
  final String companyLogo;
  final String location;
  final String title;
  final String type;
  final String salary;
  final String? timestamp;
  final VoidCallback onTap;

  const JobCard({
    required this.company,
    required this.companyLogo,
    required this.location,
    required this.title,
    required this.type,
    required this.salary,
    this.timestamp,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with Logo and Company Info
            Row(
              children: [
                Image.asset(companyLogo, width: 40, height: 40),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        company,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        location,
                        style: TextStyle(color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Icon(Icons.bookmark_border, color: Colors.grey),
              ],
            ),
            SizedBox(height: 12),

            // Job Title
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),

            // Job Type
            Text(type, style: TextStyle(color: Colors.black54)),

            SizedBox(height: 16),

            // Apply Now Button and Salary
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    "Apply Now",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Text(
                  salary,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),

            if (timestamp != null) ...[
              SizedBox(height: 5),
              Text(
                timestamp!,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
