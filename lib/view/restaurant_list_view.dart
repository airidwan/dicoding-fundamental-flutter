import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:submission_restaurantapp/data/routes_nav.dart';
import 'package:submission_restaurantapp/data/restaurant_model.dart';
import 'package:submission_restaurantapp/widgets/icontitle_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class RestaurantListView extends StatelessWidget {
  const RestaurantListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            10.heightBox,
            // 'Restaurant List'.text.size(24).make().px8(),
            'Recomendation for you!'.text.gray700.make(),
            10.heightBox,
            FutureBuilder(
              future: DefaultAssetBundle.of(context).loadString('assets/local_restaurant.json'),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final _dataList = (jsonDecode(snapshot.data as String)['restaurants'] as List).map((x) => RestaurantModel.fromMap(x)).toList();
                  return ListView.builder(
                    itemCount: _dataList.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      final _item = _dataList[index];
                      final _km = Random().nextDouble() * 10.0;
                      return Card(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(5),
                            onTap: () {
                              Navigator.pushNamed(context, RoutesName.restauranDetail, arguments: _item);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 120,
                                  height: 80,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image(
                                      image: NetworkImage(_item.pictureId),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        _item.name.text.bold.make(),
                                        5.heightBox,
                                        IconTitleWidget(
                                          iconData: Icons.location_on,
                                          textTitle: _item.city,
                                        ),
                                        8.heightBox,
                                        IconTitleWidget(
                                          iconData: Icons.star,
                                          textTitle: '${_item.rating}',
                                          iconColor: Colors.orange,
                                        ),
                                        5.heightBox,
                                        '${_km.toDoubleStringAsFixed()} Kilometer lagi'.text.maxLines(2).overflow(TextOverflow.ellipsis).sm.gray700.make(),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
