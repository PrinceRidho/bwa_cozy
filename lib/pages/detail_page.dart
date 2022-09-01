import 'package:bwa_cozy/theme.dart';
import 'package:bwa_cozy/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/space.dart';
import '../widgets/facility_item.dart';

class DetailPage extends StatelessWidget {
  final Uri _url = Uri.parse('https://goo.gl/maps/nZo4F7j8KmWUwyxH9');
  final Uri _url2 = Uri.parse('tel:+6282278479939');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  Future<void> _launchUrl2() async {
    if (!await launchUrl(_url2)) {
      throw 'Could not launch $_url';
    }
  }

  final Space space;

  DetailPage(this.space);

  @override
  Widget build(BuildContext context) {
    Future<void> showConfirmation() async {
      return showDialog(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Peringatan'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text(
                    'Apakah kamu yakin ingin',
                  ),
                  Text('menelpon pemilik Kos?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('GAS!'),
                onPressed: _launchUrl2,
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            // ===============
            // NOTE : TTHUMBNAIL
            // ===============
            Image.network(
              space.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/btn_back.png',
                      width: 40,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/btn_wishlist.png',
                      width: 40,
                    ),
                  ),
                ],
              ),
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      // ===============
                      // NOTE : TITLE
                      // ===============
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  space.name,
                                  style: blackTextStyle.copyWith(fontSize: 22),
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: '\$${space.price}',
                                    style:
                                        purpleTextStyle.copyWith(fontSize: 16),
                                    children: [
                                      TextSpan(
                                        text: ' / month',
                                        style: greyTextStyle.copyWith(
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [1, 2, 3, 4, 5].map((index) {
                                return Container(
                                  margin: EdgeInsets.only(left: 2),
                                  child: RatingItem(
                                      index: index, rating: space.rating),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      // ===============
                      // NOTE : MAIN FACILITIES
                      // ===============
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Main Facilities',
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItem(
                              name: 'kitchen',
                              imageUrl: 'assets/icon_kitchen.png',
                              total: space.numberOfKitchens,
                            ),
                            FacilityItem(
                              name: 'bedroom',
                              imageUrl: 'assets/icon_bedroom.png',
                              total: space.numberOfBedrooms,
                            ),
                            FacilityItem(
                              name: 'Big Lemari',
                              imageUrl: 'assets/icon_cupboard.png',
                              total: space.numberOfCupboards,
                            ),
                          ],
                        ),
                      ),
                      // ===============
                      // NOTE : PHOTOS
                      // ===============
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Photos',
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 12),
                      Container(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: space.photos.map((item) {
                            return Container(
                              margin: EdgeInsets.only(left: edge),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  item,
                                  width: 110,
                                  height: 88,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),

                      // ===============
                      // NOTE : LOCATION
                      // ===============
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Location',
                          style: regularTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 6),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${space.address}\n${space.city}',
                              style: greyTextStyle.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            InkWell(
                                onTap: _launchUrl,
                                child: Image.asset('assets/btn_map.png',
                                    width: 40)),
                          ],
                        ),
                      ),
                      // ===============
                      // NOTE : BUTTON BOOK NOW
                      // ===============
                      SizedBox(height: 40),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: edge),
                        height: 50,
                        width: MediaQuery.of(context).size.width - (2 * edge),
                        child: ElevatedButton(
                          onPressed: () => showConfirmation(),
                          style: ElevatedButton.styleFrom(
                            primary: purpleColor,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(17),
                            ),
                          ),
                          child: Text(
                            'Book Now',
                            style: whiteTextStyle,
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
