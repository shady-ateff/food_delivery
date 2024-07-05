//import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});



  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Widget profileInfo = LayoutBuilder(builder: (context, constraint) {
      return Column(children: [
        SizedBox(
          height: screenSize.height * 0.06,
        ),
        //Platform.isWindows?Text("data"): if you need to coustomize app for every single platform *dart:io*
        CircleAvatar(
          radius: constraint.maxWidth < 300 ? constraint.maxWidth * 0.3 : 120,
          backgroundImage: const AssetImage('assets/images/profile.jpg'),
        ),
        SizedBox(
          height: screenSize.height * 0.03,
        ),
        Text(
          'Shady Atef',
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        GridView(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            dragStartBehavior: DragStartBehavior.down,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: //(constraint.maxWidth / 300).ceil(),
              constraint.maxWidth > 300 ? 2 : 1,
              childAspectRatio: 3.0,
              mainAxisSpacing: 10,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              profileInfoItem(context, 50, "Orders"),
              profileInfoItem(context, 10, "Offers"),
            ]),
      ]);
    });
    return screenSize.width < screenSize.height
        ? SingleChildScrollView(
            child: Column(children: [
              Column(
                children: [
                  profileInfo,
                  listOfInfoItem(context, "Past Orders", Icons.note_add_rounded,
                      Icons.arrow_forward_ios_rounded),
                  const Divider(),
                  listOfInfoItem(context, "Location", Icons.location_on_rounded,
                      Icons.edit_rounded),
                  const Divider(),
                ],
              ),
            ]),
          )
        : SingleChildScrollView(
            child: Row(
              children: [
                Expanded(child: profileInfo),
                Expanded(
                  child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        listOfInfoItem(
                            context,
                            "Past Orders",
                            Icons.note_add_rounded,
                            Icons.arrow_forward_ios_rounded),
                        const Divider(),
                        listOfInfoItem(context, "Location",
                            Icons.location_on_rounded, Icons.edit_rounded),
                        const Divider(),
                      ]),
                )
              ],
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
          size: constraints.maxWidth * 0.05,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: constraints.maxWidth * 0.04,
          ),
        ),
        trailing: Icon(
          trailingIco,
          size: constraints.maxWidth * 0.03,
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
                fontSize: constraints.maxWidth * 0.08)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.note_alt,
              color: Theme.of(context).primaryColor,
              size: constraints.maxWidth * 0.1,
            ),
            Text(itemName,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: constraints.maxWidth * 0.08)),
          ],
        ),
      ]);
    });
  }
}
