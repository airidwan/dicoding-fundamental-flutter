import 'package:flutter/material.dart';
import 'package:submission_restaurantapp/data/restaurant_model.dart';
import 'package:submission_restaurantapp/widgets/icontitle_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class RestaurantDetailView extends StatelessWidget {
  final RestaurantModel data;
  const RestaurantDetailView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverLayoutBuilder(
            builder: (BuildContext context, constraints) {
              final scrolled = constraints.scrollOffset > 0;
              return SliverAppBar(
                title: !scrolled ? null : data.name.text.make(),
                automaticallyImplyLeading: scrolled,
                expandedHeight: 250,
                pinned: true,
                floating: false,
                snap: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image(
                    image: NetworkImage(data.pictureId),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.heightBox,
                    data.name.text.size(18).semiBold.make(),
                    5.heightBox,
                    IconTitleWidget(
                      iconData: Icons.location_on_outlined,
                      textTitle: data.city,
                    ),
                    8.heightBox,
                    IconTitleWidget(
                      iconData: Icons.star,
                      textTitle: '${data.rating}',
                      iconColor: Colors.orange,
                    ),
                  ],
                ).px8(),
                Divider(),
                10.heightBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    'Description'.text.bold.make(),
                    data.description.text.size(11).make(),
                  ],
                ).px8(),
                Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    'Menus'.text.bold.make(),
                    6.heightBox,
                    'Foods:'.text.make(),
                    Wrap(
                      spacing: 3,
                      runSpacing: 2,
                      children: data.menus.foods
                          .map(
                            (e) => _buildMenuList(e.name),
                          )
                          .toList(),
                    ),
                    5.heightBox,
                    'Drinks:'.text.make(),
                    Wrap(
                      spacing: 3,
                      runSpacing: 2,
                      children: data.menus.drinks
                          .map(
                            (e) => _buildMenuList(e.name),
                          )
                          .toList(),
                    ),
                  ],
                ).px8(),
              ],
            ),
          ),
          SliverFillRemaining(),
        ],
      ),
    );
  }

  Widget _buildMenuList(String title) {
    return title.text.color(Colors.white).sm.semiBold.make().pSymmetric(h: 6, v: 5).box.blue400.make().card.make();
  }
}
