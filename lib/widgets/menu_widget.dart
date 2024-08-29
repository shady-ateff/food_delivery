import 'package:flutter/material.dart';
import 'package:food_delivery/models/menu_item_model.dart';
import 'package:food_delivery/widgets/favorite_icon_button.dart';

class MenuWidget extends StatelessWidget {
  final MenuItem menuItem;

  const MenuWidget({super.key, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    print(menuItem.location);
    return Stack(
      fit: StackFit.expand,
      children: [
        Card(
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Display the menu item image
                menuItem.location.startsWith("http")
                    ? Image.network(
                        menuItem.location,
                        width: constraints.maxWidth * 0.55,
                        fit: BoxFit.cover,
                        // Placeholder widget while the image loads
                        loadingBuilder: (context, child, loadingProgress) { // wait until photo be downloaded
                          if (loadingProgress == null) return child; //if photo downloaded show it 
                          return Center(
                            child: CircularProgressIndicator( // progress indecator data downloaded
                              color: Theme.of(context).primaryColor,
                              value: loadingProgress.expectedTotalBytes != null // Asuree that thier is data will be downloaded "not no thing"
                                  ? loadingProgress.cumulativeBytesLoaded /    // bytes downloaded / total bytes
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          );
                        },
                        // Error widget if the image fails to load
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.error,
                            size: constraints.maxWidth * 0.55,
                            color: Colors.red,
                          );
                        },
                      )
                    : 
                    Image.asset(
                        menuItem.location,
                        width: constraints.maxWidth * 0.55,
                        fit: BoxFit.cover,
                      ),
                Text(
                  textAlign: TextAlign.center,
                  menuItem.name,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: constraints.maxWidth * 0.08),
                ),
                Text(
                  "${menuItem.price}\$",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize: constraints.maxWidth * 0.08),
                ),
              ],
            );
          }),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
              padding: EdgeInsets.all(screenSize.width * 0.005),
              child: FavoriteIconButton(
                menuItem: menuItem,
              )),
        ),
      ],
    );
  }
}
