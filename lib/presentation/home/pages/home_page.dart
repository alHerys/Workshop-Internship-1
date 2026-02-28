import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_svg/svg.dart';

import '../../../core/const/icons_const.dart';
import '../../../core/const/image_const.dart';
import '../../../core/theme/app_pallete.dart';
import '../../../core/theme/app_text.dart';
import '../widgets/home_trending_card.dart';
import '../widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: SearchBar(
          leading: Icon(Icons.search_rounded, color: AppPallete.neutral400),
          hintText: 'Cari apapun di sini',
          hintStyle: WidgetStatePropertyAll(
            AppText.regular12.copyWith(color: AppPallete.neutral400),
          ),
          shadowColor: WidgetStatePropertyAll(Colors.transparent),
          side: WidgetStatePropertyAll(
            BorderSide(color: AppPallete.neutral400, width: 2),
          ),
          padding: WidgetStatePropertyAll(.symmetric(horizontal: 15)),
          constraints: BoxConstraints(minHeight: 42),
          textStyle: WidgetStatePropertyAll(AppText.regular12),
        ),
        actionsPadding: .only(right: 22),
        actions: [
          CircleAvatar(
            backgroundColor: AppPallete.primaryLight,
            child: SvgPicture.asset(IconConst.giftBox),
          ),
          SizedBox(width: 7),
          CircleAvatar(
            backgroundColor: AppPallete.primaryLight,
            child: SvgPicture.asset(IconConst.setting),
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              Card(
                clipBehavior: .antiAlias,
                shape: RoundedRectangleBorder(borderRadius: .circular(24)),
                child: Image.asset(ImageConst.homeCarousel1),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: .spaceEvenly,
                children: [
                  MenuWidget(name: 'Jelajahi', icon: IconConst.jelajahi),
                  MenuWidget(name: 'Penginapan', icon: IconConst.penginapan),
                  MenuWidget(
                    name: 'Kondisi Jalan',
                    icon: IconConst.kondisiJalan,
                  ),
                  MenuWidget(
                    name: 'Transportasi',
                    icon: IconConst.transportasi,
                  ),
                ],
              ),

              const SizedBox(height: 30),

              Text('Sedang Trending', style: AppText.semiBold20),

              const SizedBox(height: 20),

              for (int i = 0; i < 3; i++)
                HomeTrendingCard(
                  title: 'Kampung warna-warni',
                  location: 'Blimbing - Malang',
                  image: ImageConst.kampungWarnaWarni,
                  price: 'Rp 5.000',
                  rating: 4.0,
                  reviewCount: 273,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
