import 'package:flutter/material.dart';
import 'package:flutterbaseapp/core/globals/colors/smartzone_colors.dart';

extension StrExt on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String capitalizeWithQS() {
    return "${this[0]}${this[1].toUpperCase()}${substring(2).toLowerCase()}";
  }
}

class Utils {
  static const lorem =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas quis justo ut mi tempor fringilla in eget neque. Nulla facilisi. Curabitur pellentesque gravida massa sit amet pulvinar. Donec ornare purus ut aliquet efficitur. Duis elit elit, molestie eget libero vel, iaculis lacinia velit. Sed risus justo, fermentum vitae semper eu, congue et lectus. ";

  static int calculateAge(String birthdate) {
    final _formatted = "${birthdate.substring(6)}-${birthdate.substring(3, 5)}-${birthdate.substring(0, 2)}";

    final _parsedBirthDate = "$_formatted 00:00:00.000000";

    DateTime currentDate = DateTime.now();

    final birthDate = DateTime.parse(_parsedBirthDate);

    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  static Future<DateTime?> datePicker(BuildContext context, DateTime fixDate) async {
    return showDatePicker(
      context: context,
      locale: const Locale("es", "ES"),
      initialDate: fixDate,
      firstDate: DateTime.utc(1930, 1, 1),
      lastDate: fixDate,
      initialDatePickerMode: DatePickerMode.year,
      initialEntryMode: DatePickerEntryMode.input,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme(
              primary: SzColors.pasteles.red,
              onPrimary: Colors.white,
              surface: SzColors.pasteles.red,
              onSurface: SzColors.greys.black,
              secondary: SzColors.pasteles.blue,
              onSecondary: SzColors.pasteles.orange,
              error: SzColors.pasteles.grey,
              onError: SzColors.pasteles.grey,
              background: SzColors.pasteles.orange,
              onBackground: SzColors.pasteles.orange,
              brightness: Brightness.dark,
            ),
          ),
          child: child!,
        );
      },
    );
  }
}
