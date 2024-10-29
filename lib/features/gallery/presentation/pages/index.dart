import 'dart:io';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

@RoutePage()
class GalleryPage extends ConsumerStatefulWidget {
  static var page;

  const GalleryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GalleryPageState();
}

class _GalleryPageState extends ConsumerState<GalleryPage> {
  final List<Map<String, dynamic>> imageTiles = [
    {
      'imagePath': 'assets/png/Rectangle.png',
      'crossAxisCount': 4,
      'mainAxisCount': 2
    },
    {
      'imagePath': 'assets/png/Rectangle_2.png',
      'crossAxisCount': 2,
      'mainAxisCount': 2
    },
    {
      'imagePath': 'assets/png/Rectangle_6.png',
      'crossAxisCount': 2,
      'mainAxisCount': 4
    },
    {
      'imagePath': 'assets/png/Rectangle_3.png',
      'crossAxisCount': 2,
      'mainAxisCount': 2
    },
    {
      'imagePath': 'assets/png/Rectangle_4.png',
      'crossAxisCount': 2,
      'mainAxisCount': 2
    },
    {
      'imagePath': 'assets/png/Rectangle_5.png',
      'crossAxisCount': 2,
      'mainAxisCount': 2
    },
    {
      'imagePath': 'assets/png/Rectangle.png',
      'crossAxisCount': 4,
      'mainAxisCount': 2
    },
    {
      'imagePath': 'assets/png/Rectangle_6.png',
      'crossAxisCount': 2,
      'mainAxisCount': 4
    },
    {
      'imagePath': 'assets/png/Rectangle_2.png',
      'crossAxisCount': 2,
      'mainAxisCount': 2
    },
    {
      'imagePath': 'assets/png/Rectangle_3.png',
      'crossAxisCount': 2,
      'mainAxisCount': 2
    },
    {
      'imagePath': 'assets/png/Rectangle_4.png',
      'crossAxisCount': 2,
      'mainAxisCount': 2
    },
    {
      'imagePath': 'assets/png/Rectangle_5.png',
      'crossAxisCount': 2,
      'mainAxisCount': 2
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Staggered Image Grid')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: StaggeredGrid.count(
            crossAxisCount: 4, // Number of columns
            mainAxisSpacing: 18.0,
            crossAxisSpacing: 18.0,
            children: imageTiles.map((tile) {
              // print(imageTiles);
              // print(tile);
              return StaggeredGridTile.count(
                crossAxisCellCount: tile['crossAxisCount'],
                mainAxisCellCount: tile['mainAxisCount'],
                child: buildImageTile(tile['imagePath']),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget buildImageTile(String imagePath) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
