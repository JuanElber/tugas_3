import 'package:flutter/material.dart';

class RecipesDetailScreen extends StatelessWidget {
  final String imageUrl;
  final int kcal;
  final String name;

  const RecipesDetailScreen(
      {Key? key,
      required this.imageUrl,
      required this.kcal,
      required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Image.asset(imageUrl),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: 10,
              ),
              child: Text(
                name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: 40,
              ),
              child: Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  '$kcal KCAL',
                  style: TextStyle(fontSize: 14),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
              ),
            ),
            Center(
              child: ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                onPressed: () {},
                icon: Icon(Icons.bookmark_border),
                label: Text('Bookmark'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
