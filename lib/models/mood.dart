// class Food {
//   final int? id;
//   final String foodName;
//   final double? amount;
//   final double? calories;
//   final int? pet_id;
//   final int? gLoad;

//   Food({
//     this.id,
//     required this.foodName,
//     required this.amount,
//     required this.calories,
//     required this.pet_id,
//     required this.gLoad,
//   });

//   // Convert a map from Supabase to a Food object
//   factory Food.fromMap(Map<String, dynamic> map) {
//     return Food(
//       id: map['id'],
//       foodName: map['foodName'],
//       amount: map['amount'],
//       calories: map['calories'],
//       pet_id: map['pet_id'],
//       gLoad: map['gLoad'],
//     );
//   }

//   // Convert a Food object to a map for insertion/updating
//   Map<String, dynamic> toMap() {
//     return {
//       'foodName': foodName,
//       'amount': amount,
//       'calories': calories,
//       'pet_id': pet_id,
//       'gLoad': gLoad,
//     };
//   }
// }

import 'package:flutter/material.dart';

class Mood {
  String moodName;
  String description;
  Color color;

  Mood({
    required this.moodName, 
    required this.description,
    required this.color
  });
}



class MoodList {
  List<Mood> moods = [
    Mood(
      moodName: 'Alert',
      description: 'State of heightened awareness where the pet is observing or listening for something unusual',
      color: Color(0xFFFAE6B1),
    ),
    Mood(
      moodName: 'Angry',
      description: 'Pets may show aggression or irritation, often due to being disturbed, threatened, or in pain',
      color: Color(0xFFF4C7C3),
    ),
    Mood(
      moodName: 'Anxious',
      description: 'State of nervousness/unease, triggered by uncertainty, separation, or change in environment',
      color: Color(0xFFF7D6C1),
    ),
    Mood(
      moodName: 'Fearful',
      description: 'Strong reaction to a perceived threat, even if it\'s not real. Often deeper than anxiety',
      color: Color(0xFFD5E1EA),
    ),
    Mood(
      moodName: 'Playful',
      description: 'State of nervousness/unease, triggered by uncertainty, separation, or change in environment.',
      color: Color(0xFFFFF1B5),
    ),
    Mood(
      moodName: 'Relieved',
      description: 'A mood indicating release from stress or discomfort, usually after a stressful event ends.',
      color: Color(0xFFCFEAD9),
    ),
    Mood(
      moodName: 'Sad',
      description: 'Characterized by a reduction in activity, loss of interest in enjoyable activities and changes in appetite or sleep',
      color: Color(0xFFD5D9EA),
    ),
    Mood(
      moodName: 'Vulnerable',
      description: 'State of emotional or physical exposure where the pet may seek protection or comfort',
      color: Color(0xFFE9D3EC),
    ),
  ];

}
