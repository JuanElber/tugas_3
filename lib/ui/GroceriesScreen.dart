import 'package:flutter/material.dart';

class GroceriesScreen extends StatelessWidget {
  const GroceriesScreen({Key? key}) : super(key: key);

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
            listGroceries('1/2 flour', 123),
            listGroceries('4 eggs beaten', 200),
            listGroceries('2 tablespoons of butter', 10),
          ],
        ),
      ),
    );
  }
}

Widget listGroceries(String name, int grams) {
  return CheckboxListTile(
    controlAffinity: ListTileControlAffinity.leading,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name),
        Container(
          padding: EdgeInsets.all(8),
          child: Text('$grams g', style: TextStyle(fontSize: 14),),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey,
            
          ),
        )
      ],
    ),
    value: false,
    onChanged: (bool? value) {},
  );
}
