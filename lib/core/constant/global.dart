import 'package:circ/presentation/feature/detail_screen/widgets/shipping_to.dart';
import 'package:circ/presentation/feature/sell_screen/widgets/size_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

final Map<String, Color> colorMap = {
  "Black": Colors.black,
  "White": Colors.white,
  "Red": Colors.red,
  "Blue": Colors.blue,
  "Green": Colors.green,
  "Yellow": Colors.yellow,
  "Purple": Colors.purple,
  "Pink": Colors.pink.shade200,
  "Orange": Colors.orange,
  "Cream": Color(0xFFFFFDD0), // Light cream color
  "Tan": Color(0xFFD2B48C), // Tan color
  "Brown": Colors.brown,
  "Gold": Color(0xFFFFD700), // Standard gold
  "Silver": Color(0xFFC0C0C0), // Standard silver
  "Gray": Colors.grey,
  "Navy": Color(0xFF000080), // Navy blue
  "Fuschia": Color(0xFFFF00FF), // Bright fuchsia
  "Burgundy": Color(0xFF800020), // Deep burgundy
};

final List<SizeOption> allSizeOptions = [
  // Standard
  SizeOption(label: 'XS', category: 'Standard'),
  SizeOption(label: 'S', category: 'Standard'),
  SizeOption(label: 'M', category: 'Standard'),
  SizeOption(label: 'L', category: 'Standard'),
  SizeOption(label: 'XL', category: 'Standard'),
  SizeOption(label: '2XL', category: 'Standard'),
  SizeOption(label: '3XL', category: 'Standard'),
  SizeOption(label: '4XL', category: 'Standard'),
  SizeOption(label: '5XL', category: 'Standard'),

  // UK
  SizeOption(label: '4', category: 'UK'),
  SizeOption(label: '6', category: 'UK'),
  SizeOption(label: '8', category: 'UK'),
  SizeOption(label: '10', category: 'UK'),
  SizeOption(label: '12', category: 'UK'),
  SizeOption(label: '14', category: 'UK'),
  SizeOption(label: '16', category: 'UK'),
  SizeOption(label: '18', category: 'UK'),
  SizeOption(label: '20', category: 'UK'),
  SizeOption(label: '22', category: 'UK'),
  SizeOption(label: '24', category: 'UK'),

  // US
  SizeOption(label: '2', category: 'US'),
  SizeOption(label: '4', category: 'US'),
  SizeOption(label: '6', category: 'US'),
  SizeOption(label: '8', category: 'US'),
  SizeOption(label: '10', category: 'US'),
  SizeOption(label: '12', category: 'US'),
  SizeOption(label: '14', category: 'US'),
  SizeOption(label: '18', category: 'US'),
  SizeOption(label: '20', category: 'US'),
  SizeOption(label: '22', category: 'US'),
  SizeOption(label: '24', category: 'US'),
];

final List<ShippingToOption> shippingToList = [
  ShippingToOption(
    title: "State-wide",
    subtitle: "Ship anywhere within selected state",
    icon: Icons.location_on_outlined,
  ),
  ShippingToOption(
    title: "Nation-wide",
    subtitle: "Ship anywhere in Nigeria",
    icon: Icons.flag_outlined,
  ),
  ShippingToOption(
    title: "World-wide",
    subtitle: "Ship internationally",
    icon: Icons.public,
  ),
];

final List<ConditionOptions> conditions = [
  ConditionOptions(
    title: "BRANDNEW",
    subtitle: "New with tags, unopened packing",
    enumValue: "BRANDNEW",
  ),
  ConditionOptions(
    title: "LIKENEW",
    subtitle: "No sign of wear, as good as new",
    enumValue: "LIKENEW",
  ),
  ConditionOptions(
    title: "Great",
    subtitle: "Minimal sign of wear, excellent condition",
    enumValue: "GREAT",
  ),
  ConditionOptions(
    title: "Good",
    subtitle: "Some sign of wear, fully functional",
    enumValue: "GOOD",
  ),
  ConditionOptions(
    title: "Fair",
    subtitle: "Visible wear but still usable",
    enumValue: "FAIR",
  ),
];

class ConditionOptions {
  String? title;
  String? subtitle;
  String? enumValue;

  ConditionOptions({
    required this.title,
    required this.subtitle,
    required this.enumValue,
  });
}
