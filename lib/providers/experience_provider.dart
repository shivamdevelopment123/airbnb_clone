import 'dart:math';
import 'package:flutter/foundation.dart';
import '../models/listing_item.dart';
import '../models/section.dart';

class ExperiencesProvider with ChangeNotifier {
  final Random _rnd = Random();
  final List<Section> _sections = [];

  List<Section> get sections => _sections;

  ExperiencesProvider() {
    _generateSections();
  }

  void _generateSections() {
    final sectionTitles = [
      'Airbnb Originals',
      'Tomorrow in New Delhi',
      'Experiences this weekend',
      'Popular experiences in New Delhi',
    ];

    final Map<String, List<String>> namesPerSection = {
      sectionTitles[0]: [
        'Lunch with fashion icon Lenny Niemeyer',
        'Learn timeless skincare rituals with Giselle Go',
        'Make sustainable fashion with textile artist',
      ],
      sectionTitles[1]: [
        'Same Day Taj Mahal & Agra Fort Tour',
        'Old Delhi’s Religion, Spice & Food Tour',
        'Sunrise Yoga at Lodhi Gardens',
      ],
      sectionTitles[2]: [
        'Unveil Delhi’s Food, Spirituality & Spice',
        'Old Delhi Food & History: Blend of Taste',
        'Cycle through the colourful bazaars',
      ],
      sectionTitles[3]: [
        'Old Delhi Food, Temples & Rickshaw Ride',
        'Cook Indian food in a Delhi home',
        'Walk the street art trail of New Delhi',
      ],
    };

    final List<String> subtitles = [
      'From £76 / guest',
      'From £144 / guest',
      'From £26 / guest • ★ 5.0',
      'From £39 / guest • ★ 5.0',
      'From £22 / guest • ★ 4.99',
      'Fri • 12:30',
      'Fri • 1 PM',
      '02:30 • Next slots',
    ];

    final images = [
      'https://d2rdhxfof4qmbb.cloudfront.net/wp-content/uploads/20190222150417/iStock-514565616.jpg',
      'https://t4.ftcdn.net/jpg/04/08/81/09/360_F_408810925_IG49PMSfC7ZolH4ZLYNZTVuy8YN0BhGK.jpg',
      'https://assets.telegraphindia.com/telegraph/2022/Oct/1665218989_edugraph-17.jpg',
      'https://static2.tripoto.com/media/filter/tst/img/15546/TripDocument/shutterstock_260727797.jpg',
      'https://images.indianexpress.com/2019/07/travelling_759-1.jpg?w=414',
      'https://www.deccanchronicle.com/h-upload/2024/05/31/1093873-philipp-kammerer-6mxbmzq8e-unsplash.webp',
      'https://media.istockphoto.com/id/1410978545/photo/young-beautiful-woman-traveling-by-car-in-the-mountains-summer-vacation-and-adventure.jpg?s=612x612&w=0&k=20&c=wfQiudz-g1m0EHpjctcdw7g62GwnBrIa5Iax0LJTAGY=',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYix2te7inMQRPb7970I3J5VcUlFJnaO5q_A&s',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMLVHI2Ov9_tfxdGLzbF_AQ4q4RKROpXWhwg&s',
      'https://i0.wp.com/diabetesvoice.org/wp-content/uploads/2020/08/woman-walking-in-airport.jpg?resize=800%2C600&ssl=1',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQo58r42rI_xfyzl4MrMvaQUvI56HiqndE2Dw&s',
      'https://d2rdhxfof4qmbb.cloudfront.net/wp-content/uploads/20190222171753/iStock-875284844.jpg'
    ];

    for (var header in sectionTitles) {
      final names = namesPerSection[header]!;
      final items = names.map((name) {
        return ListingItem(
          imageUrl: images[_rnd.nextInt(images.length)],
          title: name,
          subtitle: subtitles[_rnd.nextInt(subtitles.length)],
        );
      }).toList();

      _sections.add(Section(title: header, items: items));
    }

    notifyListeners();
  }
}