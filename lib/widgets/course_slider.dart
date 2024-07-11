import'package:flutter/material.dart';
import 'package:flutter_elearning_app/data/courses_data.dart';
import 'package:flutter_elearning_app/widgets/course_tile.dart';

class CourseSlider extends StatelessWidget {
  const CourseSlider({super.key});
  
 
  @override
  Widget build(BuildContext context) {
  
    return SizedBox( height: 250,
    width: double.infinity,
    child: ListView.builder(
      itemCount: coursesData.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder:(BuildContext  context,int  index){
        
         
          return CourseTile(
          id: coursesData[index].id,
          imageUrl: coursesData[index].imageUrl,
          rating: coursesData[index].rating,
          title: coursesData[index].courseTitle,
          instructor: coursesData[index].instructor,
          price: coursesData[index].price,
          isBookmarked: coursesData[index].isBookmarked,
          tagTitle: coursesData[index].courseTag, 
        );
        
      
        
      },
      
      ),
       );
  
  }
}