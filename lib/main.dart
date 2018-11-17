import 'package:flutter/material.dart';
import 'package:sqlite/model/user.dart';
import 'package:sqlite/utils/database_helper.dart';


List myUsers ;
void main() async {


  var db = new DatabaseHelper();
  int userSaved = await db.saveUser(
      new User('Saad' ,'123456' , 'Babil' , 33 ) );
  print("saved user : $userSaved");
//

  int sumUsers = await db.getCount();
  print('Total: $sumUsers');

  User muhammed = await db.getUser(2);
  print('username : ${muhammed.username}');
  print('Age : ${muhammed.age}');
  print('------------------------ ');
  print('------------------------ ');


//int deleteUser = await db.deleteUser(5);
//  print('deleteUser : ${deleteUser}');

  User muhammed2 =  User.fromMap({
  "username" :  'Muhammed' ,
   "password" :  '123456' ,
   "city" :  'Erbil' ,
    "age" :  55,
   "id" :  2
  });

  await db.updateUser(muhammed2);
  print('------------------------ ');
  print('------------------------ ');

  myUsers = await db.getAllUsers();
for(int i =0 ; i < myUsers.length;i++){
  User user = User.map(myUsers[i]);
  print('ID: ${user.id} - username: ${user.username} - city: ${user.age}');

}

        runApp(new MaterialApp(
              home: new Home(),
              title: 'Muhammed Essa SqLite',
          ));
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: AppBar(
       title: new Text('SQLITE'),
       backgroundColor: Colors.blueAccent,
     ),

     body: new ListView.builder(

       itemCount: myUsers.length,
         itemBuilder: ( _ ,int  position ){
         return new Card(

           child: new ListTile(
             leading: new Icon(Icons.person,color: Colors.white,size: 33.0),
             title: new Text('${User.fromMap(myUsers[position]).username}'),
             subtitle: new Text('${User.fromMap(myUsers[position]).city}'),
             onTap: () => debugPrint('${User.fromMap(myUsers[position]).age}'),
           ),
           color: Colors.amber,
           elevation: 3.0,
           
         );

         }),
   );
  }

}