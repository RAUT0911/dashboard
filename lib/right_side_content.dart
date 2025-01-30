import 'package:flutter/material.dart';

class RightSideContent extends StatelessWidget {
  final int selectedIndex;
  TextEditingController _controller = TextEditingController();

  // Map to store titles for each index
  final Map<int, String> titles = {
    0: "Home",
    1: "Employee",
    2: "Attendance",
    3: "Summary",
    4: "Information",
  };

  RightSideContent({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey[300]!, Colors.white38], // White to light grey
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          children: [
            // Section A: Takes 60% of screen width
            Expanded(
              flex: 3,
              child: Container(
                height: height, // Use full height to allow scroll
                child: Column(
                  children: [
                    // Title section with search bar
                    Container(
                      width: double.infinity,
                      height: 0.1 * height,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Text(
                              titles[selectedIndex] ?? "Dashboard", // Default title
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Spacer(),
                          // Search input field
                          Padding(
                            padding: const EdgeInsets.only(top: 15,right: 40),
                            child: Container(
                              width: 0.2 * width,
                              height: 50,// Adjust width of the search bar
                              child: TextField(
                                controller: _controller,
                                decoration: InputDecoration(
                                  labelText: 'Search',
                                  labelStyle: TextStyle(color: Colors.white), // White label text
                                  suffixIcon: Icon(Icons.search, color: Colors.white), // White search icon
                                  filled: true, // Enables the background color
                                  fillColor: Colors.deepPurple[900], // Set background color to deep purple
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(color: Colors.white), // Border color on focus
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Main content area
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            // First container (blue one)
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                              ),
                              width: 0.55 * width, // Relative to screen width
                              height: height * 0.27,
                            ),
                            SizedBox(height: 10),
                            // Row with two containers
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                // First container inside Row
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 2.0,
                                    ),
                                  ),
                                  width: 0.26 * width, // Relative to screen width
                                  height: height * 0.32,
                                ),
                                // Second container inside Row
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 2.0,
                                    ),
                                  ),
                                  width: 0.26 * width, // Relative to screen width
                                  height: height * 0.32,
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            // Second blue container
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                              ),
                              width: 0.55 * width, // Relative to screen width
                              height: height * 0.28,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Section B: Takes 30% of screen width
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top:  8.0),
                child: Container(
                  child: Column(

                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(icon : Icon(Icons.calendar_today_outlined),onPressed: (){},),
                              IconButton(onPressed: (){}, icon: Icon(Icons.notifications_active,),),
                              IconButton(onPressed: (){}, icon: Icon(Icons.power_settings_new),),
                              SizedBox(width: 50,),

                              IconButton(onPressed: (){}, icon: Icon(Icons.person),),
                              SizedBox(width: 20,)
                            ],
                          
                          ),
                      ),
                      SizedBox(height: 10,),
                     Expanded(
                       child: Container(
                            width: 0.3*width,
                            color: Colors.blue,

                          ),
                     ),
                    ],
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
