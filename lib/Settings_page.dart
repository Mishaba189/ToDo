import 'package:flutter/material.dart';
import 'package:todo/Home_Page.dart';
import 'package:todo/Login_page.dart';
import 'Bottom_menu_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    List<Map<String, dynamic>> tasks = [

      {
        'title': 'Change Password',
        'leading': Icons.lock,
        
      },
      {
        'title': 'Notification',
        'leading': Icons.notifications_none,
        'pages' : HomePage()
      },
      {
        'title': 'Logout',
        'leading': Icons.logout,
        'pages' : LoginPage()
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
              color: Colors.blue,
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),
        ),
        automaticallyImplyLeading: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.0666,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Container(
                    height: height * 0.12,
                    margin: EdgeInsets.all(width * 0.0102),
                    decoration: BoxDecoration(
                      color: const Color(0x152196F3),
                      borderRadius:
                      BorderRadius.circular(width * 0.0307),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.account_circle,
                              color: Colors.blue,
                              size: width * 0.2,
                            ),
                            SizedBox(width: width * 0.0256),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Ellie', style: TextStyle(fontSize: 20)),
                                Text('ellie123@gmail.com', style: TextStyle(fontSize: 14)),
                              ],
                            ),
                          ],
                        ),
                        // SizedBox(width: width*0.06,),
                        IconButton(onPressed: (){},
                            icon: Icon(
                              Icons.edit,
                              color: Colors.blue,
                              size: width * 0.05,
                            ),)
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.0118),
              Text(
                'Customize',
                style: TextStyle(
                  fontSize: height * 0.02,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: height * 0.0118),

              ListView.builder(
                itemCount: tasks.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: height * 0.0189,
                    ),
                    child: Container(
                      height: height * 0.05,
                      decoration: BoxDecoration(
                        color: const Color(0x152196F3),
                        borderRadius:
                        BorderRadius.circular(width * 0.0205),
                      ),
                      child: ListTile(
                        leading: Icon(
                          task['leading'],
                          color: Colors.blue,
                          size: width * 0.05,
                        ),
                        title: Text(
                          task['title'],
                          style: TextStyle(
                            fontSize: height * 0.018,
                          ),
                        ),
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>task['pages']),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Bottomnavbar(selectedIndex: 3),
    );
  }
}
