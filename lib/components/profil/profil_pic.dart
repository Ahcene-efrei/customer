import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilPic extends StatelessWidget{
  const ProfilPic({
    Key? key,
  }): super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          CircleAvatar(
            child:
            FaIcon(FontAwesomeIcons.user),
          ),
          Positioned(
            left: 55,
            bottom: 0,
            child: SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(
                        color: Colors.white
                    )
                ),
                color: Colors.white,
                child: FaIcon(FontAwesomeIcons.camera),
              ),
            ),
          )
        ],
      ),
    );
  }

}
