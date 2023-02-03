import 'package:flutter/material.dart';

class CategoryListWidget extends StatelessWidget {
  final List<String> categories = ['Music', 'Tournaments', 'Speeches'];

  CategoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(8),
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => print("dd"),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Container(
                      width: 120,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //"Icons made by Freepik from www.flaticon.com"
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              width: 70,
                              child: Image.asset(
                                'assets/images/categories/${categories[index]}.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4, bottom: 4),
                            child: Text(
                              categories[index],
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 1, //height spacing of divider
                  thickness: 1, //thickness of divider line
                  indent: 5, //spacing at the start of divider
                  endIndent: 5, //spacing at the end of divider
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
