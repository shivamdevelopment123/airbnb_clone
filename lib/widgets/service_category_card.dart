import 'package:flutter/material.dart';
import '../models/service_category_item.dart';

class ServiceCategoryCard extends StatelessWidget {
  final ServiceCategoryItem item;
  const ServiceCategoryCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Rounded image
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            item.imageUrl,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          item.title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        Text(
          item.subtitle,
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
      ],
    );
  }
}
