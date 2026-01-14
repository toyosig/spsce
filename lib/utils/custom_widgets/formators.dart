import 'package:circ/core/constant/global.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Formators {
  Color colorFromNameInsensitive(
    String name, {
    Color fallback = Colors.transparent,
  }) {
    final match = colorMap.entries.firstWhere(
      (entry) => entry.key.toLowerCase() == name.toLowerCase(),
      orElse: () => MapEntry('', fallback),
    );
    return match.value;
  }

  static String timeAgoSinceDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
    } else if (difference.inDays < 30) {
      return '${(difference.inDays / 7).floor()} week${(difference.inDays / 7).floor() == 1 ? '' : 's'} ago';
    } else if (difference.inDays < 365) {
      return '${(difference.inDays / 30).floor()} month${(difference.inDays / 30).floor() == 1 ? '' : 's'} ago';
    } else {
      return '${(difference.inDays / 365).floor()} year${(difference.inDays / 365).floor() == 1 ? '' : 's'} ago';
    }
  }

  static List<String> splitString(String input) {
    return input.split(', ');
  }

  static String formatCurrency(
    num amount, {
    String locale = 'en_NG',
    String symbol = '₦',
  }) {
    final hasDecimal = amount % 1 != 0;

    final formatter = NumberFormat.currency(
      locale: locale,
      symbol: symbol,
      decimalDigits: hasDecimal ? 2 : 0,
      customPattern: '¤ #,##0${hasDecimal ? '.00' : ''}',
    );

    return formatter.format(amount);
  }

  static String formatDateTime(String inputDate) {
    try {
      final dateTime = DateTime.parse(inputDate).toLocal();
      final day = dateTime.day.toString().padLeft(2, '0');
      final month = dateTime.month.toString().padLeft(2, '0');
      final year = dateTime.year.toString().substring(2); // last two digits
      final hour = dateTime.hour.toString().padLeft(2, '0');
      final minute = dateTime.minute.toString().padLeft(2, '0');

      return '$day/$month/$year $hour:$minute';
    } catch (e) {
      return '-'; // fallback for invalid input
    }
  }

  static String dateFormater(DateTime date, {String? format}) {
    final String formattedDate = DateFormat(format).format(date);
    return formattedDate;
  }

  static String dateFormaterFromString(String date) {
    final String formattedDate = DateFormat(
      'yyyy-MM-dd',
    ).format(DateTime.parse(date));
    return formattedDate;
  }

  static String formatLikeCount(int number) {
    const thresholds = <Map<String, dynamic>>[
      {'value': 1000000000, 'suffix': 'B'},
      {'value': 1000000, 'suffix': 'M'},
      {'value': 1000, 'suffix': 'k'},
    ];

    for (final Map<String, dynamic> threshold in thresholds) {
      final int value = threshold['value'] as int;
      final String suffix = threshold['suffix'] as String;
      if (number >= value) {
        final double divided = number / value;
        // Truncate to one decimal place to avoid rounding.
        // e.g. 999,999 becomes 999.9k instead of rounding to 1000k.
        final double truncated = (divided * 10).floor() / 10;
        String formatted = truncated.toString();

        if (formatted.endsWith('.0')) {
          formatted = formatted.substring(0, formatted.length - 2);
        }
        return '$formatted$suffix';
      }
    }
    return number.toString();
  }
}
