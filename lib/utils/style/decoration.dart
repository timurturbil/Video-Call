// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'colors.dart';

// class Styles {
//   static final radiusNormal = BorderRadius.circular(12.0);

//   //---------------------------------------------------
//   static final authPageTitleText = GoogleFonts.montserrat(
//     fontSize: 18,
//     color: blackOpacity,
//   );

//   LinearGradient listItemGradient = LinearGradient(
//       begin: Alignment.topCenter,
//       end: Alignment.bottomCenter,
//       colors: [Color(0xFF8762EE), Color(0xFF443177)]);

//   static final authPageBodyShadow = BoxDecoration(
//       color: whiteColor,
//       borderRadius: BorderRadius.circular(10),
//       boxShadow: [
//         BoxShadow(
//             color: Color.fromRGBO(143, 148, 251, .2),
//             blurRadius: 20.0,
//             offset: Offset(0, 10))
//       ]);

//   static final authPageBodyDivider =
//       BoxDecoration(border: Border(bottom: BorderSide(color: greyColor(100))));

//   static InputDecoration authPageBodyInputDecoration(String value) =>
//       InputDecoration(
//           border: InputBorder.none,
//           hintText: value,
//           hintStyle: TextStyle(color: greyColor(400)));

//   static final authPageLoginButton = BoxDecoration(
//       borderRadius: BorderRadius.circular(10),
//       gradient: LinearGradient(colors: [
//         Color(0xFF5A76B5),
//         Color(0xFF5A76B5).withOpacity(0.8),
//       ]));

//   static final authPageLoginButtonText =
//       TextStyle(color: whiteColor, fontWeight: FontWeight.bold);

//   //---------------------------------------------------

//   static final chartHeaderTitle = GoogleFonts.montserrat(color: blackColor);

//   static final chartFooterText =
//       GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.w400);
//   static final chartBodyData =
//       GoogleFonts.montserrat(fontSize: 9, fontWeight: FontWeight.w500);

//   //---------------------------------------------------


//   static final openInvoicesButtomNavigationBarText =
//       GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600);

//   //---------------------------------------------------
//   static openInvoiceFilterTop(
//           int currentPosition, int widgetCurrentPosition, Color color) =>
//       BoxDecoration(
//           color: whiteColor,
//           boxShadow: [
//             BoxShadow(
//               color: greyOpacity(0.2),
//               blurRadius: 10.0, // has the effect of softening the shadow
//               spreadRadius: 0.4, // has the effect of extending the shadow
//             )
//           ],
//           border: Border.all(
//               color: currentPosition != widgetCurrentPosition
//                   ? Colors.transparent
//                   : color.withOpacity(0.8)),
//           borderRadius: BorderRadius.all(Radius.circular(8)));

//   static final openInvoiceFilterTopTitleAndAmount = GoogleFonts.montserrat(
//       fontSize: 10, color: blackOpacity, fontWeight: FontWeight.w600);

//   static openInvoiceFilterTopIcon(Color color) => BoxDecoration(
//       color: color, borderRadius: BorderRadius.all(Radius.circular(8)));

//   //---------------------------------------------------

//   //---------------------------------------------------
//   static final creditCardTitle = GoogleFonts.montserrat(color: blackColor);

//   static final creditCardAlertBoxText = GoogleFonts.poppins(color: whiteColor);

//   static final paymentResultMessage = GoogleFonts.montserrat(fontSize: 20);

//   static final paymentResultBackMessage = GoogleFonts.montserrat(fontSize: 16);

//   static creditCardFormInputDecoration(labelText, hintText) => InputDecoration(
//         labelText: labelText,
//         labelStyle: GoogleFonts.poppins(fontSize: 14),
//         hintStyle: GoogleFonts.poppins(fontSize: 14),
//         hintText: hintText,
//         contentPadding: EdgeInsets.all(15.0),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(
//             width: 0,
//             style: BorderStyle.none,
//           ),
//         ),
//         filled: true,
//         fillColor: greyOpacity(0.060),
//       );

//   //-----------------------------------------------------
//   static reportChartChooseMenuTitle(double fontSize) =>
//       GoogleFonts.montserrat(fontSize: fontSize, color: blackColor);

