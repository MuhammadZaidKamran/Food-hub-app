
 import 'package:flutter/material.dart';
import 'package:food_hub_2/utils/AppColors/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

Widget comboContainer(BuildContext context , String comboName , String imageName, String price, bool isFavorite){
  return Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors().whiteColor
                      ),
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  
                                },
                                child: Icon(Icons.favorite_border,size: 25,color: AppColors().yellowColor,)
                                )
                            ],
                          ),
                          Center(
                            child: Image.asset(imageName,width: 80,height: 80,),
                          ),
                          SizedBox(height: 10,),
                          Text(comboName,style: GoogleFonts.aBeeZee(fontSize: 14,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(price,style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w400,color: AppColors().yellowColor),),
                              Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppColors().lightYellowColor,
                                ),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      
                                    },
                                    child: Icon(
                                       Icons.add,color: AppColors().yellowColor,),
                                  ),
                                ),
                              )
                            ],
                          ),

                        ],
                      ),
                    );
}