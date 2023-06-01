import 'package:flutter/material.dart';

class TagsList extends StatefulWidget {
  TagsList({Key? key}) : super(key: key);

  @override
  State<TagsList> createState() => _TagsListState();
}

class _TagsListState extends State<TagsList> {
  var selectedList = 0;

  final taglist = <String>['All', '⚡ Popular', '⭐ Featured'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      height: 40,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedList = index;
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: selectedList == index
                        ? Colors.pink.withOpacity(0.4)
                        : Colors.pink.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: selectedList == index
                          ? Colors.pink
                          : Colors.pink.withOpacity(0.2),
                    ),
                  ),
                  child: Text(
                    taglist[index],
                  ),
                ),
              ),
          separatorBuilder: (_, index) => const SizedBox(
                width: 15,
              ),
          itemCount: taglist.length),
    );
  }
}
