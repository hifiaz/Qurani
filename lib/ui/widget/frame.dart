import 'package:flutter/material.dart';

class Frame extends StatelessWidget {
  const Frame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
      child: SizedBox(
        height: size.height, // di ubah
        width: size.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/frame_topleft.png',
                      height: 60, width: 52),
                  Image.asset('assets/images/frame_topright.png',
                      height: 60, width: 52),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 3),
                    height: 2,
                    width: size.width - 104,
                    color: Color(0xFF2FD9E3),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 2),
                    height: 1,
                    width: size.width - 98,
                    decoration: BoxDecoration(color: Color(0xFF2FD9E3), boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        offset: Offset(0, 4),
                        color: Color(0xFF2FD9E3).withOpacity(0.5),
                      )
                    ]),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/frame_bottomleft.png',
                      height: 60, width: 52),
                  Image.asset('assets/images/frame_bottomright.png',
                      height: 60, width: 52),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 2),
                    height: 1,
                    width: size.width - 98,
                    decoration: BoxDecoration(color: Color(0xFF2FD9E3), boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        offset: Offset(0, -4),
                        color: Color(0xFF2FD9E3),
                      )
                    ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 3),
                    height: 2,
                    width: size.width - 104,
                    color: Color(0xFF2FD9E3),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(4, 60, 1, 60),
                    width: 2,
                    color: Color(0xFF2FD9E3),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 50),
                    width: 1,
                    color: Color(0xFF2FD9E3),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 50),
                    width: 1,
                    color: Color(0xFF2FD9E3),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(1, 60, 4, 60),
                    width: 2,
                    color: Color(0xFF2FD9E3),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
