import 'package:flutter/material.dart';

class StatItem {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final double progress;
  final String subtitle;

  const StatItem({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.progress,
    required this.subtitle,
  });
}
