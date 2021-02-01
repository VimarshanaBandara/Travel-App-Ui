import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app_ui/models/beach_model.dart';
import 'package:travel_app_ui/models/popular_model.dart';
import 'package:travel_app_ui/models/recommended_model.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _pageController = PageController(viewportFraction: 0.877);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // bottomNavigationBar:BottomNavigationBarApp() ,
      body: SafeArea(
        child: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              // Top App Bar
              Container(
                height: 57.0,
                margin: EdgeInsets.only(top: 28.0 , left: 28.0 , right: 28.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 57.0,
                      width: 57.0,
                      //padding: EdgeInsets.all(18.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.0),
                        color: Color(0x080a0928),
                      ),
                      child: Center(
                        child: IconButton(
                          icon: Icon(Icons.reorder),
                          //onPressed: (){},
                        ),
                      )
                    ),

                    Container(
                        height: 57.0,
                        width: 57.0,
                        //padding: EdgeInsets.all(18.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9.0),
                          color: Color(0x080a0928),
                        ),
                        child: Center(
                          child: IconButton(
                            icon: Icon(Icons.search),
                            //onPressed: (){},
                          ),
                        )
                    )

                  ],
                ),
              ),

              //Heading Text
              Padding(
                padding: EdgeInsets.only(top: 48.0 , left: 28.0),
                child: Text('Explore\nthe Nature',style: GoogleFonts.playfairDisplay(fontSize: 45.0 , fontWeight:FontWeight.w700 ),),
              ),

              //Indicator Scoral Tab Bar
              Container(
                height: 30.0,
                margin: EdgeInsets.only(left: 14.0 , top: 28.0),
                child: DefaultTabController(
                  length: 4,
                  child: TabBar(
                    labelPadding: EdgeInsets.only(left: 14.0 , right: 14.0),
                    indicatorPadding: EdgeInsets.only(left: 14.0 , right: 14.0) ,
                    isScrollable: true,
                    labelColor: Color(0xFF000000),
                    unselectedLabelColor: Color(0xFF8a8a8a),
                    labelStyle: GoogleFonts.lato(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                    ),
                    unselectedLabelStyle: GoogleFonts.lato(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700,
                    ),
                    indicatorColor: Colors.blue,
                    indicatorWeight: 4.0,

                    tabs: [
                      Tab(
                        child: Text('Recommended'),
                      ),
                      Tab(
                        child: Text('Popular'),
                      ),
                      Tab(
                        child: Text('New Destination'),
                      ),
                      Tab(
                        child: Text('Hidden Gems'),
                      ),

                    ],
                  ),
                ),
              ),

              //Recommended Image Scorel
              Container(
                height: 218.0,
                margin: EdgeInsets.only(top: 16.0),
                child: PageView(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                      recommendations.length, (index) =>Container(
                    margin: EdgeInsets.only(right: 28.0),
                    width: 333.0,
                    height: 218.0,
                    decoration: BoxDecoration(
                      //color: Colors.red,
                      borderRadius: BorderRadius.circular(9.0),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(recommendations[index].image,),

                      ),

                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 19.0,
                            left: 19.0,
                            child:ClipRRect(
                              borderRadius: BorderRadius.circular(4.8),
                              child: BackdropFilter(
                               filter: ImageFilter.blur(
                                 sigmaX: 19.2,
                                 sigmaY: 19.2,
                               ),
                                child: Container(
                                  height: 36.0,
                                  padding: EdgeInsets.only(left: 16.0 , right: 14.0),
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_on_outlined),
                                      SizedBox(width: 9.0,),
                                      Text(recommendations[index].name,
                                      style: GoogleFonts.lato(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white70,
                                        fontSize: 16.0
                                      ),
                                      )
                                    ],
                                  ),
                                ),
                              ),

                            )
                        ),
                      ],
                    ),

                  )),
                ),
              ),

              //Image dot Indicator
              Padding(
                padding: EdgeInsets.only(top: 28.0 , left: 28.0),
                child: SmoothPageIndicator(controller: _pageController,
                    count: recommendations.length,
                  effect:ExpandingDotsEffect(
                    activeDotColor: Color(0xFF8a8a8a),
                    dotColor: Color(0xFFababab,),
                    dotHeight: 4.8,
                    dotWidth: 6,
                    spacing: 4.8,
                  ),
                ),
              ),


             Padding(
              padding: EdgeInsets.only(top: 48.0 , left: 28.0 , right: 28.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     Text('Popular Category',style:GoogleFonts.playfairDisplay(
                       fontSize: 28.0,
                       fontWeight: FontWeight.w700,
                       color: Color(0xFF000000)
                     ),),

                    Text('Show All',style:GoogleFonts.lato(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF8a8a8a)
                    ),)
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 33.0),
                height: 45.0,
                child: ListView.builder(
                  itemCount: populars.length,
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(left: 28.0 , right: 9.0),
                  itemBuilder: (context ,index){
                    return Container(
                      margin: EdgeInsets.only(right: 19.0),
                      height: 45.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        color: Color(populars[index].color)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: 19.2,),
                          Image.asset(populars[index].image,height: 16.8,),
                          SizedBox(width: 19.2,),
                        ],
                      ),
                    );
                  },
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 28.0 , bottom: 16.8),
                height: 124.0,
                child: ListView.builder(
                  itemCount: beaches.length,
                  padding: EdgeInsets.only(left: 28.0 , right: 12.0),
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context , index){
                    return Container(
                      height: 124.8,
                      width: 188.4,
                      margin: EdgeInsets.only(right: 16.8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        image: DecorationImage(

                          image:NetworkImage(beaches[index].image),
                          fit: BoxFit.cover
                        )
                      ),
                    );
                  },

                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
