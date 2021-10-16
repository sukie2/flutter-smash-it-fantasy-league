import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smash_it/constants/color_constants.dart';
import 'package:smash_it/controllers/profile_controller.dart';
import 'package:smash_it/ui/auth/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileController profileController = ProfileController.to;
  // AuthController authController = AuthController.to;

  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FantasyColors.PrimaryColor,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  child: Column(children: [
                    SizedBox(
                      height: 110.0,
                    ),
                    CircleAvatar(
                      radius: 80.0,
                      backgroundImage: profileController.getProfileImage(),
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(profileController.getProfileName(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 20.0,
                        )),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'LOCAL LEGEND',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    IconButton(
                      icon: const Icon(Icons.power_settings_new),
                      tooltip: 'Logout',
                      onPressed: () async {
                        // TODO await authController.signOut();
                        Get.to(() => LoginScreen());
                      },
                    ),
                  ]),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  color: Colors.grey[200],
                  child: Center(
                      child: Card(
                          margin: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
                          child: Container(
                              width: 380.0,
                              height: 290.0,
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Information",
                                      style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey[300],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.home,
                                          color: Colors.blueAccent[400],
                                          size: 35,
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Favourite Team",
                                              style: TextStyle(
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            Text(
                                              "Sri Lanka Cricket",
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.grey[400],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.auto_awesome,
                                          color: Colors.yellowAccent[400],
                                          size: 35,
                                        ),
                                        SizedBox(
                                          width: 20.0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Sports",
                                              style: TextStyle(
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            Text(
                                              "Cricket, Badminton, Tennis",
                                              style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.grey[400],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                  ],
                                ),
                              )))),
                ),
              ),
            ],
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.45,
              left: 20.0,
              right: 20.0,
              child: Card(
                  child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        child: Column(
                      children: [
                        Text(
                          'Battles',
                          style: TextStyle(
                              color: Colors.grey[400], fontSize: 14.0),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '${profileController.getBattleCount()}',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        )
                      ],
                    )),
                    Container(
                      child: Column(children: [
                        Text(
                          'Points',
                          style: TextStyle(
                              color: Colors.grey[400], fontSize: 14.0),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '${profileController.getPoints()}',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        )
                      ]),
                    ),
                    Container(
                        child: Column(
                      children: [
                        Text(
                          'Rank',
                          style: TextStyle(
                              color: Colors.grey[400], fontSize: 14.0),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          '${profileController.getRank()}',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        )
                      ],
                    )),
                  ],
                ),
              )))
        ],
      ),
    );
  }
}
