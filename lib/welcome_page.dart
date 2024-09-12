import 'package:flutter/material.dart';
import 'package:traval_app/colors.dart';
import 'package:traval_app/widgets/app_large_text.dart';
import 'package:traval_app/widgets/app_text.dart';

import 'package:traval_app/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  // We have to define the images here!

  List images = [
    "images/welcome-one.png",
    "images/welcome-two.png",
    "images/welcome-three.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            // Keeps track of index
            return Container(
              width: double.maxFinite, // Max. width of display
              height: double.maxFinite, // Max. height of display
              decoration: BoxDecoration(
                // We need decoration to add background image
                image: DecorationImage(
                  image: AssetImage(images[index]),
                  fit: BoxFit.cover,
                ),
              ),
              margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Row(
                
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: "Trips"),
                      AppText(
                        text: "Mountains",
                        size: 30,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 250,
                        child: AppText(
                          text:
                              "Mountain hikes to give you an incredible sense of freedom along with an endurance test.",
                          color: AppColors.textColor2,
                          size: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                   
                    ],
                  ),

    Column(
      
      children:List.generate(3, (indexdots){
        return Container(
          margin: EdgeInsets.only(bottom: 2),
          width:8,
          height :index == indexdots ? 25:8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color:index==indexdots? AppColors.mainColor:AppColors.mainColor.withOpacity(0.3),
            ),
          
        

        );

      } ,
    ),
  
    ),
                ],
              ),
            );
          }),
    );
  }
}
