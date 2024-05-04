import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_10/app/components/my_button.dart';
import 'package:mini_project_10/app/components/my_list_image.dart';
import 'package:mini_project_10/app/data/flower.dart';
import 'package:mini_project_10/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg-login-regis.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              future: controller.getUserProfile(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData) {
                  Map<String, dynamic>? user = snapshot.data!.data();
                  return Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 64.0,
                            right: 30.0,
                            left: 30.0,
                            bottom: 10.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      child: Text(
                                        "Hello ${user!['username']}",
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      child: Text(
                                        'How\'s your day going?',
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(
                                Icons.account_circle_rounded,
                                size: 50,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.0),
                        child: Divider(),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 20.0,
                            right: 30.0,
                            left: 30.0,
                            bottom: 10.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      child: Text(
                                        'My Phone Number : ${user['number']}',
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      child: Text(
                                        'My Address : ${user['addres']}',
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Text('Has no data');
                }
              },
            ),

            //List For Image
            StreamBuilder<List<Flower>>(
              stream: controller.getFlower(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Error"),
                  );
                }
                if (snapshot.hasData) {
                  return Container(
                    alignment: Alignment.topLeft,
                    child: GridView.builder(
                      itemCount: snapshot.data?.length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (context, index) {
                        return MyListImage(
                          flowerName: "${snapshot.data?[index].flowerName}",
                          flowerImage: "${snapshot.data?[index].flowerImages}",
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: Text('Has No Data'),
                  );
                }
              },
            ),
            Expanded(
              child: Center(
                child: MyButton(
                  text: 'Upload Foto',
                  onTap: () {
                    Get.toNamed(Routes.ADD_IMAGE);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.signUserOut();
        },
        child: const Icon(Icons.logout),
      ),
    );
  }
}
