import 'package:flutter/material.dart';

void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Swip to Delete",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 final List<String> items=new List<String> .generate(30, (i)=>"items ${i+1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swipe To delete"),
      ),

      body:ListView.builder(

        itemBuilder: (context ,int index){

        //  final item=items.[index];
          return Dismissible(
            key:Key(items[index]),
                onDismissed: (direction){
              items.removeAt(index);
            Scaffold.of(context).showSnackBar(new SnackBar(
              content: Text("Item Dismiss"),
            ));
          },

            child: ListTile(
              title: Text("${items[index]}"),
            ),

          );
        },
        itemCount: items.length,
      )


    );
  }
}

