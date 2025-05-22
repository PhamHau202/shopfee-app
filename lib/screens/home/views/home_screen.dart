import 'package:flutter/material.dart';
import 'package:shopfee_app/screens/home/views/components/banner_slider.dart';
import 'package:shopfee_app/screens/home/views/components/filter_buttons.dart';
import 'package:shopfee_app/screens/home/views/components/search_bar.dart';
import 'package:shopfee_app/screens/home/views/components/tabbar_menu.dart';
// import 'package:shopfee_app/widgets/banner_slider.dart';
// import 'package:shopfee_app/widgets/category_tabbar.dart';
// import 'package:shopfee_app/widgets/filter_buttons.dart';
// import 'package:shopfee_app/widgets/product_list_item.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: SearchBarWidget(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: BannerSlider(),
                    ),
                     
                     const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: TabbarMenu(),
                     ),
                     const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: FilterButtons(),
                     ),
                    // const CategoryTabBar(),
                    // const SizedBox(height: 16),
                    // const FilterButtons(),
                    // const SizedBox(height: 16),
                    // List sản phẩm
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        // return const ProductListItem();
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
