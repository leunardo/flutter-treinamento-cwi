import 'package:exercicios/exercicio_8/ui/components/pic_of_day.component.dart';
import 'package:exercicios/exercicio_8/ui/components/search.component.dart';
import 'package:flutter/material.dart';

class Exercicio9Page extends StatefulWidget {
  @override
  _Exercicio9PageState createState() => _Exercicio9PageState();
}

class _Exercicio9PageState extends State<Exercicio9Page> {
  final _pages = [SearchComponent(), PicOfDayComponent()];

  Widget _currentPage;
  int _currentIndex = 0;

  _onBottomNavigationTap(int index) {
    setState(() {
      _currentPage = _pages.elementAt(index);
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      _currentPage = _pages.elementAt(_currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Paw City'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onBottomNavigationTap,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text('Search for Breed')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text('Pic of the day')),
        ],
      ),
      body: _currentPage,
    );
  }
}
