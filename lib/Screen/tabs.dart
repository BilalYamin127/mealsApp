

import 'package:flutter/material.dart';
import 'package:meals_app/Screen/categoriesScreen.dart';
import 'package:meals_app/Screen/mealsScreen.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meals.dart';

class TabScreen extends StatefulWidget{
 const TabScreen({super.key});
  @override
  State<TabScreen> createState() {
   return _TabScreenState();
  }

}

class _TabScreenState extends State<TabScreen>
{
  int selectedPageIndex = 0;

  final List<Meal> favoritemeals= [];
  
  void showInfoMessage(String message){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content:
        Text(message),
      )
    );
    
  }

  void checkedfavroitemeal (Meal meal){
    final isChecked = favoritemeals.contains(meal);
    if(isChecked){
      setState(() {
        favoritemeals.remove(meal);

      });
      showInfoMessage('Meal is Remove from the Favroits');

    }
    else{
      setState(() {
        favoritemeals.add(meal);
      });
      showInfoMessage('Meal is added for the Favroits');

    }
    }

  void _selectedPage (int index){
    setState(() {
      selectedPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget activePage =  CategoriesScreen(
      OnfavriotButtonPressed:  checkedfavroitemeal,
    );
    var pageTitle = 'Category';
if (selectedPageIndex ==  1){

  activePage = MealsScreen(meals:favoritemeals,
  OnfavriotButtonPressed:checkedfavroitemeal ,);
  pageTitle = 'Your Favorite';
}

   return Scaffold(
     appBar: AppBar(
       title:  Text(
           pageTitle,),
     ),
     body: activePage,
     bottomNavigationBar: BottomNavigationBar(
       onTap: _selectedPage,
       currentIndex: selectedPageIndex,
       items: const [
         BottomNavigationBarItem(
             backgroundColor: Colors.blue,
             icon:Icon(Icons.set_meal) , label:'Category' ),
         BottomNavigationBarItem(icon:Icon(Icons.star_border_outlined) , label:'Favourits' ),
       ],
     ),
   );
  }

}