//   static final reportChartChooseMenuButton = BoxDecoration(boxShadow: [
//     BoxShadow(color: greyOpacity(0.05), blurRadius: 5.0, spreadRadius: 0.4)
//   ], borderRadius: BorderRadius.all(Radius.circular(16)), color: whiteColor);

//   static final reportChartChooseMenuButtonIcon = BoxDecoration(
//       color: Color(0xFF00AED6),
//       borderRadius: BorderRadius.all(Radius.circular(32)));

//   static final reportChartChooseMenuButtonText = GoogleFonts.montserrat(
//       color: Color(0xFF2D53A1), fontWeight: FontWeight.w500, fontSize: 13);

//   //-----------------------------------------------------

//   //-----------------------------------------------------
//   static final reportScreensSwipeActionIcon = BoxDecoration(
//       border: Border.all(color: Color(0xFF1982C4)),
//       borderRadius: BorderRadius.all(
//         Radius.circular(40),
//       ));
//   static final reportScreensSwipeActionCell = BoxDecoration(boxShadow: [
//     BoxShadow(
//         color: greyOpacity(0.2),
//         spreadRadius: 5,
//         blurRadius: 7,
//         offset: Offset(0, 3)),
//   ], color: whiteColor, borderRadius: BorderRadius.all(Radius.circular(12)));

//   static final reportScreensSwipeActionCellRow = BoxDecoration(
//     color: mainColor,
//     borderRadius: BorderRadius.only(
//       topLeft: Radius.circular(12),
//       bottomLeft: Radius.circular(12),
//     ),
//   );

//   static final reportScreensSwipeActionTrailing = GoogleFonts.montserrat(
//       fontWeight: FontWeight.bold, color: blueGreyColor(500), fontSize: 11);

//   static reportScreensSwipeActionTitle(color, double fontSize) =>
//       GoogleFonts.montserrat(color: color, fontSize: fontSize);

//   static final reportScreensSwipeActionDeatilRowTitle =
//       GoogleFonts.montserrat(fontSize: 12);

//   //-----------------------------------------------------

//   //-----------------------------------------------------
//   static final transactionDetailScreenTitle =
//       GoogleFonts.montserrat(color: blackColor, fontSize: 16);

//   //-----------------------------------------------------

//   //-----------------------------------------------------
//   static final chooseAccountsScreenTitle =
//       BoxDecoration(color: mainColor, borderRadius: Styles.radiusNormal);
//   static final chooseAccountsScreenTitleText =
//       GoogleFonts.montserrat(fontSize: 16, color: whiteOpacity(0.8));
//   static final chooseAccountsScreenBodyItemTitleAndAppBarTitle =
//       GoogleFonts.montserrat(
//     color: blackOpacity,
//   );

//   //-----------------------------------------------------
//   static final homeNavigatorWidgetOptionsText =
//       TextStyle(fontSize: 35, fontWeight: FontWeight.bold);

//   static final homeBodyItem = BoxDecoration(boxShadow: [
//     BoxShadow(
//         color: Colors.grey.withOpacity(0.1),
//         spreadRadius: 5,
//         blurRadius: 7,
//         offset: Offset(0, 3))
//   ], color: whiteColor, borderRadius: BorderRadius.all(Radius.circular(8)));

//   static homeBodyItemIcon(outColor) => BoxDecoration(
//       color: outColor, borderRadius: BorderRadius.all(Radius.circular(4)));
//   static final homeBodyItemTitle =
//       GoogleFonts.montserrat(fontSize: 14, color: blackOpacity);

//   static final homeHeaderLinearGradient = BoxDecoration(
//       gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [colorFromHex("#38AEEC"), colorFromHex("#1F68D2")]));

//   static final homeHeaderLogo = BoxDecoration(
//       color: whiteColor, borderRadius: BorderRadius.all(Radius.circular(40)));

//   static final homeHeaderText = GoogleFonts.montserrat(
//       fontWeight: FontWeight.bold, color: whiteOpacity(0.8));

//   static final homeHeaderMainPageText = BoxDecoration(
//     boxShadow: [
//       BoxShadow(
//         color: greyOpacity(0.2),
//         spreadRadius: 5,
//         blurRadius: 7,
//         offset: Offset(0, 3), // changes position of shadow
//       ),
//     ],
//     color: whiteColor,
//     borderRadius: BorderRadius.all(Radius.circular(12)),
//   );

