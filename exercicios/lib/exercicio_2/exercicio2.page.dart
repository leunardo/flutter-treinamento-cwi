import 'package:flutter/material.dart';

class Exercicio2Page extends StatefulWidget {
  @override
  _Exercicio2PageState createState() => _Exercicio2PageState();
}

class _Exercicio2PageState extends State<Exercicio2Page> {
  Widget _generateTile(
      Color color, String title, String subtitle, IconData icon) {
    return ListTile(
      title: Text(title),
      leading: Container(
        child: CircleAvatar(
          backgroundColor: color,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Postcard')),
      body: Container(
        height: double.infinity,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    _generateTile(Colors.pink, 'Recipient', 'Amelie N Mason',
                        Icons.person),
                    SizedBox(
                      height: 10,
                    ),
                    _generateTile(
                        Colors.orange,
                        'Address',
                        '47 Greyfriars Road, CAPHEATON \nUnited Kingdom \nNE195PJ',
                        Icons.store),
                    SizedBox(
                      height: 10,
                    ),
                    _generateTile(
                        Colors.blue,
                        'Message',
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        Icons.edit),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          child: Text('SAVE DRAFT'),
                          onPressed: () {},
                          color: Colors.grey[600],
                          textColor: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          child: Text('REVIEW DESIGN'),
                          onPressed: () {},
                          color: Colors.pink,
                          textColor: Colors.white,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
