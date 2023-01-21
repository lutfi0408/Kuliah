import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../model/add.dart';

class ItemDaftar extends StatelessWidget {
  final AddItem daftar;
  final onUbah;
  final onHapus;

  const ItemDaftar({
    Key? key, 
    required this.daftar,
    required this.onHapus,
    required this.onUbah,
  }) :super (key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onUbah(daftar);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        tileColor: Colors.white,
        leading: Icon(
          daftar.done? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBLue,
        ),
        title: Text(
          daftar.addText!,
          style: TextStyle(
            fontSize: 16,
            color: tdBlack,
            decoration: daftar.done? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          // padding: EdgeInsets.all(0),
          // margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              onHapus(daftar.id);
            },
          ),
        ),
      ),
    );
  }
}