//   //-----------------------------------------------------

//   static final mainCustomerHomeTahsilatPlanContainer =
//       BoxDecoration(color: mainColor, borderRadius: BorderRadius.circular(12));
//   static final mainCustomerHomeTahsilatPlanText =
//       GoogleFonts.montserrat(fontWeight: FontWeight.w500, color: whiteColor);
//   static final mainCustomerHomeReportTitle = GoogleFonts.montserrat(
//       fontWeight: FontWeight.w500, color: Color(0xFF807e90));

//   //-----------------------------------------------------

//   static onboardingPageIndicator(isCurrentPage) => BoxDecoration(
//       color: isCurrentPage ? greyColor(800) : greyColor(300),
//       borderRadius: BorderRadius.all(Radius.circular(12)));
//   static final onboardingPageStartButton =
//       GoogleFonts.montserrat(color: mainColor, fontWeight: FontWeight.w400);

//   static final onboardingPageBodyTitle =
//       GoogleFonts.montserrat(fontSize: 18.5, fontWeight: FontWeight.w500);
//   static final onboardingPageBodyMessage = GoogleFonts.montserrat(
//       fontSize: 14,
//       height: 2.0,
//       fontWeight: FontWeight.w500,
//       color: greyColor(500));

//   //-----------------------------------------------------

//   static swipeActionWidgetTransform(action) => BoxDecoration(
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(action.backgroundRadius),
//             bottomLeft: Radius.circular(action.backgroundRadius)),
//         color: action.color,
//       );


//   //-----------------------------------------------------
//   static progressDialogMessage(double fontSize, fontWeight) =>
//       TextStyle(color: blackColor, fontSize: fontSize, fontWeight: fontWeight);

//   static final customerDetailMenuReportListItem = BoxDecoration(
//       borderRadius: BorderRadius.all(Radius.circular(8)),
//       boxShadow: [
//         BoxShadow(
//           color: mainColor.withOpacity(0.085),
//           spreadRadius: 2,
//           blurRadius: 5,
//           offset: Offset(0, 3), // changes position of shadow
//         ),
//       ],
//       color: Colors.white.withOpacity(1));

//   static final customerDetailMenuReportListItemTitle = GoogleFonts.montserrat(
//       fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF565656));

//   static customerDetailMenuReportListItemIcon(color) => BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.all(
//           Radius.circular(8),
//         ),
//       );

//   static customerDetailScreensTitleText(color, fontWeight, double fontSize) =>
//       GoogleFonts.montserrat(
//           color: color, fontWeight: fontWeight, fontSize: fontSize);

//   static final customerHomeAppbarLogoutIcon = BoxDecoration(
//       color: Color(0xFFF0EEEE),
//       borderRadius: BorderRadius.all(Radius.circular(8)));
//   static final customerDetailAppbarContactPage =
//       GoogleFonts.montserrat(color: whiteOpacity(0.8));

//   static customerDetailAppbarContactPageText(double fontSize) =>
//       GoogleFonts.montserrat(fontSize: fontSize);

//   static customerDetailAppbarContactPagePhoneIcon(color) => BoxDecoration(
//       color: color,
//       borderRadius: BorderRadius.all(
//         Radius.circular(40),
//       ));
//   static final customerDetailAppbarContactIcon = BoxDecoration(
//       color: Color(0xFFF0EEEE),
//       borderRadius: BorderRadius.all(Radius.circular(8)));

//   //-----------------------------------------------------
//   static final dashBoardReportListItem = BoxDecoration(
//       color: colorFromHex("#dde7eb"),
//       borderRadius: BorderRadius.all(
//         Radius.circular(8),
//       ));
//   static final dashBoardReportListItemAutoSizeText = GoogleFonts.montserrat(
//       fontSize: 12,
//       fontWeight: FontWeight.w500,
//       color: colorFromHex("#3679D6"));

//   static dashBoardReportListItemIcon(color) => BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.all(
//           Radius.circular(8),
//         ),
//       );

