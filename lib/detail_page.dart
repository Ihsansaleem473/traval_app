import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:traval_app/colors.dart';
import 'package:traval_app/main._page.dart';
import 'package:traval_app/welcome_page.dart';
import 'package:traval_app/widgets/app_button.dart';
import 'package:traval_app/widgets/app_large_text.dart';
import 'package:traval_app/widgets/app_text.dart';
import 'package:traval_app/widgets/home_page.dart';
import 'package:traval_app/widgets/responsive_button.dart';
import 'package:traval_app/widgets/search_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // stars condition
  int gottenstars = 4;
  int selectedindex = -1;

  @override
  Widget build(BuildContext context) {
    bool isresponsive;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/mountain.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 50,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WelcomePage()),
                        );
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 320,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                            text: "Yosemite",
                            color: Colors.black.withOpacity(0.8),
                          ),
                          AppLargeText(
                            text: "\$250",
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.mainColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          AppText(
                            text: "USA, Califorina",
                            color: AppColors.textColor1,
                            size: 14,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              // star conditions
                              return Icon(
                                Icons.star,
                                color: index < gottenstars
                                    ? AppColors.starColor
                                    : AppColors.textColor2,
                              );
                            }),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          AppText(
                            text: "(4.0)",
                            color: AppColors.textColor2,
                            size: 14,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppLargeText(
                        text: "People",
                        color: Colors.black.withOpacity(0.8),
                        size: 25,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AppText(
                        text: "Number of people in your group",
                        color: AppColors.mainTextColor,
                        size: 16,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: List.generate(
                          5,
                          (index) {
                            return InkWell(
                              onTap: () {
                                // thats for change the buttons colors in ontop
                                setState(() {
                                  selectedindex = index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: AppButtons(
                                  color: selectedindex == index
                                      ? Colors.white
                                      : Colors.black,
                                  size: 50,
                                  backgroundColor: selectedindex == index
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                  borderColor: selectedindex == index
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                  text: (index + 1).toString(),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      AppLargeText(
                        text: "Description",
                        color: Colors.black.withOpacity(0.8),
                        size: 22,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      AppText(
                        text:
                            "You must go for a traval.traveling helps get rid of pressure.go to mountains to see the nature",
                        size: 20,
                        color: AppColors.mainTextColor,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        right: 20,
                        child: Row(
                          children: [
                            
                          
                    
                           AppButtons(
                              size: 60,
                              color: AppColors.textColor1,
                              backgroundColor: Colors.white,
                              borderColor: AppColors.textColor1,
                              isIcon: true,
                              icon: Icons.favorite_border,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                         //if we try true to show or image otherwise show just icons pic
                           ResponsiveButton(
                             isResponsive: true,
                          //isResponsive: false,
                              
                           ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
