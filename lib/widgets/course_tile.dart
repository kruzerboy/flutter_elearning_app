import 'package:flutter/material.dart';
import 'package:flutter_elearning_app/widgets/tag.dart';
import 'package:iconly/iconly.dart';
class CourseTile extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String rating;
  final String title;
  final String instructor;
  final String price;
  final bool isBookmarked;
  final String tagTitle;
  Widget  child;


  
   CourseTile({super.key, required this.id, required this.imageUrl, required this.rating, required this.title, required this.instructor, required this.price, required this.isBookmarked, required this.tagTitle,this.child =const SizedBox(),});
    
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Container(
              
              margin: const EdgeInsets.only(top:10,bottom: 8,right:5),
              constraints: const BoxConstraints.expand(height: 150,width: 250),
              padding:  const EdgeInsets.only(left: 16,bottom: 8,right: 16),
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                shape: BoxShape.rectangle,
                image: 
                DecorationImage(image:AssetImage (imageUrl),
              fit: BoxFit.cover),
                
                color: Colors.white,
            
                
                
              ),
              child: Stack(
                
                children: [ 
                  Positioned(
                    left: 0,
                  top: 10,
                  child: Container(
                    height: 25,
                                  
                    decoration: BoxDecoration(
                  
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      
                    ),
                    child:  Padding(
                      padding:  const EdgeInsets.all(5),
                      child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                           Text(rating,style: const TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.bold),),
                         const  SizedBox(child: Icon(IconlyBold.star,size: 15,color: Color.fromARGB(93, 244, 162, 32)),),
                      
                        ],
                      ),
                    ),
                    
                    
                  ),
                  
                  ),
                   Positioned(
                    right: 0,
                    top: 10,
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: (isBookmarked)
                            ? const Icon(
                                IconlyBold.heart,
                                color: Colors.black,
                                size: 15,
                              )
                            : const Icon(
                                IconlyLight.heart,
                                color: Colors.black,
                                size: 15,
                              ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Text(title, style:const  TextStyle(fontSize: 16),),
            Text(instructor, style: const TextStyle(fontSize: 10, color: Colors.grey),),
            const SizedBox(height: 5,),
            Row(
              children: [
                Text(price, style: TextStyle(fontSize: 14, color: Colors.yellow[900], fontWeight: FontWeight.bold),),
                const SizedBox(width: 5,),
                Tag(title: tagTitle)
              ],
                
              )
            
            
          ],
        ),
      ),
    

    );
  }
}