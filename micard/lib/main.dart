import 'package:flutter/material.dart';

void main() {
  runApp(const Micard());
}

class Micard extends StatelessWidget {
  const Micard({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 142, 204, 233),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100.0,
                backgroundImage: AssetImage('images/avatar.jpg'),
              ),
              Text(
                'Lê Nhật Linh',
                style: TextStyle(
                  fontFamily: 'MTD Casanova Script EF Pro',
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '21JIT',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  color: Color.fromARGB(255, 243, 79, 79),
                  fontSize: 20.0,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  color: Color.fromARGB(255, 98, 226, 216),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '098 765 4321',
                    style: TextStyle(
                      color: Color.fromARGB(255, 1, 81, 67),
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'llinhln.21it@vku.udn.vn',
                    style: TextStyle(
                      color: Color.fromARGB(255, 1, 81, 67),
                      fontFamily: 'Source Sans Pro',
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
