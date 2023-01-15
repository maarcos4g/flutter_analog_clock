import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/clock/analogic_circle.dart';
import 'package:flutter_analog_clock/clock/hour_pointer.dart';
import 'package:flutter_analog_clock/clock/minute_pointer.dart';
import 'package:flutter_analog_clock/clock/second_pointer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class ClockView extends StatelessWidget {
  const ClockView({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();

    var weekday = DateFormat.EEEE('pt_BR').format(DateTime.now());
    var weekdayFormatted = weekday[0].toUpperCase() + weekday.substring(1);

    return StreamBuilder(
      stream: Stream.periodic(
        const Duration(seconds: 1),
      ),
      builder: (context, snapshot) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  AnalogicCircle(),
                  HourPointer(),
                  MinutePointer(),
                  SecondPointer(),
                  Container(
                    height: 16,
                    width: 16,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    DateFormat('HH:mm:ss').format(DateTime.now()),
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
              Text(
                '$weekdayFormatted, ${DateFormat.yMMMMd('pt_BR').format(DateTime.now())}',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
