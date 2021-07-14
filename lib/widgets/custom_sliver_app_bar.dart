import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  const CustomSliverAppBarDelegate({
    this.expandedHeight = 200,
    required this.title,
    required this.imgUrl,
    required this.changeFavorite,
    required this.descriptionTab,
    required this.otherDetailsTab,
  });

  final double expandedHeight;
  final String title;
  final String imgUrl;
  final Function changeFavorite;
  final Function descriptionTab;
  final Function otherDetailsTab;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    const int size = 60;
    final double top = expandedHeight - shrinkOffset - size / 2;

    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: <Widget>[
        buildBackground(shrinkOffset),
        buildAppBar(shrinkOffset),
        Positioned(
          top: top,
          left: 20,
          right: 20,
          child: buildFloating(shrinkOffset, descriptionTab, otherDetailsTab),
        ),
      ],
    );
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  Widget buildAppBar(double shrinkOffset) => Opacity(
        opacity: appear(shrinkOffset),
        child: AppBar(
          title: Text(title),
          centerTitle: true,
          backgroundColor: const Color(0xFF424242),
        ),
      );

  Widget buildBackground(double shrinkOffset) => Opacity(
      opacity: disappear(shrinkOffset),
      child: SvgPicture.network(
        imgUrl,
        fit: BoxFit.cover,
      ));

  Widget buildFloating(double shrinkOffset, Function descriptionTab,
          Function otherDetailsTab) =>
      Opacity(
        opacity: disappear(shrinkOffset),
        child: Card(
          child: Row(
            children: <Widget>[
              Expanded(
                  child: buildButton(
                      text: 'Description',
                      icon: Icons.list,
                      onPressed: descriptionTab)),
              Expanded(
                  child: buildButton(
                      text: 'Other Details',
                      icon: Icons.info_outline,
                      onPressed: otherDetailsTab)),
            ],
          ),
        ),
      );

  Widget buildButton({
    required String text,
    required IconData icon,
    required Function onPressed,
  }) =>
      TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, color: const Color(0xFF424242)),
            const SizedBox(width: 12),
            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF424242),
              ),
            ),
          ],
        ),
        onPressed: () {
          onPressed();
        },
      );

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 30;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
