import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WalletCardWidget extends StatelessWidget {
  const WalletCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: const Icon(
                FontAwesomeIcons.xmark,
                size: 20,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Row(children: [
            Icon(FontAwesomeIcons.plus,size: 20,),
            SizedBox(width: 5,),
            Text('Bank Card',style: TextStyle(fontSize: 18),)
          ],)
        ],
      ),
    );
  }
}
