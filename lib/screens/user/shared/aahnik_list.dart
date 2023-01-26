import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mum_k4/models/aahnik.dart';

import 'package:mum_k4/screens/user/shared/aahnik_tile.dart';

class AahnikList extends StatefulWidget {
  @override
  _AahnikListState createState() => _AahnikListState();
}

class _AahnikListState extends State<AahnikList> {
  @override
  Widget build(BuildContext context) {
    
    final aahniks = Provider.of<List<Aahnik>>(context) ?? [];
    
    return ListView.builder(
      itemCount: aahniks.length,
      itemBuilder: (context, index){
        return AahnikTile(aahnik: aahniks[index]);
      },
      );
  }
}
 