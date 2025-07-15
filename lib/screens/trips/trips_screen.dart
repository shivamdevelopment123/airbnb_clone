import 'package:flutter/material.dart';

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double cardHeight = 100;
    const double cardSpacing = 16;
    const double dotSize = 12;
    final double timelineHeight =
        (cardHeight * 3) + (cardSpacing * 2);

    final imageUrls = [
      'https://www.heart.org/-/media/AHA/H4GM/Article-Images/travel.jpg?sc_lang=en&hash=3A171F968DDE8FB583188218AA7DCE69',
      'https://images.unsplash.com/photo-1497493292307-31c376b6e479?auto=format&fit=crop&w=100&h=100&q=80',
      'https://images.unsplash.com/photo-1543353071-873f17a7a088?auto=format&fit=crop&w=100&h=100&q=80',
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Trips',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 24),

          Center(
            child: SizedBox(
              height: timelineHeight,
              child: Stack(
                children: [
                  Positioned(
                    left: 24,
                    top: dotSize / 2,
                    bottom: dotSize / 2,
                    child: Container(
                      width: 2,
                      color: Colors.grey.shade300,
                    ),
                  ),

                  for (var i = 0; i < 3; i++) ...[
                    Positioned(
                      left: 24 - dotSize / 2,
                      top: i * (cardHeight + cardSpacing) +
                          (cardHeight / 2) -
                          (dotSize / 2),
                      child: _TimelineDot(
                        active: i == 1,
                      ),
                    ),
                  ],

                  Positioned.fill(
                    left: 40,
                    child: Column(
                      children: List.generate(3, (i) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: i < 2 ? cardSpacing : 0,
                          ),
                          child: _TripCard(
                            imageUrl: imageUrls[i],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 32),

          const Center(
            child: Text(
              'Build the perfect trip',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'Explore homes, experiences and services.\n'
                  'When you book, your reservations will appear here.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
          ),

          const SizedBox(height: 24),

          Center(
            child: Container(
              width: 200,
              height: 48,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFFE595E),
                    Color(0xFFD32F2F),
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(24),
                  onTap: () {
                  },
                  child: const Center(
                    child: Text(
                      'Get started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _TimelineDot extends StatelessWidget {
  final bool active;
  const _TimelineDot({required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: active ? const Color(0xFF242424) : Colors.white,
        border: Border.all(
          color: Colors.grey.shade300,
          width: 2,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}

class _TripCard extends StatelessWidget {
  final String imageUrl;
  const _TripCard({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image.network(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 12,
                  width: 120,
                  color: Colors.grey.shade200,
                ),
                const SizedBox(height: 8),
                Container(
                  height: 12,
                  width: 80,
                  color: Colors.grey.shade200,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
