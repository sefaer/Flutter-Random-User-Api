import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_random_user_api/screens/show_user.dart';
import 'package:flutter_random_user_api/user_bloc.dart';

class SearchPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    final _formKey = GlobalKey<FormState>();
    TextEditingController _userController = TextEditingController();

    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: 180,
                  width: 300,
                  child: Icon(Icons.verified_user,size:200),
                ),
              )),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserIsNotSearched)
                return Container(
                  padding: EdgeInsets.only(
                    left: 32,
                    right: 32,
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 70,),
                      Text(
                        "Random User",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            color: Colors.white70),
                      ),
                      Text(
                        "Listele",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w200,
                            color: Colors.white70),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Form(
                        key: _formKey,
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                          ],
                          validator: (value) {
                            if (value.isEmpty ||
                                value == "0" ||
                                value == "00" ||
                                value == "1" ||
                                int.parse(value) > 500) {
                              return "Lütfen 1 ile 500 arası adet giriniz..";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          controller: _userController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white70,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    color: Colors.white70,
                                    style: BorderStyle.solid)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    style: BorderStyle.solid)),
                            hintText: "Listelenecek user sayısını giriniz..",
                            hintStyle: TextStyle(color: Colors.white70),
                          ),
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: FlatButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text('Kullanıcılar Listeleniyor..'),
                                duration: Duration(milliseconds: 300),
                                backgroundColor: Color(0xff003140),
                              ));
                              userBloc.add(FetchUser(_userController?.text));
                            }
                          },
                          color:  Color(0xff003140),
                          child: Text(
                            "Random User Listele",
                            style:
                            TextStyle(color: Colors.white70, fontSize: 16),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              else if (state is UserIsLoading)
                return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Color(0xff003140),
                    ));
              else if (state is UserIsLoaded)
                return ShowUser(state.getUser,_userController.text);
              else
                return Container(
                  padding: EdgeInsets.only(
                    left: 32,
                    right: 32,
                  ),
                  child: Column(
                    children: <Widget>[
                      Center(
                          child: Text(
                            "Random User",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w500,
                                color: Colors.white70),
                          )),
                      Center(
                          child: Text(
                            "Listele",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w200,
                                color: Colors.white70),
                          )),
                      SizedBox(
                        height: 24,
                      ),
                      Form(
                        key: _formKey,
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                          ],
                          validator: (value) {
                            if (value.isEmpty ||
                                value == "0" ||
                                value == "00" ||
                                value == "1" ||
                                int.parse(value) > 500) {
                              return "Lütfen 1 ile 500 arası adet giriniz..";
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          controller: _userController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white70,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    color: Colors.white70,
                                    style: BorderStyle.solid)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    style: BorderStyle.solid)),
                            hintText: "Listelenecek user sayısını giriniz..",
                            hintStyle: TextStyle(color: Colors.white70),
                          ),
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: FlatButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Kullanıcılar Listeleniyor..'),
                                  duration: Duration(milliseconds: 300),
                                  backgroundColor: Color(0xff003140),
                                ),
                              );

                              userBloc.add(FetchUser(_userController?.text));
                            }
                          },
                          color:  Color(0xff003140),
                          child: Text(
                            "Random User Listele",
                            style:
                            TextStyle(color: Colors.white70, fontSize: 16),
                          ),
                        ),
                      )
                    ],
                  ),
                );
            },
          )
        ],
      ),
    );
  }
}
