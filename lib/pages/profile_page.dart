//import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});



  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    bool isLandscape = screenSize.width > screenSize.height;
    return SingleChildScrollView(
      child: Container(
        //constraints: BoxConstraints(maxWidth:screenSize.width),
        child: Flex(
          direction: isLandscape ? Axis.horizontal : Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              constraints: BoxConstraints(
                  maxWidth:
                      isLandscape ? screenSize.width * 0.4 : screenSize.width),
              child: LayoutBuilder(builder: (context, constrainrs) {
                return Column(
                  children: [
                    SizedBox(
                      height: screenSize.height * 0.06,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: constrainrs.maxWidth < 220
                            ? constrainrs.maxWidth * 0.4
                            : 120,
                        backgroundImage:
                            const AssetImage('assets/images/profile.jpg'),
                      ),
                    ),
                    // SizedBox(
                    //   height: screenSize.height * 0.03,
                    // ),
                    Text('Shady Atef',
                        style: Theme.of(context).textTheme.headlineMedium),
                    // SizedBox(
                    //   height: screenSize.height * 0.03,
                    // ),
                    Flex(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        direction: constrainrs.maxWidth > 300
                            ? Axis.horizontal
                            : Axis.vertical,
                        children: [
                          profileInfoItem(context, 50, "Orders"),
                          profileInfoItem(context, 10, "Offers"),
                        ]),
                    // SizedBox(
                    //   height: screenSize.height * 0.03,
                    // ),
                  ],
                );
              }),
            ),
            Container(
              constraints: BoxConstraints(
                  maxWidth:
                      isLandscape ? screenSize.width * 0.4 : screenSize.width),
              child: Column(
                children: [
                  listOfInfoItem(context, "Past Orders", Icons.note_add_rounded,
                      Icons.arrow_forward_ios_rounded),
                  const Divider(),
                  listOfInfoItem(context, "Location", Icons.location_on_rounded,
                      Icons.edit_rounded),
                  const Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listOfInfoItem(BuildContext context, String title, IconData leadingIco,
      IconData trailingIco,
      {String? subtitleText}) {
    return LayoutBuilder(builder: (context, constraints) {
      return ListTile(
        leading: Icon(
          leadingIco,
          size:constraints.maxWidth<500? constraints.maxWidth * 0.06 : constraints.maxWidth * 0.04,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            
                fontSize:constraints.maxWidth<200? constraints.maxWidth * 0.06 : constraints.maxWidth * 0.043,
              ),
        ),
        trailing: Icon(
          trailingIco,
          size:constraints.maxWidth<500? constraints.maxWidth * 0.05 : constraints.maxWidth * 0.035,
        ),
        subtitle: subtitleText != null ? Text(subtitleText) : null,
      );
    });
  }

  Widget profileInfoItem(
      BuildContext context, int itemNumber, String itemName) {
    return LayoutBuilder(builder: (context, constraints) {
      //padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 11.0),
      return Column(mainAxisSize: MainAxisSize.min, children: [
        Text("$itemNumber",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  // fontSize: constraints.maxWidth * 0.1
                )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.note_alt,
              color: Theme.of(context).primaryColor,
              //size: constraints.maxWidth * 0.1,
            ),
            Text(itemName,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      // fontSize: constraints.maxWidth * 0.08
                    )),
          ],
        ),
      ]);
    });
  }
}
