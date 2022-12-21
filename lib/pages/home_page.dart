import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isVisible=false;
  List<String> player_name =[];
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Visibility(
              visible: _isVisible,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: displayNameList(context),
              ),
            ),
            Spacer(),
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: Center(
                      child: Form(
                        key: _formKey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            textFormFields(),
                            SizedBox(
                              width: 20,
                            ),
                            addButton(_nameController.text)
                          ],
                        ),
                      ),
                    ),
                  ),
                  letsPlay()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  displayNameList(BuildContext context) {

    return Container(
       height: 250,
      child: ListView.builder(
          itemCount: player_name.length,
          itemBuilder: (context,index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.orange,
              ),
              margin: EdgeInsets.all(2),
              padding: EdgeInsets.symmetric(horizontal: 30),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(player_name[index]),
                  //Spacer(),
                  Container(
                    //width: MediaQuery.of(context).size.width/2,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          player_name.removeAt(index);
                        });
                      },
                      child: Container(
                        child: Icon(
                          Icons.delete,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );

          }
      ),
    );
  }



  //  displayNameList(BuildContext context) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(4.0),
  //       color: Colors.orange,
  //     ),
  //     width: MediaQuery.of(context).size.width,
  //     height: 40,
  //     child: ListView.builder(
  //       itemCount: player_name.length,
  //       itemBuilder: (context,index) {
  //         return Container(
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Text(player_name[index]),
  //               //Spacer(),
  //               Container(
  //                 //width: MediaQuery.of(context).size.width/2,
  //                 child: InkWell(
  //                   onTap: () {},
  //                   child: Container(
  //                     child: Icon(
  //                       Icons.delete,
  //                       color: Colors.grey.shade600,
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         );
  //       }
  //     ),
  //   );
  // }

  Widget textFormFields() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.4,
      height: 40,
      child: TextField(
        keyboardType: TextInputType.visiblePassword,
        controller: _nameController,
        style: TextStyle(color: Theme.of(context).indicatorColor),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15, 5, 0, 5),
          border: InputBorder.none,
          hintText: 'Add Player Name',
          hintStyle: TextStyle(
              fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide:
                BorderSide(width: 1, color: Theme.of(context).hintColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              width: 0.1,
              color: Theme.of(context).hintColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget addButton(name) {
    return Container(
      //width: MediaQuery.of(context).size.width/2,
      child: InkWell(
        onTap: () {
          setState(() {
            _isVisible =true;
          });
          //addItemToList(name);
          player_name.add(_nameController.text);
          _nameController.clear();
          displayNameList(context);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
              border: Border.all(width: 2)),
          child: Icon(
            Icons.add_circle,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget letsPlay() {
    // print("index  lets play : "+player_name.length.toString());
    // var errorCheck=player_name.length.toString();
    return Container(
      child: ElevatedButton(
          onPressed: () {
            if(player_name.length>=2){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content: Text("You are enable for playing games",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: Colors.white),
                  )),);

            }else{
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Text("You are Not enable for playing games",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: Colors.white),
                  )),);
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.orange),
          ),
          child: Text("LET`S PLAY")),
    );
  }
}
