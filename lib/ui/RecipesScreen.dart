import 'package:flutter/material.dart';
import 'package:tugas_chapter_9/ui/RecipeDetailScreen.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 10.0,
              shadowColor: Colors.black,
              child: TextFormField(
                obscureText: true,
                autofocus: false,
                decoration: const InputDecoration(
                  icon: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(Icons.search, color: Colors.black),
                  ),
                  hintText: 'Search',
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GridView.count(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              crossAxisCount: 2,
              children: [
                cardRecipes(
                    'assets/mushroom.jpg', 'Mushroom Marsala Pasta with Artichokes recipes', 3335, context),
                cardRecipes(
                    'assets/pasta.jpg', 'Pasta Alla Genovese', 1638, context),
                cardRecipes(
                    'assets/macncheese.jpeg', 'Mac n Cheese', 1574, context),
                cardRecipes(
                    'assets/pizza.jpg', 'Pizza', 2100, context),
                cardRecipes(
                    'assets/tteokbokki.jpeg', 'Tteokbokki dish from korea', 1842, context),
                cardRecipes(
                    'assets/samyang.jpeg', 'samyang', 847, context),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget cardRecipes(
    String imageUrl, String name, int kcal, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RecipesDetailScreen(
            imageUrl: imageUrl,
            name: name,
            kcal: kcal,
          ),
        ),
      );
    },
    child: Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset(
                imageUrl,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '$kcal KCAL',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
