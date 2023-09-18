import 'package:agile/shared/styles/colors.dart';
import 'package:flutter/material.dart';


class TextSecLogin extends StatelessWidget {
  const TextSecLogin({super.key, required this.header, required this.para});
  final String header ;
  final String para ;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top:MediaQuery.of(context).size.height *0.005 ),
          child:  Text(
            header,
            style: const TextStyle(
                color: Styles.kColor,
                fontSize: 34
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0,bottom: 50.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width *0.9,
                child:  Text(
                  para,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Color(0xff7C808A),
                      fontSize: 16
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}