//   static dashBoardReportMenuAnimatedContainer(
//           int reportCurrentPage, int value) =>
//       BoxDecoration(
//         borderRadius: BorderRadius.circular(6.0),
//         color: reportCurrentPage == value
//             ? colorFromHex("#1F69D2")
//             : greyOpacity(0.12),
//       );
//   static dashBoardReportMenuAnimatedContainerText(
//           int reportCurrentPage, int value) =>
//       GoogleFonts.montserrat(
//           fontWeight: FontWeight.w500,
//           fontSize: 12,
//           color: reportCurrentPage == value
//               ? Color(0xFFF0EEEE)
//               : colorFromHex("#3679D6"));
//   //-----------------------------------------------------

//   //-----------------------------------------------------
//   static final mainCustomerReportListItem = BoxDecoration(
//       color: greyOpacity(0.1),
//       borderRadius: BorderRadius.all(
//         Radius.circular(8),
//       ));
//   static final mainCustomerReportListItemAutoSizeText = GoogleFonts.montserrat(
//       fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF565656));

//   static mainCustomerReportListItemIcon(color) => BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.all(
//           Radius.circular(8),
//         ),
//       );

//   static mainCustomerReportMenuAnimatedContainer(
//           int reportCurrentPage, int value) =>
//       BoxDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//         color: reportCurrentPage == value ? mainColor : greyOpacity(0.12),
//       );

//   static mainCustomerReportMenuAnimatedContainerText(
//           int reportCurrentPage, int value) =>
//       GoogleFonts.montserrat(
//           fontWeight: FontWeight.w500,
//           fontSize: 12,
//           color: reportCurrentPage == value
//               ? Color(0xFFF0EEEE)
//               : Color(0xFF565656));

//   //-----------------------------------------------------

//   static final invoiceDetailScreenPayButtonText = ElevatedButton.styleFrom(
//       padding: EdgeInsets.all(2),
//       primary: colorFromHex("10559A"),
//       textStyle: TextStyle(color: blackColor, fontSize: 15));
//   static final invoiceDetailScreenRowContentContainer = new BoxDecoration(
//       color: whiteColor,
//       borderRadius: new BorderRadius.all(
//         Radius.circular(5),
//       ));

//   //-----------------------------------------------------
//   static final paginateContainer = BoxDecoration(
//       color: mainColor, borderRadius: BorderRadius.all(Radius.circular(40)));
//   static final paginateContainer2 = BoxDecoration(boxShadow: [
//     BoxShadow(
//         color: greyOpacity(0.3),
//         spreadRadius: 5,
//         blurRadius: 7,
//         offset: Offset(0, 3))
//   ], color: whiteColor, borderRadius: BorderRadius.all(Radius.circular(24)));

//   static paginateText(fontWeight, color) =>
//       GoogleFonts.montserrat(fontWeight: fontWeight, color: color);

//   //-----------------------------------------------------
//   static final shimmerContainer = BoxDecoration(
//     color: whiteColor,
//     borderRadius: BorderRadius.circular(12),
//     boxShadow: [
//       BoxShadow(
//         color: greyOpacity(0.2),
//         blurRadius: 10.0, // has the effect of softening the shadow
//         spreadRadius: 0.4, // has the effect of extending the shadow
//       )
//     ],
//   );

//   //-----------------------------------------------------
//   static final swipeActionCellListItemContainer = BoxDecoration(
//     color: mainColor,
//     borderRadius: BorderRadius.only(
//       topLeft: Radius.circular(12),
//       bottomLeft: Radius.circular(12),
//     ),
//   );

//   static swipeActionCellListItemTrailing(currentData) => BoxDecoration(
//       color: currentData.dptAmount == "0" ? greenColor(400) : redColor(400),
//       borderRadius: BorderRadius.all(Radius.circular(40)));

//   static swipeActionCellListItemTrailingText(
//           double fontSize, color, fontWeight) =>
//       GoogleFonts.montserrat(
//           fontSize: fontSize, color: color, fontWeight: fontWeight);

//   static swipeActionListItemTitle(
//           screenName, openInvoices, currentData, ekstre) =>
//       GoogleFonts.montserrat(
//           fontSize: 12,
//           color: screenName == openInvoices
//               ? currentData.selected
//                   ? mainColor
//                   : blackOpacity
//               : blackOpacity,
//           fontWeight:
//               screenName == ekstre ? FontWeight.bold : FontWeight.normal);

