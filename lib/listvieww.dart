import 'package:flutter/material.dart';
import 'package:listvieww/name.dart';

class list_view extends StatefulWidget {
  list_view({Key? key}) : super(key: key);

  @override
  State<list_view> createState() => _list_viewState();
}

Widget avatar(int index) {
  return CircleAvatar(
    radius: 24,
    child: Text(
      data[index].absen ,
      style: TextStyle(color: Colors.white),
    ),
  );
}

Widget textData(int index) {
  return Expanded(
      child: Container(
    margin: EdgeInsets.only(left: 12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          data[index].name,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        Container(
          margin: EdgeInsets.only(top: 2),
          child: Text(data[index].hobi),
        ),
      ],
    ),
  ));
}

class _list_viewState extends State<list_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Siswa PPLG 1 Kelas 11"),
      // ),
      body: ListView.builder(
        padding: EdgeInsets.all(5),
        itemCount: data.length,
        itemBuilder: (buildContext, index) {
          return GestureDetector(
            onTap: () => showDialog(context: context, builder: (BuildContext context)=> AlertDialog(
              title: Text("Hapus Kontak"),
              content: Text("Anda yakin ingin menghapus kontak ${data[index].name}?"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Ya"),
                  onPressed: (){
                    setState(() {
                      data.removeAt(index);
                    });
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("Tidak"),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ],
            )),
            
            child: Container(
              margin: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  avatar(index),
                  textData(index),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}