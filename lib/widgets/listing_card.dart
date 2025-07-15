import 'package:flutter/material.dart';
import '../models/listing_item.dart';

class ListingCard extends StatelessWidget {
  final ListingItem item;
  final bool isGuestFavourite;

  const ListingCard(
      this.item, {
        this.isGuestFavourite = false,
        super.key,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [

              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  item.imageUrl,
                  width: 130,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ),


              if (isGuestFavourite)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        )
                      ],
                    ),
                    child: const Text(
                      'Guest favourite',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),


              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  child: Icon(
                    Icons.favorite_border,
                    size: 24,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 3),

          SizedBox(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Text(
                  item.subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

