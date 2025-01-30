import 'package:dashboard/right_side_content.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  bool _isExpanded = false;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Row(
        children: [
          // Left Sidebar
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            color: Colors.white54,
            height: double.infinity,
            width: width * 0.2,
            child: Column(
              children: [
                // Logo
                Container(
                  width: 0.1 * width,
                  height: 0.08 * height,
                  child: Image.asset("assets/logo.png"),
                ),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                // Profile Section
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.orangeAccent,
                          width: 3,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.transparent,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage("assets/profile.png"),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Pooja Mishra",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(
                            BorderSide(color: Colors.blueAccent, width: 2)),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            )),
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                      ),
                      child: Text(
                        "Admin",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 5)
                  ],
                ),
                Divider(
                  color: Colors.black,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                // Navbar Buttons
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 50),// Ensure list is scrollable
                    child: Column(
                      
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.home_filled,
                            color: selectedIndex == 0 ? Colors.black : null,
                          ),
                          title: Text(
                            "Home",
                            style: TextStyle(
                              fontWeight: selectedIndex == 0
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          tileColor: selectedIndex == 0 ? Colors.grey[400] : null,
                          onTap: () => onItemTapped(0),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.people_outline,
                            color: selectedIndex == 1 ? Colors.black : null,
                          ),
                          title: Text(
                            "Employee",
                            style: TextStyle(
                              fontWeight: selectedIndex == 1
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          tileColor: selectedIndex == 1 ? Colors.grey[400] : null,
                          onTap: () => onItemTapped(1),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.checklist,
                            color: selectedIndex == 2 ? Colors.black : null,
                          ),
                          title: Text(
                            "Attendance",
                            style: TextStyle(
                              fontWeight: selectedIndex == 2
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          tileColor: selectedIndex == 2 ? Colors.grey[400] : null,
                          onTap: () => onItemTapped(2),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.calendar_month,
                            color: selectedIndex == 3 ? Colors.black : null,
                          ),
                          title: Text(
                            "Summary",
                            style: TextStyle(
                              fontWeight: selectedIndex == 3
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          tileColor: selectedIndex == 3 ? Colors.grey[400] : null,
                          onTap: () => onItemTapped(3),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.info_outline,
                            color: selectedIndex == 4 ? Colors.black : null,
                          ),
                          title: Text(
                            "Information",
                            style: TextStyle(
                              fontWeight: selectedIndex == 4
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          tileColor: selectedIndex == 4 ? Colors.grey[400] : null,
                          onTap: () => onItemTapped(4),
                        ),
                        // Workspace + Icon
                        ListTile(
                          title: Text("WORKSPACES"),
                          trailing: Icon(Icons.add),
                          tileColor: Colors.blue[100],
                          onTap: () {
                            setState(() {
                              _isExpanded = !_isExpanded;
                            });
                          },
                        ),
                        // Expanded items (Adstacks, Finance)
                        if (_isExpanded) ...[
                          ListTile(
                            title: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text("Adstacks"),
                            ),
                            trailing: Icon(Icons.arrow_drop_down),
                          ),
                          ListTile(
                            title: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text("Finance"),
                            ),
                            trailing: Icon(Icons.arrow_drop_down),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    ListTile(
                      title: Text("Setting"),
                      leading: Icon(Icons.settings),
                    ),
                    ListTile(
                      title: Text("Logout"),
                      leading: Icon(Icons.exit_to_app),
                    )
                  ],
                )

              ],
            ),
          ),

          // Right Column (Content)
          Expanded(
            child: RightSideContent(selectedIndex: selectedIndex),
          ),
        ],
      ),
    );
  }
}
