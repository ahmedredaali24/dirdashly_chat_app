// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../../domin/entity/OnBoarding.dart';
// import '../auth/widgets/PrimaryButton.dart';
// import '../utils/OnboardingCard.dart';
// import '../utils/app_colors.dart';
//
// class OnBoardingScreen extends StatefulWidget {
//   static const String routeName="OnBoardingScreen";
//   const OnBoardingScreen({super.key});
//
//   @override
//   State<OnBoardingScreen> createState() => _OnBoardingScreenState();
// }
//
// class _OnBoardingScreenState extends State<OnBoardingScreen> {
//   final PageController pageController = PageController(initialPage: 0);
//   int _currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.kBGColor,
//       body: Column(
//         children: [
//           Expanded(
//               child: Padding(
//             padding:
//                 const EdgeInsets.only(left: 61.65, right: 43.75, top: 121.76),
//             child: SvgPicture.asset(pageViewList[_currentIndex].image),
//           )),
//           Expanded(
//             child: Column(
//               children: [
//                 Expanded(
//                     child: PageView.builder(
//                         itemCount: pageViewList.length,
//                         controller: pageController,
//                         onPageChanged: (index) {
//                           setState(() {
//                             _currentIndex = index;
//                           });
//                         },
//                         itemBuilder: (context, index) {
//                           return OnboardingCard(
//                             onBoardingList: pageViewList,
//                             currentIndex: index,
//                             pageController: pageController,
//                           );
//                         }))
//               ],
//             ),
//           ),
//         ],
//       ),
//       bottomSheet: Padding(
//         padding:
//             const EdgeInsets.only(top: 65, left: 32, right: 32, bottom: 57),
//         child: PrimaryButton1(
//           onTap: () {
//             if (_currentIndex == pageViewList.length - 1) {
//             } else {
//               pageController.nextPage(
//                 duration: const Duration(milliseconds: 500),
//                 curve: Curves.fastOutSlowIn,
//               );
//             }
//           },
//           text: _currentIndex == pageViewList.length - 1
//               ? 'Get Started'
//               : 'Continue',
//           bgColor: AppColors.kPrimary,
//           borderRadius: 8,
//           height: 48,
//           width: 326,
//           textColor: AppColors.kWhiteColor,
//         ),
//       ),
//     );
//   }
// }
//
// class PrimaryButton1 extends StatefulWidget {
//   final VoidCallback onTap;
//   final String text;
//   final double? width;
//   final double? height;
//   final double? borderRadius;
//   final double? fontSize;
//   final IconData? iconData;
//   final Color? textColor, bgColor;
//
//   const PrimaryButton1(
//       {Key? key,
//       required this.onTap,
//       required this.text,
//       this.width,
//       this.height,
//       this.borderRadius,
//       this.fontSize,
//       required this.textColor,
//       required this.bgColor,
//       this.iconData})
//       : super(key: key);
//
//   @override
//   State<PrimaryButton1> createState() => _PrimaryButtonState();
// }
//
// class _PrimaryButtonState extends State<PrimaryButton1>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   final Duration _animationDuration = const Duration(milliseconds: 300);
//   final Tween<double> _tween = Tween<double>(begin: 1.0, end: 0.95);
//
//   @override
//   void initState() {
//     _controller = AnimationController(
//       vsync: this,
//       duration: _animationDuration,
//     )..addListener(() {
//         setState(() {});
//       });
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         _controller.forward().then((_) {
//           _controller.reverse();
//         });
//         widget.onTap();
//       },
//       child: ScaleTransition(
//         scale: _tween.animate(
//           CurvedAnimation(
//             parent: _controller,
//             curve: Curves.easeOut,
//             reverseCurve: Curves.easeIn,
//           ),
//         ),
//         child: Card(
//           elevation: 5,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(widget.borderRadius!),
//           ),
//           child: Container(
//             height: widget.height ?? 55,
//             alignment: Alignment.center,
//             width: widget.width ?? double.maxFinite,
//             decoration: BoxDecoration(
//               color: widget.bgColor,
//               borderRadius: BorderRadius.circular(widget.borderRadius!),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 if (widget.iconData != null) ...[
//                   Icon(
//                     widget.iconData,
//                     color: AppColors.kWhiteColor,
//                   ),
//                   const SizedBox(width: 4),
//                 ],
//                 Text(
//                   widget.text,
//                   style: TextStyle(
//                     color: widget.textColor,
//                     fontSize: widget.fontSize ?? 14,
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
