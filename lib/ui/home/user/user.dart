import 'package:flutter/material.dart';
import 'package:flutterapplearntowrite/routes/app_routes.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.0, left: 20,bottom: 20.0),
          child: Image.asset(
            "images/lake.jpg",
            width: 100,
            height: 100,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Divider(
            color: Colors.grey,
            height: 1,
          ),
        ),
        Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _getLabel(3, "inherit",(){
              Navigator.pushNamed(context, countPageRoute.routeName);

            }),
            _getLabel(1, "Followers",(){
              Fluttertoast.showToast(msg: "Followers");
            }),
            _getLabel(5, "Following",(){
              Fluttertoast.showToast(msg: "Following");
            }),
          ],
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom:8.0),
              child: SizedBox(
                width: 291,
                height: 50,
                child: FlatButton(
                  child: Text(
                    "logout",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  shape: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey,width: 0.5)
                  ),
                  onPressed: (){
                    Fluttertoast.showToast(msg: "logout");
                  },
                  highlightColor: Colors.grey[300],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _getLabel(int count, String label, GestureTapCallback tapCallback) {
    return GestureDetector(
      child: SizedBox(
        width: 100,
        child: Container(
          color: count == 1 ? Colors.blue : Colors.yellow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                count.toString(),
                style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold),
              ),
              Text(
                label,
                style: TextStyle(fontSize: 16, color: Colors.grey,fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      onTap: tapCallback,
    );
  }
}
