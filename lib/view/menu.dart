import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_cook/service/auth_service.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
            future: getMyInfo(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 34),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 42,
                        width: 350,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFA9A0C),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: const Text(
                            'Add Meal',
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 800,
                        width: 350,
                        child: ListView.builder(
                          // scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.meals.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                top: 18,
                              ),
                              child: SizedBox(
                                width: 350,
                                height: 150,
                                // color: Colors.red,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 16, right: 16),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 80,
                                        height: 80,
                                        child: ListView.builder(
                                          // scrollDirection: Axis.horizontal,
                                          itemCount: snapshot
                                              .data!.meals[index].images.length,
                                          itemBuilder: (context, imageIndex) {
                                            return Image.network(
                                              snapshot.data!.meals[index]
                                                  .images[imageIndex],
                                              width: 80,
                                              height: 80,
                                            );
                                          },
                                        ),
                                      ),
                                      //   decoration: BoxDecoration(
                                      //     borderRadius: BorderRadius.circular(8),
                                      //     image: DecorationImage(image: NetworkImage(snapshot.data!.meals[index].images[0]))
                                      //   ),
                                      // ),
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data!.meals[index].name,
                                            style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            snapshot.data!.meals[index].category,
                                            style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFFC4C4C4),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                snapshot.data!.meals[index].price
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFFC4C4C4),
                                                ),
                                              ),
                                              const Text(
                                                ' LE',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFFC4C4C4),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 100,
                                      ),
                                      Image.asset(
                                        'images/image 46.png',
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                );
              } else
                return  Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
