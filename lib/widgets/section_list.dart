import 'package:flutter/material.dart';
import '../models/section.dart';
import 'listing_card.dart';

class SectionList extends StatelessWidget {
  final Section section;
  const SectionList({required this.section, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  section.title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
        const SizedBox(height: 8),
        // horizontal list
        SizedBox(
          height: 180,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: section.items.length,
            itemBuilder: (ctx, i) => SizedBox(
              width: 150,
              child: ListingCard(section.items[i]),
            ),
          ),
        ),
      ],
    );
  }
}
