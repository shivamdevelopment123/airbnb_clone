import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/experience_provider.dart';
import '../../../widgets/section_list.dart';

class ExperiencesScreen extends StatelessWidget {
  const ExperiencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sections = context.watch<ExperiencesProvider>().sections;

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
