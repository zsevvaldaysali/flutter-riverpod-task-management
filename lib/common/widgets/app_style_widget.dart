import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appStyleWidget(
  double size,
  Color color,
  FontWeight fontw,
) {
  return GoogleFonts.poppins(fontSize: size.sp, color: color, fontWeight: fontw);
}
