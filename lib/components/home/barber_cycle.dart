
import 'package:customer/data/models/hairdresser.dart';
import 'package:customer/styles/colors.dart';
import 'package:customer/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BarberCycle extends StatelessWidget{
  Hairdresser hairdresser;
  BarberCycle(Hairdresser hairdresser, {
    Key? key,
  }): this.hairdresser = hairdresser, super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          CircleAvatar(
            radius: 22,
            child: ClipOval(
              child: Image.asset(
                "lib/assets/images/barber.jpg",
                fit: BoxFit.cover,
                width: 40,
                height: 40,
              ),
            ),
          ),
          Text(
            this.hairdresser.firstname.toString(),
            style: customName,
          ),
          Text(
            this.hairdresser.lastname.toString(),
            style: customName,
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: AppColors.yellowStar,
                size: 15,
              ),SizedBox(
                width: 2,
              ),
              Text(
                "4.2",
                style: customRank,
              ),

            ],
          )
        ],
      ),
    );
  }
}