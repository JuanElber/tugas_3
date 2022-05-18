import 'package:flutter/material.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            listRecipes('assets/mushroom.jpg', 'Mushroom Marsala'),
          ],
        ),
      ),
    );
  }
}

Widget listRecipes(String imageUrl, String name) {
  return Container(
    padding: EdgeInsets.only(bottom: 10),
    height: 90,
    child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              imageUrl,
            ),
            SizedBox(
              width: 10,
            ),
            Text(name),
          ],
        ),
      ),
    ),
  );
}
