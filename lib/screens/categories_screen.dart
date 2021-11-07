import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      // Grid is just like ListView (is scrollable as default)
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map(
            (catData) => CategoryItem(
              catData.id,
              catData.title,
              catData.color,
            ),
          )
          .toList(),
      /* GridDelegate: means for the grid, this takes care about structuring, layouting the grid
          WithMaxCrossAxisExtent: means this is preconfigured class to define a max width for each grid item,
                                  and then it automatically creates as many columns as we can fit items with that 
                                  provided width next to each other.
          maxCrossAxisExtent: _ The maximum extent or width of the tiles, so of the grid items
                              _ Depends on device size (how many columns we'll get in that grid)
          childAspectRatio: _ How items should be sized regarding their height and width relation
        */
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        // scrollable areas on the screen
        maxCrossAxisExtent:
            200, // (1 item/row for device of 300px width, 2 items sit side by side for 500px width)
        childAspectRatio: 3 / 2, // for 200 width, we have 300 height
        crossAxisSpacing:
            20, // how much distance is between rows or columns in the grid.
        mainAxisSpacing: 20,
      ),
    );
  }
}
