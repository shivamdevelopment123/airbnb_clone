import 'dart:math';
import 'package:flutter/foundation.dart';
import '../models/service_category_item.dart';
import '../models/section.dart';
import '../models/listing_item.dart';

class ServicesProvider with ChangeNotifier {
  final Random _rnd = Random();

  final List<ServiceCategoryItem> _categories = [];
  List<ServiceCategoryItem> get categories => _categories;

  final List<Section> _sections = [];
  List<Section> get sections => _sections;

  ServicesProvider() {
    _generateCategories();
    _generateSections();
  }

  void _generateCategories() {
    final names = ['Photography', 'Chefs', 'Prepared meals'];
    final subtitles = ['2 available', 'Coming soon', 'Coming soon'];
    final images = [
      // photography
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfEzwaoQ5esQEZKr5BOSk6zkMfIBV6PwGnYA&s',
      // chefs
      'https://www.shutterstock.com/image-photo/close-chef-serving-dish-restaurant-600nw-2472669243.jpg',
      // prepared meals
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQc2MwjWrZG9mgrB3aSQ9iawgpJaEBo1lmKxA&s',
    ];

    for (var i = 0; i < names.length; i++) {
      _categories.add(ServiceCategoryItem(
        imageUrl: images[i],
        title: names[i],
        subtitle: subtitles[i],
      ));
    }
  }

  void _generateSections() {

    final headers = ['Photography', 'Chefs', 'Training'];

    final Map<String, List<String>> namesPerSection = {
      'Photography': [
        'Stylish car photo tour',
        'Museum photoshoot',
        'Street photography',
      ],
      'Chefs': [
        'Hyperlocal foraged fare',
        'Vegan private chef',
        'French pastries mastery',
      ],
      'Training': [
        'Total body training',
        'Group fitness blast',
        'Sunrise yoga session',
      ],
    };

    final Map<String, List<String>> subsPerSection = {
      'Photography': [
        'From £48 / guest • ★4.94',
        'From £223 / guest • ★5.0',
        'From £30 / guest • ★4.8',
      ],
      'Chefs': [
        'From £36 / guest • ★5.0',
        'From £37 / guest • ★5.0',
        'From £40 / guest • ★4.9',
      ],
      'Training': [
        'From £37 / guest • ★5.0',
        'From £65 / guest • ★5.0',
        'From £22 / guest • ★4.9',
      ],
    };

    final Map<String, List<String>> imagesPerSection = {
      'Photography': [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBdYcT2S3jmJNEYmDGfYVlD-DJ7KBYnshcwg&s',
        'https://iso.500px.com/wp-content/uploads/2016/10/stock-photo-159358357.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRe6nL_TYinC0b-GdDXNnr7dZnFwvKdAi_ZDMsp3jXo53wW3v-JPpsqQ4E2A7AH-ziKKl4&usqp=CAU',
      ],
      'Chefs': [
        'https://professnow.com/blog/wp-content/uploads/2021/07/chef1.jpg',
        'https://5.imimg.com/data5/SELLER/Default/2022/3/LF/EF/HM/148640419/hire-tandoor-chef-for-canteen.jpg',
        'https://images.shiksha.com/mediadata/images/articles/1665553712php0ME2CP.jpeg',
      ],
      'Training': [
        'https://img.freepik.com/free-photo/strong-man-training-gym_1303-23478.jpg',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSi-sNZY9FmukBPxqryQS-4fy4ToTM21gBoag&s',
        'https://www.spartan.com/cdn/shop/articles/210427-BDoscher-MerchTraining-274_1024x1024.jpg?v=1633447393',
      ],
    };

    for (var header in headers) {
      final names = namesPerSection[header]!;
      final subs = subsPerSection[header]!;
      final imgs = imagesPerSection[header]!;

      final items = List.generate(names.length, (i) {
        return ListingItem(
          imageUrl: imgs[i],
          title: names[i],
          subtitle: subs[i],
        );
      });

      _sections.add(Section(title: header, items: items));
    }
  }
}
