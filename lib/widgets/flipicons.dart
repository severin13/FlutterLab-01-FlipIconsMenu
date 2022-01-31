
import 'package:flutter/material.dart';

class MyFlipIcons extends StatefulWidget {
  const MyFlipIcons({ Key? key }) : super(key: key);

  @override
  _MyFlipIconsState createState() => _MyFlipIconsState();
}

class _MyFlipIconsState extends State<MyFlipIcons> {
  
  late double screenHeight;
  late double screenWidth;
  //final List<Color> _colorList = [Colors.amber[500]!,Colors.amber[400]!,Colors.amber[300]!,Colors.amber[200]!,Colors.amber[100]!];
final List<Color> _colorList = [Color(0xFFadbf00), Color(0xFFc5d622), Color(0xFFd8e83f), Color(0xFFecfa61), Color(0xFFf5ff91)];
  final List<IconData> _icons = [Icons.home, Icons.settings, Icons.shopping_cart, Icons.favorite_border_outlined, Icons.paid];
  double itemHeight = 55.0;


  @override
  void didChangeDependencies() {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    super.didChangeDependencies();
  }


  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF746d99),
        leading: GestureDetector(
          onTap: () {
          

          },
          child: Icon(Icons.menu, color: Color(0xFFe7ff00), size: 40.0)),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Color(0xFF746d99)
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _icons.length,
              itemBuilder: (context, index) {

                return Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 1, 0, 0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        height: itemHeight,
                        width: itemHeight,
                        decoration: BoxDecoration(
                          color: _colorList[index],
                          borderRadius: BorderRadius.all(Radius.circular(itemHeight)),
                        ),
                        child: Icon(_icons[index], color: Colors.black, size: itemHeight * 0.5),
                      ),
                    ),
                  ),
                );
              }
            ),
          ]
        ),
      ),
    );
  }
}