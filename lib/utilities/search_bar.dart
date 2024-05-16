import 'package:flutter/material.dart';

class SearchBar1 extends StatefulWidget {
  @override
  _SearchBar1State createState() => _SearchBar1State();
}

class _SearchBar1State extends State<SearchBar1> {
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(left:10,right: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10),
            child: Icon(Icons.search, color: Colors.blue, size: 30),
          ),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Search Projects',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
                border: InputBorder.none,
                
              ),
              onChanged: (value) {
                // Perform search based on the input value
                print('Search query: $value');
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.clear, color: Colors.blue, size: 30),
            onPressed: () {
              setState(() {
                _controller.clear();
              });
            },
          ),
        ],
      ),
    );
  }
}
