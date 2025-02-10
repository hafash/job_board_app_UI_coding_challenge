import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileLayout;
  final Widget desktopLayout;
  final Widget compactLayout;
  final Widget expandedLayout;

  ResponsiveLayout({
    required this.mobileLayout,
    required this.desktopLayout,
    required this.compactLayout,
    required this.expandedLayout,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        double height = constraints.maxHeight;

        if (width < 600) {
          // Mobile layout
          return mobileLayout;
        } else if (height < 600) {
          // Compact layout for smaller screen height (e.g., small tablets or compact screens)
          return compactLayout;
        } else if (width >= 600 && height >= 600) {
          // Desktop layout for larger screens
          return desktopLayout;
        } else {
          // Expanded layout (if necessary for ultra-large screens)
          return expandedLayout;
        }
      },
    );
  }
}

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

// Linking the ResponsiveLayout with JobCard
class JobScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: JobCard(
        company: 'Example Company',
        companyLogo: 'assets/logo.png',
        location: 'New York, NY',
        title: 'Software Engineer',
        type: 'Full-time',
        salary: '\$120,000',
        timestamp: '2 hours ago',
        onTap: () {
          // Handle apply button press
        },
      ),
      desktopLayout: JobCard(
        company: 'Example Company',
        companyLogo: 'assets/logo.png',
        location: 'New York, NY',
        title: 'Software Engineer',
        type: 'Full-time',
        salary: '\$120,000',
        timestamp: '2 hours ago',
        onTap: () {
          // Handle apply button press
        },
      ),
      compactLayout: JobCard(
        company: 'Example Company',
        companyLogo: 'assets/logo.png',
        location: 'New York, NY',
        title: 'Software Engineer',
        type: 'Full-time',
        salary: '\$120,000',
        timestamp: '2 hours ago',
        onTap: () {
          // Handle apply button press
        },
      ),
      expandedLayout: JobCard(
        company: 'Example Company',
        companyLogo: 'assets/logo.png',
        location: 'New York, NY',
        title: 'Software Engineer',
        type: 'Full-time',
        salary: '\$120,000',
        timestamp: '2 hours ago',
        onTap: () {
          // Handle apply button press
        },
      ),
    );
  }
}
