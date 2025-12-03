import 'package:flutter/material.dart';
import 'Bottom_menu_bar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    List<Map<String, dynamic>> tasks = [
      {
        'title': 'Edit Your Name',
        'leading': Icons.edit,
      },
      {
        'title': 'Change Password',
        'leading': Icons.lock,
      },
      {
        'title': 'Notification',
        'leading': Icons.notifications_none,
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
              Container(
                height: height * 0.3554,
                child: Column(
                  children: [
                    Container(
                      height: height * 0.1778,
                      margin: EdgeInsets.all(width * 0.0102),
                      decoration: BoxDecoration(
                        color: const Color(0x152196F3),
                        borderRadius:
                        BorderRadius.circular(width * 0.0307),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.account_circle,
                              color: Colors.blue,
                              size: width * 0.2564,
                            ),
                            onPressed: () {},
                          ),
                          SizedBox(width: width * 0.0256),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Ellie', style: TextStyle(fontSize: 25)),
                              Text('ellie123@gmail.com', style: TextStyle(fontSize: 18)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.0118),
              Text(
                'Customize',
                style: TextStyle(
                  fontSize: height * 0.0272,
                  fontWeight: FontWeight.bold,
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
                      height: height * 0.0947,
                      decoration: BoxDecoration(
                        color: const Color(0x152196F3),
                        borderRadius:
                        BorderRadius.circular(width * 0.0205),
                      ),
                      child: ListTile(
                        leading: Icon(
                          task['leading'],
                          color: Colors.blue,
                          size: width * 0.0717,
                        ),
                        title: Text(
                          task['title'],
                          style: TextStyle(
                            fontSize: height * 0.0213,
                          ),
                        ),
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
