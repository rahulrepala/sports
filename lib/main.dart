import 'package:esentially_sports/models/user_model.dart';
import 'package:esentially_sports/screens/story_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Esentially Sports',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Esentially Sports'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<UserModel> users=[
       UserModel('user1','assets/images/0.jpeg',),
       UserModel('user2','assets/images/1.jpeg',),
       UserModel('user3','assets/images/2.jpeg',),
       UserModel('user4','assets/images/3.jpeg',),
       UserModel('user1','assets/images/0.jpeg',),
       UserModel('user2','assets/images/1.jpeg',),
       UserModel('user3','assets/images/2.jpeg',),
       UserModel('user4','assets/images/3.jpeg',),
    ];  

   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Esentially Sports',
      ),),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
           child: Column(
             children: [
               Container(
                 height: 120,
                 child: ListView.builder(
                   itemCount: 8,
                   scrollDirection: Axis.horizontal,
                   itemBuilder: (context,index){
                     return Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: GestureDetector(
                         onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>StoryView()));
                         },
                         child: Container(
                           child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundImage:AssetImage(users[index].userImg,)
                                  ),
                                Text(users[index].userName)
                              ],
                           ),
                         ),
                       ),
                     );
                   }),
               )
             ],
           ),
          )
        )
    );
  }
}
