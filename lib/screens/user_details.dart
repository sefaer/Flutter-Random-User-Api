import 'package:flutter/material.dart';
import 'package:flutter_random_user_api/userModel.dart';

// ignore: must_be_immutable
class UserDetails extends StatefulWidget {
  Result user;

  UserDetails({this.user});

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigo,
        title: Text(
          widget.user.name.title + " " + widget.user.name.first,
          textAlign: TextAlign.center,
        ),
      ),
      body: UserDetailBody(context),
    );
  }

  Widget UserDetailBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          height: MediaQuery.of(context).size.height * (7 / 10),
          width: MediaQuery.of(context).size.width - 18,
          left: 10,
          top: MediaQuery.of(context).size.height * 0.1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            elevation: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        widget.user.name.first + " " + widget.user.name.last,
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.supervised_user_circle,
                      size: 30,
                    ),
                    Text(
                      widget.user.login.username,
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.phone,
                          size: 40,
                        ),
                        Text(
                          widget.user.phone.toString(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.email,
                          size: 40,
                        ),
                        Text(
                          widget.user.email.toString(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          size: 40,
                        ),
                        Text(
                          widget.user.gender.toString(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 40,
                        ),
                        Text(
                          widget.user.location.country +
                              "/" +
                              widget.user.location.city +
                              "/" +
                              widget.user.location.postcode.toString(),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),

/*                  Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: widget.pokemon.type
                          .map((tip) => Chip(
                          backgroundColor: Colors.deepOrange.shade300,
                          label: Text(
                            tip,
                            style: TextStyle(color: Colors.white),
                          )))
                          .toList()),
                ),
                Text(
                  "Pre Evolution : ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
*/
                /*      Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: widget.pokemon.prevEvolution != null
                          ? widget.pokemon.prevEvolution
                          .map((preevolution) => Chip(
                          backgroundColor: Colors.deepOrange.shade300,
                          label: Text(
                            preevolution.name,
                            style: TextStyle(color: Colors.white),
                          )))
                          .toList()
                          : [Text("First evolution")]),
                ),
                Text(
                  "Next Evolution : ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),*/
                /*     Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: widget.pokemon.nextEvolution != null
                          ? widget.pokemon.nextEvolution
                          .map((evolution) => Chip(
                          backgroundColor: Colors.deepOrange.shade300,
                          label: Text(
                            evolution.name,
                            style: TextStyle(color: Colors.white),
                          )))
                          .toList()
                          : [Text("End evolution")]),
                ),
                Text(
                  "Weakness : ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),*/
                /*Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: widget.pokemon.weaknesses != null
                          ? widget.pokemon.weaknesses
                          .map((weakness) => Chip(
                          backgroundColor: Colors.deepOrange.shade300,
                          label: Text(
                            weakness,
                            style: TextStyle(color: Colors.white,fontSize: 12),
                          )))
                          .toList()
                          : [Text("No weakness")]),
                ),*/
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: widget.user.id,
            child: Container(
              width: 150,
              height: 150,
              child: Image.network(
                widget.user.picture.large,
                fit: BoxFit.contain,
              ),
            ),
          ),
        )
      ],
    );
  }
}
