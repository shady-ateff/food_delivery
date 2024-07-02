import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: screenSize.height * 0.06,
        ),
        CircleAvatar(
          radius: screenSize.width < 300 ? screenSize.width * 0.3 : 120,
          backgroundImage: const AssetImage('assets/images/profile.jpg'),
        ),
        SizedBox(
          height: screenSize.height * 0.03,
        ),
        Text('Shady Atef', style: Theme.of(context).textTheme.headlineMedium),
        SizedBox(
          height: screenSize.height * 0.03,
        ),
        GridView(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (screenSize.width/300).ceil(),
              childAspectRatio: 3.0,
              mainAxisSpacing: 10,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              profileInfoItem(context, 50, "Orders"),
              profileInfoItem(context, 10, "Offers"),
              
            ]),
        SizedBox(
          height: screenSize.height * 0.03,
        ),
        listOfInfoItem(context, "Past Orders", Icons.note_add_rounded,
            Icons.arrow_forward_ios_rounded),
        const Divider(),
        listOfInfoItem(
            context, "Location", Icons.location_on_rounded, Icons.edit_rounded),
        const Divider(),
      ]),
    );
  }

  Widget listOfInfoItem(BuildContext context, String title, IconData leadingIco,
      IconData trailingIco,
      {String? subtitleText}) {
    return ListTile(
      leading: Icon(
        leadingIco,
      ),
      title: Text(title),
      trailing: Icon(
        trailingIco,
        size: MediaQuery.of(context).size.width * 0.02,
      ),
      subtitle: subtitleText != null ? Text(subtitleText) : null,
    );
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
                fontSize:constraints.maxWidth * 0.1)),
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
