import 'package:flutter/material.dart';

import 'colors.dart';

TextStyle customParagraph =
TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
TextStyle customContent = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
TextStyle customContentWhite = TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white);

TextStyle customTitle =
TextStyle(fontSize: 20, fontWeight: FontWeight.w500, height: 1.3);

ButtonStyle btnStyleDefault = ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(AppColors.primary));