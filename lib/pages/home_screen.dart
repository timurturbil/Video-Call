import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:videocall/pages/authenticate/onboarding_screen.dart';
import 'package:videocall/pages/callscreens/pickupscreen/pickup_layout.dart';
import 'package:videocall/provider/user_provider.dart';
import 'package:videocall/service/firebase_methods.dart';
import 'package:videocall/utils/style/colors.dart';
import 'package:videocall/utils/universal_variables.dart';
import 'package:videocall/widgets/customtile.dart';
import 'package:videocall/service/auth.dart';
import 'package:videocall/model/store_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AuthServices _auth = AuthServices();
  final FirebaseAuth _authInstance = FirebaseAuth.instance;
  List<Userlar> userList = [];
  UserProvider userProvider;
  final myController = TextEditingController();
  String name;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  var snapshots;
  bool isTyping = false;
  TextEditingController userNameController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
    FirebaseMethods().updateLiveStatus(_authInstance.currentUser.uid, true);
    userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.refreshUser();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    AuthServices().signOut(_authInstance.currentUser.uid);
  }

  void fetchUsers() {
    _auth.getCurrentUser().then((User user) {
      _auth.fetchAllUsers(user).then((List<Userlar> list) {
        setState(() {
          userList = list;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PickupLayout(
      scaffold: Scaffold(
        backgroundColor: greyBackground,
        appBar: appBarMethod(context),
        body: RefreshIndicator(
          onRefresh: () async {
            fetchUsers();
          },
          child: Container(
            padding: EdgeInsets.all(10),
            child: ListView.separated(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                if (userList[index].name == null) return Container();
                if (userNameController.text.isNotEmpty) {
                  if (userList[index]
                      .name
                      .toLowerCase()
                      .contains(userNameController.text.toLowerCase())) {
                    return customTileMethod(index);
                  } else {
                    return Container();
                  }
                } else {
                  return customTileMethod(index);
                }
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                    color: blackColor, indent: 10, endIndent: 10, height: 0);
              },
            ),
          ),
        ),
      ),
    );
  }

  CustomTile customTileMethod(int index) {
    return CustomTile(
      receiver: userList[index],
      title: Text(
        "${userList[index].name}",
        style: TextStyle(color: Colors.black, fontSize: 18),
      ),
      leading: Container(
        constraints: BoxConstraints(maxHeight: 60, maxWidth: 60),
        child: Stack(
          children: <Widget>[
            CircleAvatar(
              maxRadius: 30,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage("${userList[index].profilePhoto}"),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 13,
                width: 13,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: userList[index].isLive
                        ? UniversalVariables.onlineDotColor
                        : UniversalVariables.greyColor,
                    border: Border.all(
                        color: UniversalVariables.blackColor, width: 2)),
              ),
            )
          ],
        ),
      ),
      subtitle: Text(
        userList[index].username.substring(5, userList[index].username.length),
        style: TextStyle(color: UniversalVariables.greyColor),
      ),
    );
  }

  AppBar appBarMethod(BuildContext context) {
    return AppBar(
      backgroundColor: whiteColor,
      leadingWidth: 0,
      leading: Container(),
      title: isTyping
          ? Row(
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        userNameController.clear();
                        isTyping = false;
                      });
                    },
                    icon: Icon(Icons.cancel, color: Colors.black)),
                Expanded(
                  child: TextField(
                    controller: userNameController,
                    onChanged: (_) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Username',
                    ),
                  ),
                ),
              ],
            )
          : ElevatedButton(
              onPressed: () {
                _auth.signOut(userProvider.getUser.uid);
                Get.to(() => OnboardingPage());
              },
              style:
                  ElevatedButton.styleFrom(
                    primary: whiteColor, 
                    elevation: 0.0,
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),),
              child: Text("Sign Out",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
            ),

      // GestureDetector(
      //     onTap: () {
      //       _auth.signOut(userProvider.getUser.uid);
      //       Get.to(() => OnboardingPage());
      //     },
      //     child: Container(
      //       width: 70,
      //       height: 50,
      //       alignment: Alignment.center,
      //       // color: Colors.red,
      //       child: Text("Sign Out",
      //           style: TextStyle(
      //               color: Colors.black,
      //               fontSize: 14,
      //               fontWeight: FontWeight.w500)),
      //     )),
      actions: <Widget>[
        GestureDetector(
          onTap: () {
            setState(() {
              isTyping = true;
            });
          },
          child: Container(
              alignment: Alignment.center,
              child: Text("Search",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500))),
        ),
        IconButton(
            tooltip: "Search",
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                isTyping = true;
              });
            })
      ],
    );
  }
}
