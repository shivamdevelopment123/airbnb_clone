import 'dart:math';
import 'package:flutter/foundation.dart';
import '../models/listing_item.dart';
import '../models/section.dart';

class HomesProvider with ChangeNotifier {
  final Random _rnd = Random();
  final List<Section> _sections = [];

  List<Section> get sections => _sections;

  HomesProvider() {
    _generateSections();
  }

  void _generateSections() {
    final sectionTitles = [
      'Popular homes in Gurgaon District',
      'Available in Gautam Buddha Nagar this weekend',
      'Trending stays near me',
      'Recommended for you',
      'New listings added'
    ];

    final Map<String, List<String>> namesPerSection = {
      sectionTitles[0]: [
        'Flat in Gurugram',
        'Studio in Gurgaon Sector 14',
        'Villa near Cyber City',
        'Penthouse in Udyog Vihar',
        'Serviced Apt in Sushant Lok',
      ],
      sectionTitles[1]: [
        'Hotel in Greater Noida',
        'Resort in Noida Extension',
        'Guesthouse in Sector 62',
        'Boutique Stay in Ecotech',
        'Homestay in Pari Chowk',
      ],
      sectionTitles[2]: [
        'Room in Delhi',
        'Apt near Connaught Place',
        'Cozy Flat in Saket',
        'Budget Stay in Karol Bagh',
        'Premium Suite in Vasant Vihar',
      ],
      sectionTitles[3]: [
        'Cottage in Manali',
        'Loft in Shimla',
        'Treehouse in Dharamshala',
        'Cabin in Solan',
        'Villa in Kasauli',
      ],
      sectionTitles[4]: [
        'Room in Dehradun',
        'Guesthouse near Mussoorie',
        'Homestay in Rishikesh',
        'Resort in Haridwar',
        'Camping Tent in Rajaji NP',
      ],
    };

    final subtitles = [
      '₹2,300/night • 4.8★',
      '₹1,800/night • 4.5★',
      '₹3,200/night • 4.9★',
      '₹2,600/night • 4.7★',
      '₹1,200/night • 4.3★',
      '₹5,700/night • 4.8★',
      '₹5,508/night • 4.8★',
      '₹3,999/night • 4.8★',
      '₹2,000/night • 4.8★',
    ];

    final hotelImages = [
      'https://www.jaypeehotels.com/blog/wp-content/uploads/2024/09/Blog-6-scaled.jpg',
      'https://dq5r178u4t83b.cloudfront.net/wp-content/uploads/sites/125/2020/06/15182916/Sofitel-Dubai-Wafi-Luxury-Room-Bedroom-Skyline-View-Image1_WEB.jpg',
      'https://static01.nyt.com/images/2019/03/24/travel/24trending-shophotels1/24trending-shophotels1-videoSixteenByNineJumbo1600.jpg',
      'https://images.oyoroomscdn.com/uploads/hotel_image/234553/medium/wrcbqataxifu.jpg',
      'https://assets-news.housing.com/news/wp-content/uploads/2022/11/25115550/image1-53.jpg',
      'https://assets-news.housing.com/news/wp-content/uploads/2022/11/25113355/hotel-room-design-compressed-1.jpg',
      'https://assets.simplotel.com/simplotel/image/upload/x_0,y_34,w_1941,h_1091,r_0,c_crop,q_90,fl_progressive/w_900,f_auto,c_fit/hablis-hotel-chennai/hablis_suite_-_hablis_hotel_in_chennai_0',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkG6KPd3x99AsSBGew0gD8HRSXyHkBih_f8Q&s',
      'https://r2imghtlak.mmtcdn.com/r2-mmt-htl-image/htl-imgs/201704121810455513-ec363e96763811e9a4840242ac110003.jpg?output-quality=75&downsize=328:180&output-format=jpg',
      'https://cf.bstatic.com/static/img/theme-index/bg_luxury/869918c9da63b2c5685fce05965700da5b0e6617.jpg',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHlybVkWz2k5aSlTHHV2HUoXn7QPMOkwL0GNj3GaJYkEAcJ-CPSp0tf5hKPs3mSxm9J4o&usqp=CAU',
      'https://images.squarespace-cdn.com/content/v1/5a5e0b8349fc2bfe9b5ad7a1/1719958767820-BG70GBJROR8EPMIX6M2F/PLS+copia.jpg?format=1500w',
      'https://images.trvl-media.com/media/content/shared/images/travelguides/sem-hotels-desktopRetina.jpg?impolicy=fcrop&w=450&h=280&q=medium',
      'https://cf.bstatic.com/xdata/images/hotel/max1024x768/489085609.jpg?k=fd3add8d8e20a0ebf8c6961acb0c373f0ec412f3d4e06152d25927b696b8ecac&o=&hp=1',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSE9uj_KnutBGxmsd0YepzN4-lUvkV7UN8jq0v8zmdmZIxKJE8-qcjDHpxDi5zjblwSMJA&usqp=CAU'
    ];

    for (var header in sectionTitles) {
      final names = namesPerSection[header]!;
      final items = List<ListingItem>.generate(names.length, (i) {
        return ListingItem(
          imageUrl: hotelImages[_rnd.nextInt(hotelImages.length)],
          title: names[i],
          subtitle: subtitles[_rnd.nextInt(subtitles.length)],
        );
      });

      _sections.add(Section(title: header, items: items));
    }

    notifyListeners();
  }
}