//   static swipeActionDetailTrailingActionContainer(color) => BoxDecoration(
//       border: Border.all(color: color),
//       borderRadius: BorderRadius.all(
//         Radius.circular(40),
//       ));
//   //-----------------------------------------------------
//   static final carouselSliderBody = BoxDecoration(
//       gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             mainColorGradient,
//             Color(0xFF31225b).withOpacity(0.9),
//           ]),
//       color: mainColor,
//       borderRadius: BorderRadius.all(Radius.circular(12)));

//   static final carouselSliderBody2 = BoxDecoration(
//       color: whiteOpacity(0.12),
//       borderRadius: BorderRadius.all(Radius.circular(4)));

//   static carouselSliderBodyText(double fontSize) =>
//       GoogleFonts.montserrat(fontSize: fontSize, color: whiteOpacity(0.8));

//   static carouselSliderDot(_current, index) => BoxDecoration(
//         shape: BoxShape.circle,
//         color: _current == index
//             ? colorFromHex("#8345DE")
//             : colorFromHex("#B7B7B7"),
//       );

//   static final customAppbarInput = InputDecoration(
//     hintText: "Ara...",
//     enabledBorder: UnderlineInputBorder(
//       borderSide: BorderSide(color: whiteColor),
//     ),
//     focusedBorder: UnderlineInputBorder(
//       borderSide: BorderSide(color: whiteColor),
//     ),
//   );

//   static customAppbarText(double fontSize) =>
//       GoogleFonts.montserrat(fontSize: fontSize, color: blackColor);

//   //-----------------------------------------------------
//   static final kpiSliderBody = BoxDecoration(boxShadow: [
//     BoxShadow(
//       color: Colors.grey.withOpacity(0.2),
//       spreadRadius: 5,
//       blurRadius: 7,
//       offset: Offset(0, 3),
//     ),
//   ], color: whiteColor, borderRadius: BorderRadius.all(Radius.circular(12)));

//   static kpiSliderDot(_current, index) => BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(6)),
//         color: _current == index
//             ? mainColor
//             : colorFromHex("#B7B7B7"),
//       );

//       //-----------------------------------------------------
//   static salesmanKpiSliderDot(_current, index) => BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(6)),
//         color: _current == index
//             ? colorFromHex("#1F69D2")
//             : colorFromHex("#B7B7B7"),
//       );  
//     static salesmanCarouselSliderDot(_current, index) => BoxDecoration(
//         shape: BoxShape.circle,
//         color: _current == index
//             ? colorFromHex("#1F69D2")
//             : colorFromHex("#B7B7B7"),
//       );    
//   //-----------------------------------------------------

//   static customerHomeReportsTitleHeader(fontWeight, double fontSize) =>
//       GoogleFonts.montserrat(
//         fontWeight: fontWeight,
//         color: whiteOpacity(0.8),
//         fontSize: 14,
//       );

//   //-----------------------------------------------------
//   static customersPageSwipeActionContainer(color) => BoxDecoration(
//       border: Border.all(color: color),
//       borderRadius: BorderRadius.all(
//         Radius.circular(40),
//       ));

//   static customersPageSwipeActionText(fontWeight, color, double fontSize) =>
//       GoogleFonts.montserrat(
//           fontWeight: fontWeight, color: color, fontSize: fontSize);

//   static customersPageSwipeActionContainer2(color) => BoxDecoration(
//       color: color,
//       borderRadius: BorderRadius.all(
//         Radius.circular(40),
//       ));

//   static paymentPlanSwipeActionContainer({isBefore}) => BoxDecoration(
//       color: isBefore == null
//           ? greenColor(500)
//           : isBefore
//               ? redColor(500)
//               : greenColor(500),
//       borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)));

//   static customersPageSwipeActionContainer3() => BoxDecoration(
//       color: mainColor,
//       borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)));
//   static final customersPageSwipeActionContainer4 = BoxDecoration(
//     boxShadow: [
//       BoxShadow(
//           color: greyOpacity(0.1),
//           spreadRadius: 5,
//           blurRadius: 7,
//           offset: Offset(0, 3))
//     ],
//     color: whiteColor,
//     borderRadius: BorderRadius.all(Radius.circular(12)),
//   );

