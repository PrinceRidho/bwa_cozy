import 'dart:js';

import 'package:bwa_cozy/pages/home_page.dart';
import 'package:bwa_cozy/pages/splash_page.dart';
import 'package:bwa_cozy/theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/facility_item.dart';

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

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            // ===============
            // NOTE : TTHUMBNAIL
            // ===============
            Image.asset(
              'assets/thumbnail.png',
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
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/btn_back.png',
                      width: 40,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
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
                                  'Kuretakeso Hott',
                                  style: blackTextStyle.copyWith(fontSize: 22),
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: '\$52',
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
                              children: [
                                Image.asset(
                                  'assets/icon_star.png',
                                  width: 20,
                                ),
                                SizedBox(width: 2),
                                Image.asset(
                                  'assets/icon_star.png',
                                  width: 20,
                                ),
                                SizedBox(width: 2),
                                Image.asset(
                                  'assets/icon_star.png',
                                  width: 20,
                                ),
                                SizedBox(width: 2),
                                Image.asset(
                                  'assets/icon_star.png',
                                  width: 20,
                                ),
                                SizedBox(width: 2),
                                Image.asset(
                                  'assets/icon_star.png',
                                  color: Color(0xff989BA1),
                                  width: 20,
                                ),
                              ],
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
                              total: 2,
                            ),
                            FacilityItem(
                              name: 'bedroom',
                              imageUrl: 'assets/icon_bedroom.png',
                              total: 3,
                            ),
                            FacilityItem(
                              name: 'Big Lemari',
                              imageUrl: 'assets/icon_cupboard.png',
                              total: 3,
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
                          children: [
                            SizedBox(width: edge),
                            Image.asset(
                              'assets/photo1.png',
                              width: 110,
                              height: 88,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 18),
                            Image.asset(
                              'assets/photo2.png',
                              width: 110,
                              height: 88,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 18),
                            Image.asset(
                              'assets/photo3.png',
                              width: 110,
                              height: 88,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 18),
                            Image.asset(
                              'assets/photo1.png',
                              width: 110,
                              height: 88,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 18),
                          ],
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
                              'Jln. Kappan Sukses No. 20\nPalembang',
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
                          onPressed: _launchUrl2,
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
