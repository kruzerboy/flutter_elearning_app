
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_elearning_app/widgets/course_slider.dart';
import 'package:flutter_elearning_app/widgets/header_text_field.dart';
import 'package:flutter_elearning_app/data/categorydata.dart';
import 'package:flutter_elearning_app/widgets/category_icon.dart';

import 'package:iconly/iconly.dart';

import '../../widgets/tag.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar(),
      body: ListView(
     children: [  Column(
       children: [
         Container(width: double.infinity,
         decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft:Radius.circular(15) ,
            topRight: Radius.circular(15),
          ),
             
         ),
         child:  Padding(padding: 
         EdgeInsets.all(8),
         child: Column(
           children: [
               searchBox(),
               HeaderTextField(title:'Categories'),
               SizedBox(height: 10,),
               categorySlider(),
               HeaderTextField(title:'Courses for you',child: Tag(title: 'new topics added'),),
              CourseSlider(),
              HeaderTextField(title: 'Trending Courses',child: Tag(title: 'new'),),
              CourseSlider(),
        
           ],
         ),
         
         
         ),
    
          
             
             ),
             
       ],
     )] 
      ),
    
    );
  }

  Container categorySlider() {
    return Container(
              height: 100,
              child:ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categoryData.length,
                itemBuilder:(BuildContext context,int index) {
                  return CategoryIcon(category: categoryData[index]);
                  
                } ),
      
              );
  }

  Row headerTextfield(String title) {
    return Row(
              children: [
            Text(title,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:24,)),
            Container(
            decoration: BoxDecoration(
              color: Colors.white,shape: BoxShape.circle,
              
             
            ),
            )
           ],

           );
  }

  AppBar appBar() {
    return AppBar(
        backgroundColor: Colors.black, 
        bottom: PreferredSize(preferredSize: 
        const Size.fromHeight(60),
         child: SizedBox(child:
          Padding(padding: const EdgeInsets.all(20.0),
         child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             const Column(
               children: [
                 Text('Hello Devid' ,style: TextStyle(color: Colors.white,fontSize: 22),
                 ),
                
                 Text('Learn something new everyday' ,style: TextStyle(color: Colors.grey,fontSize: 8),
                 ),
               ],
             ),
         Stack(
          children: [
            Container(
              
              padding: const EdgeInsets.all(7),
              margin: const EdgeInsets.all(4),
              
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color:Colors.white,
                boxShadow:[
                  BoxShadow(
                   color:Colors.grey,spreadRadius: 2,
                   blurStyle: BlurStyle.outer,

                ),
                
                
                ]
              ),
child: const Icon(IconlyLight.notification,size: 26,),
            ),
          Positioned(
            top: 0,
            right: 8,
            
            child: Container(
            height: 10,
            width: 10,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
              
              
            ),
          ),)
          
          ],
         ),
         ],
         ),
         ),
         ),

        ),
        );
        
  }
}

class searchBox extends StatelessWidget {
  const searchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
     style: TextStyle(color: Colors.white,
     fontWeight: FontWeight.bold,
    
     ),
     decoration: InputDecoration(
       filled :true,
       border: OutlineInputBorder(
       borderSide:  const BorderSide(
         width: 0,
         style: BorderStyle.none,
       ),
    borderRadius: BorderRadius.circular(10),
    
       ),
       fillColor:Colors.black,
       suffixIcon: Container(
         padding: EdgeInsets.all(10),
         margin: EdgeInsets.all(5),
         decoration: BoxDecoration(
           color: Colors.grey,borderRadius: BorderRadius.circular(10),
    
         ),
         child: const Icon(IconlyLight.search),
    
       ),
       contentPadding: EdgeInsets.all(15),
       hintText: "Search Courses",
       hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
       
     ),
    
        
    );
  }
}