//   static kpiWidgetIcon(screenName) => BoxDecoration(
//         gradient: screenName != "MainCustomerHome"
//             ? LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                     mainColorGradient,
//                     Color(0xFF31225b).withOpacity(0.9),
//                   ])
//             : null,
//         color: screenName == "MainCustomerHome" ? Color(0xFFFBC800) : mainColor,
//         borderRadius: BorderRadius.all(
//           Radius.circular(6),
//         ),
//       );

//   static kpiWidgetIcon2(screenName) => BoxDecoration(
//         gradient: screenName != "MainCustomerHome"
//             ? LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                     mainColorGradient,
//                     Color(0xFF31225b).withOpacity(0.9),
//                   ])
//             : null,
//         color: screenName == "MainCustomerHome" ? Color(0xFFFBC800) : mainColor,
//         borderRadius: BorderRadius.circular(32.0),
//       );

//   static kpiWidgetIcon2Text(screenName) => GoogleFonts.montserrat(
//       fontWeight: FontWeight.w600,
//       color: screenName == "MainCustomerHome" ? mainColor : Colors.white);

//   static final showDialogInput = InputDecoration(
//       hintText: "Müşteri Ara", hintStyle: GoogleFonts.montserrat());

//   static final mainTheme = ThemeData(
//     primaryColor: mainColor,
//     primarySwatch: Colors.blue,
//     visualDensity: VisualDensity.adaptivePlatformDensity,
//   );
// }

// TextStyle defaultFont() => GoogleFonts.montserrat(
//   color: blackColor,
// );

// TextStyle buildmontserratRow() =>
//     GoogleFonts.montserrat(color: blackOpacity, fontSize: 10);

// BoxDecoration buildStatusDecoration({dynamic data, isBefore}) {
//   if (isBefore == null) {
//     if (data.status == 0) {
//       return BoxDecoration(
//           color: redColor(500),
//           borderRadius: BorderRadius.all(Radius.circular(12)));
//     } else if (data.status == 1) {
//       return BoxDecoration(
//           color: orangeColor(500),
//           borderRadius: BorderRadius.all(Radius.circular(12)));
//     } else {
//       return BoxDecoration(
//           color: greenColor(500),
//           borderRadius: BorderRadius.all(Radius.circular(12)));
//     }
//   } else {
//     if (isBefore) {
//       return BoxDecoration(
//           color: redColor(400),
//           borderRadius: BorderRadius.all(Radius.circular(12)));
//     } else {
//       return BoxDecoration(
//           color: greenColor(400),
//           borderRadius: BorderRadius.all(Radius.circular(12)));
//     }
//   }
// }

// InputDecoration inputDecorationNote() {
//   return InputDecoration(
//       enabledBorder: UnderlineInputBorder(
//         borderSide: BorderSide(color: mainColor),
//       ),
//       focusedBorder: UnderlineInputBorder(
//         borderSide: BorderSide(color: mainColor),
//       ),
//       labelStyle: GoogleFonts.montserrat(color: mainColor),
//       labelText: 'İtiraz mesajı',
//       hintText: '');
// }

// InputDecoration inputDecorationTitle() {
//   return InputDecoration(
//       enabledBorder: UnderlineInputBorder(
//         borderSide: BorderSide(color: mainColor),
//       ),
//       focusedBorder: UnderlineInputBorder(
//         borderSide: BorderSide(color: mainColor),
//       ),
//       labelText: 'İtiraz Konusu',
//       labelStyle: GoogleFonts.montserrat(color: mainColor),
//       hintText: 'örn. Tutar uyuşmazlığı.');
// }

// BoxDecoration buildBoxDecorationKpi() {
//   return BoxDecoration(
//       borderRadius: BorderRadius.all(Radius.circular(8)),
//       boxShadow: [
//         BoxShadow(
//           color: mainColor.withOpacity(0.085),
//           spreadRadius: 4,
//           blurRadius: 10,
//           offset: Offset(0, 3), // changes position of shadow
//         ),
//       ],
//       color: Colors.white.withOpacity(1));
// }

// TextStyle buildKpiValueFont() => GoogleFonts.montserrat(
//     shadows: <Shadow>[],
//     fontWeight: FontWeight.w600,
//     fontSize: 16,
//     color: mainColor);

// TextStyle buildKpiTitleFont() =>
//     GoogleFonts.montserrat(color: Color(0xFF939393), fontSize: 12);
