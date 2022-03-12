import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_random_user_api/screens/user_details.dart';
import 'package:flutter_random_user_api/userModel.dart';
import 'package:flutter_random_user_api/user_bloc.dart';

// ignore: must_be_immutable
class ShowUser extends StatelessWidget {
  Welcome user;
  final elemanSayisi;

  ShowUser(this.user, this.elemanSayisi);

  @override
  Widget build(BuildContext context) {
    final userRepo = BlocProvider.of<UserBloc>(context);
    final ScrollController _scrollController = ScrollController();
    return FutureBuilder<Welcome>(
        future: userRepo.userRepo.getUser(elemanSayisi),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return Column(
              children: [
                Text(
                  "User Listesi",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70),
                ),
                GridView.count(
                  shrinkWrap: true,
                  controller: _scrollController,
                  crossAxisCount: 2,
                  children: snapshot.data.results.map((gelenUser) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UserDetails(
                                  user: gelenUser,
                                )));
                      },
                      child: Hero(
                        tag: gelenUser.id,
                        child: Card(
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: FadeInImage.assetNetwork(
                                  placeholder: "assets/loading.gif",
                                  image: gelenUser.picture.large,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Text(
                                gelenUser.name.first +
                                    " " +
                                    gelenUser.name.last,
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.88,
                        height: 50,
                        child: FlatButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          onPressed: () {
                            BlocProvider.of<UserBloc>(context).add(ResetUser());
                          },
                          color:  Color(0xff003140),
                          child: Text(
                            "Tekrar Ara",
                            style:
                                TextStyle(color: Colors.white70, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                )
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                children: <Widget>[
                  CircularProgressIndicator(
                    backgroundColor: Color(0xff003140),
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Color(0xff003140),
            ),
          );
        });
  }
}

