import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class JobPage extends StatelessWidget {
  final String title;
  final String company;
  final String location;
  final String salary;
  final String description;
  final String logo;
  final String backgroundImage;

  JobPage({
    required this.title,
    required this.company,
    required this.location,
    required this.salary,
    required this.description,
    required this.logo,
    required this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      backgroundImage,
                      width: double.infinity,
                      height: 280,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 40,
                      left: 10,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back,
                            color: Colors.white, size: 30),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.width / 2 - 50,
                      top: 220,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(logo),
                        radius: 50,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 70),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.blueAccent),
                          SizedBox(width: 5),
                          Text(location,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey)),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Salary: $salary',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      DefaultTabController(
                        length: 3,
                        child: Column(
                          children: [
                            TabBar(
                              labelColor: Colors.black,
                              indicatorColor: Colors.blueAccent,
                              tabs: [
                                Tab(text: "Description"),
                                Tab(text: "Company"),
                                Tab(text: "Requirements"),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(16.0),
                              height: 250,
                              child: TabBarView(
                                children: [
                                  SingleChildScrollView(
                                    child: Text(
                                      description,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  ),
                                  Center(child: Text(company)),
                                  Center(
                                      child: Text(
                                          'Skills & Qualifications required')),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 80),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Apply Now',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon:
                        Icon(FontAwesomeIcons.commentDots, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
