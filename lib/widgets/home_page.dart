import 'package:flutter/material.dart';
import 'package:traval_app/colors.dart';
import 'package:traval_app/widgets/app_large_text.dart';
import 'package:traval_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// for tabbar funtion /  this is comand with TickerProviderStateMixin

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images ={
         "balloon.png": "Balloon",
         "hiking.png" : "Hiking",
         "kayaking.png": "Kayaking",
         "snorkeling.png": "Snorkeling",
  };
  @override
  Widget build(BuildContext context) {
    // tabbar views controler command
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: 
         
             SingleChildScrollView(
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tabbar on top
                  Container(
                    padding: const EdgeInsets.only(top: 50, left: 20,right: 20,),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.menu,
                          size: 30,
                          color: Colors.black54,
                        ),
                        Expanded(child: Container()),
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  // discover text
                  Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: AppLargeText(text: "Discover"),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                     
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(controller: tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                 //     indicator: circleTabIndicator(color: AppColors.mainColor,radius: 4),
                      labelPadding:const EdgeInsets.only(left: 20,right: 20,),
                      indicatorSize: TabBarIndicatorSize.label,
                         indicator: circleTabIndicator(color: AppColors.mainColor,radius: 4),
                      
                       tabs: [
                        Tab(text: "Places"),
                        Tab(text: "inspiration"),
                        
                        Tab(text: "Emotions"),
                      ]),
                    ), 
                  ),
                       
             
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      height: 300,
                      width: double.maxFinite,
                      child: TabBarView(controller: tabController, children: [
                        ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                margin: const EdgeInsets.only(right: 15, top: 10),
                                width: 200,
                                height: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: const DecorationImage(image: AssetImage("images/mountain.jpeg"),
                                    fit: BoxFit.cover,
                                  ),
                              ),
                          );
                       
                          },
                        ),
                        const Text("Inspire Me"),
                        const Text("Emotional"),
                      ]),
                    ),
             
                    const SizedBox(
                      height: 30,
                    ),
               
                 Container(
                  // row rap with conatiner
                  margin:const EdgeInsets.only(right: 20,left: 30,),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(text: "Explore more",size: 22,),
                    AppText(text: "See all",color: AppColors.textColor1,size: 16,)
                    ],
                   ),
                 ),
                 const SizedBox(
                height: 20,
                     ),
                     
                   Container(
                height:120,
                
                width: double.maxFinite,
                margin:const EdgeInsets.only(left: 20),
                child: ListView.builder(
                  itemCount: 4,
                    
                  scrollDirection: Axis.horizontal,
                  itemBuilder:((_,  index)  {
                  return Container(
                    margin: EdgeInsets.only(right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         Container(
                       //   margin: EdgeInsets.only(right: 50 ),
                             
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(image: AssetImage("images/"+images.keys.elementAt(index),),
                                
                                fit: BoxFit.cover,
                                ),
                                
                              ),
                              
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: AppText(text: images.values.elementAt(index),color: AppColors.textColor1,size: 12,),
                                ),
                                  
                       
                   
                    
                    ],
                   
                    ),
                  );
                   
                })),
                     ),
                   
                         
                ],
                     ),
             ),
          );
         
      
    
  }
}
// just for blue tik under the tabbar text
 //     indicator: circleTabIndicator(color: AppColors.mainColor,radius: 4),

class  circleTabIndicator extends Decoration{
  final Color color;
  double radius;
  circleTabIndicator({required this.color,required this.radius});
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
   return _CirclePainter(color:color,radius:radius);
  }

}
class _CirclePainter extends BoxPainter{
    final Color color;
  double radius;
  
  _CirclePainter({required this.color,required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color=color;
    _paint.isAntiAlias=true;
    final Offset circleoffset = Offset(configuration.size!.width/2 -radius/2,configuration.size!.height-radius);

    canvas.drawCircle(offset+circleoffset, radius, _paint);
    
  }
  
}