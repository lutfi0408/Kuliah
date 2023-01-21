import 'package:flutter/material.dart';
import 'aboutme.dart';
import '../widgets/daftar_item.dart';
import '../model/add.dart';
import '../constants/colors.dart';

class Home extends StatefulWidget {
  Home({Key? key}) :super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<AddItem> _search = [];
  final daftarTugas = AddItem.daftarItem();
  final controller = TextEditingController();

  @override
  void initState() {
    _search = daftarTugas;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: _buildAppBar(),
      // appBar: AppBar(
      //   centerTitle: true,
      //   shadowColor: background,
      //   backgroundColor: background,
      //   title: Text("Note App", style: TextStyle(color: Colors.black, fontSize: 25),),
      //   leading: Builder(
      //     builder: (context) => IconButton(
      //       onPressed: () {
      //         Scaffold.of(context).openDrawer();
      //       },
      //       icon: Icon(Icons.menu, color: Colors.black,))),
      // ),
      // drawer: Drawer(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 50,
                          bottom: 20,
                        ),
                        child: Text(
                          'Daftar Tugas',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      
                      for (AddItem daftar in _search.reversed)
                        ItemDaftar(
                          daftar: daftar,
                          onUbah: _handleUbah,
                          onHapus: _handleHapus,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: 'Tambah daftar tugas baru',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  child: ElevatedButton(
                    child: Text('+', style: TextStyle(fontSize: 40,),),
                    onPressed: () {
                      _handleTambah(controller.text);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: tdBLue,
                      minimumSize: Size(60, 60),
                      elevation: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ) 
    );
  }

  void _handleUbah(AddItem daftar) {
    setState(() {
      daftar.done = !daftar.done;
    });
  }

  void _handleHapus(String id) {
    setState(() {
    daftarTugas.removeWhere((Text) => Text.id == id);
    });
  }

  void _handleTambah(String addItem) {
    setState(() {
      daftarTugas.add(AddItem(id: DateTime.now().millisecondsSinceEpoch.toString(),addText: addItem,));
    });
    controller.clear();
  }

  void _handleSearch(String enteredKeyword) {
    List<AddItem> result = [];
    if (enteredKeyword.isEmpty){
      result = daftarTugas;
    } else {
      result = daftarTugas
        .where((item) => item.addText!
        .toLowerCase()
        .contains(enteredKeyword.toLowerCase()))
        .toList();
    }
    setState(() {
      _search = result;
    });
  }

  void _aboutMe(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => About()));
  }

  Widget searchBox(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        onChanged: (value) => _handleSearch(value),
        decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        prefixIcon: Icon(
          Icons.search,
          color: tdBlack,
          size: 20,
        ),
        prefixIconConstraints: BoxConstraints(
        maxHeight: 20,
        minWidth: 25,
        ),
        border: InputBorder.none,
        hintText: 'Cari',
        hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }

  AppBar _buildAppBar(){
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: background,
        elevation: 0,
        centerTitle: true,
        title: Text('Notes App', style: TextStyle(color: Colors.black, fontSize: 28)),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: IconButton(
              onPressed: () {
                _aboutMe(context);
              },
              icon: Icon(
                Icons.info_outline,
                size: 30,
                color: tdBLue,
              ),
            ),
          ),
        ],
    );
  }
}

