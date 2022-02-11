
import 'package:flutter/material.dart';
import 'dart:math';

class MyFlipIcons extends StatefulWidget {
  const MyFlipIcons({ Key? key }) : super(key: key);

  @override
  _MyFlipIconsState createState() => _MyFlipIconsState();
}

class _MyFlipIconsState extends State<MyFlipIcons> with TickerProviderStateMixin {
  
  late double screenHeight;
  late double screenWidth;
  final List<Color> _colorList = [Color(0xFFadbf00), Color(0xFFc5d622), Color(0xFFd8e83f), Color(0xFFecfa61), Color(0xFFf5ff91), Colors.lightBlue];
  final List<IconData> _icons = [Icons.home, Icons.settings, Icons.shopping_cart, Icons.favorite_border_outlined, Icons.paid, Icons.face];
  final double itemHeight = 55.0;
  final appBarColor = Color(0xFF746d99);
  late AnimationController _controller;
  late double _fraction;
  int _pageIndex = 0;


  @override
  void didChangeDependencies() {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    super.didChangeDependencies();
  }


  @override
  void initState() {
    _fraction = 1 / _icons.length;
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  void _playAnimation() {
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appBarColor,
        leading: GestureDetector(
          onTap: () {
            _playAnimation();
          },
          child: Icon(Icons.menu, color: Color(0xFFe7ff00), size: 40.0)),
      ),
      
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: appBarColor,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: screenHeight * 0.1),
              child: Center(
                child: Icon(_icons[_pageIndex], color: _colorList[_pageIndex], size: 100),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _icons.length,
              itemBuilder: (context, index) {

                CurvedAnimation _curvedAnimation = CurvedAnimation(
                  parent: _controller,
                  curve: Interval(index * _fraction, _fraction + _fraction * index, curve: Curves.bounceOut)
                );

                return AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {

                    return Container(
                      child: Transform(
                        origin: Offset(0,0),
                        transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.002)
                        ..rotateX(-pi/2 + pi/2 * _curvedAnimation.value),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _pageIndex = index;
                              });
                              _playAnimation();
                            },
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
                      ),
                    );
                  }
                );
              }
            ),
          ]
        ),
      ),
    );
  }
}