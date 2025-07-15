import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/homes_provider.dart';
import '../../../widgets/section_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sections = context.watch<HomesProvider>().sections;

    if (sections.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),
            for (var sec in sections) ...[
              SectionList(section: sec),
              const SizedBox(height: 24),
            ],
          ],
        ),
      ),
    );
  }
}
