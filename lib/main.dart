import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sample App',
      theme: ThemeData(
        primaryColor: Color(0xFF5337ff),
      ),
      home: PersonWidget(),
    );
  }
}
class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}
 class _FavoriteWidgetState extends State<FavoriteWidget> {
   bool _isFavoruite= false;
   int _favoruiteCount =127;
  @override
  Widget build(BuildContext context) {
    return Row(
      children:<Widget> [
        Container(
          child: IconButton(
            icon: ( _isFavoruite ? Icon(Icons.favorite):Icon(Icons.favorite_border)  ),
            onPressed:_toggleFavoriute,
            color: Colors.red[800],
          ),
        ),
        Container(
          child:Text('${_favoruiteCount}') ,
        )
      ],
    );
  }
  void _toggleFavoriute(){
    setState(() {
      if(_isFavoruite){
        _isFavoruite = false;
      _favoruiteCount -= 1;}
    else {
        _isFavoruite = true;
        _favoruiteCount += 1;
      }
    });
}
}

class PersonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // shadowColor: Colors.black38,
        // foregroundColor: Color(0xFF5337ff),
        backgroundColor: Colors.transparent,
        title: Text('Awangers Heros'),
        actions: [
          IconButton(
            icon:Icon(Icons.arrow_forward_ios),
            onPressed:(){},
            tooltip: "Show snakbar",),
          IconButton(
            icon:Icon(Icons.add_alert_outlined),
            onPressed:(){},
            tooltip: "Show snakbar",),
          PopupMenuButton<String> (
            onSelected:(value)
            {switch(value) {case 'Logout':break;  case 'Settings': break;}},
            itemBuilder: (context) {
              return{'Logout','Setting'}.map((String choice){
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();},
          )
        ],
      ),
        body:
            Container(
              child: _buildMainColumn(),
            ),
    );
  }

  Widget _buildMainColumn() => ListView(
        children: [
          _buildTopImages(),
          Container(
            padding: const EdgeInsets.only(),
            child: Column(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.all(10.0),
                    child: _buildRacting(),
                ),
                Card(
                  margin: EdgeInsets.all(10.0),
                  elevation: 5,
                  child:
                  Container(
                      padding: EdgeInsets.all(10.0),
                      child: _buildAction(),
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(10.0),
                    child: _information(),
                ),
              ],
            ),
          )
        ],
      );
  Widget _buildTopImages() => Container(
        child: Card(
          elevation: 5,
          margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 1.0),
          child: Image.asset('images/ironmen.jpg',),
        ),
      );
  Widget _buildRacting() => ListTile(
        title: Text('Awangers',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),),
        subtitle: Text('Thor,Captian America,Iron Men'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FavoriteWidget(),
          ],
        ),);
  Widget _buildAction() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildButton('Blocking', Icons.star, Colors.black,Colors.yellow[700]),
          _buildButton('For adults over 16 years old', Icons.radio_button_checked_rounded, Colors.black,Colors.blue[700]),
          _buildButton('More', Icons.more_horiz, Colors.black,Colors.black),
        ],
      );
  Widget _buildButton(String string, IconData iconi, Color color,Color colori) => Column(
        children: <Widget>[
          Icon(iconi, color: colori),
          Container(
            child: Text(string,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: color,),
            ),
          ),
        ],
      );
  Widget _information() => Text(
          'The Avengers are a fictional team of superheroes appearing in American comic books published by Marvel Comics. '
              'The team made its debut in The Avengers #1 (cover-dated Sept. 1963), created by writer-editor Stan Lee and artist/co-plotter Jack Kirby.'
              ' Labeled Earths Mightiest heros, the Avengers originally consisted of Iron Man, the Wasp, the Hulk, Thor, and Ant-Man. '
              'The original Captain America was discovered trapped in ice in issue #4, and joined the group after they revived him.',
    softWrap: true,
      );
}