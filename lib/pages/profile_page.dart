import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(
          height: 40,
        ),
        const CircleAvatar(
          radius: 100,
          backgroundImage: AssetImage('assets/images/profile.jpg'),
        ),
        const SizedBox(
          height: 20,
        ),
        Text('Shady Atef', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(
          height: 20,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          profileInfoItem(context, 50, "Orders"),
          profileInfoItem(context, 10, "Offers"),
        ]),
        const SizedBox(
          height: 20,
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
        size: 20,
      ),
      subtitle: subtitleText != null ? Text(subtitleText) : null,
    );
  }

  Widget profileInfoItem(
      BuildContext context, int itemNumber, String itemName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 11.0),
      child: Column(children: [
        Text("$itemNumber",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.note_alt,
              color: Theme.of(context).primaryColor,
              size: 20,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(itemName,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w400)),
          ],
        ),
      ]),
    );
  }
}
