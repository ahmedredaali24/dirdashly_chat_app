// import 'package:dots_indicator/dots_indicator.dart';
// import 'package:flutter/material.dart';
//
// import '../../domin/entity/OnBoarding.dart';
// import 'app_colors.dart';
// import 'image_assets.dart';
// class OnboardingCard extends StatelessWidget {
//   final List<OnBoarding> onBoardingList;
//   final int currentIndex;
//   PageController pageController;
//
//   OnboardingCard({
//     Key? key,
//     required this.onBoardingList,
//     required this.currentIndex,
//     required this.pageController,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//             color: AppColors.kGrey3Color,
//             borderRadius: const BorderRadius.only(
//                 topRight: Radius.circular(25), topLeft: Radius.circular(25))),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 70, left: 35, right: 34),
//               child: Text(
//                 pageViewList[currentIndex].title,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.w600,
//                   color: AppColors.kLightAccentColor,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 30),
//               child: DotsIndicator(
//                 dotsCount: pageViewList.length,
//                 position: currentIndex,
//                 decorator: DotsDecorator(
//                   color: Colors.grey.withOpacity(0.5),
//                   size: const Size.square(8.0),
//                   activeSize: const Size(20.0, 8.0),
//                   activeShape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   activeColor: AppColors.kPrimary,
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }
// }
// List<OnBoarding> pageViewList = [
//   OnBoarding(
//     title:
//     'Your Favorite Books. Anytime, Anywhere. Listen and Read with ListenLit.',
//     image: AppImagePath.kOnboarding1,
//   ),
//   OnBoarding(
//     title:
//     'Experience Your Favorite Audio Books Like Never Before with ListenLit',
//     image: AppImagePath.kOnboarding2,
//   ),
//   OnBoarding(
//     title:
//     "Immerse Yourself in Your Favorite Books with ListenLit's     Premium Audio books",
//     image: AppImagePath.kOnboarding3,
//   ),
// ];