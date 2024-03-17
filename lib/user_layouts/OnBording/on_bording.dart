import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:save_a_life_2024/common_pages/stuff_user/stuff_user.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/components/shared_component.dart';
import '../../shared/style/colors.dart';
import '../home_page/home_page.dart';



class BoardingModel {
  late final String icon;
  late final String back_image;
  late final String title;
  late final String body;

  BoardingModel({
    required this.icon,
    required this.back_image,
    required this.title,
    required this.body,
  });
}

class onBoardingScreen extends StatefulWidget {

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(
        icon: 'assets/images/icons/never_donate.png',
        back_image: 'assets/images/cerves pages/inst1.jpg',
        title: 'موانع التبرع',
        body:"  الأعمار: بحد ادني 16 و بحد اقصي  60 \n\n يستبعد مرضي الانيميا الحاده \n\n  التاريخ الصحي: قد يتم استبعاد المتبرعين الذين لديهم تاريخ سابق لأمراض معينة مثل سرطان الدم أو مشاكل في القلب أو الكلى  \n\n  الصحة العامة: قد يتم استبعاد المتبرعين الذين يعانون من أمراض  مزمنه مثل السكري و امراض القلب  \n\n الحمل والرضاعة: يتم تطبيق موانع على النساء الحوامل أو اللواتي يرضعن طفلًا حديث الولادة \n\n "),
    BoardingModel(
        icon: 'assets/images/icons/befor_donate.png',
        back_image: 'assets/images/cerves pages/inst2.png',
        title: 'قبل التبرع',
        body:" يُنصح بتجنب التدخين وتناول الكحول قبل وبعد التبرع بالدم. \n\n   تأكد من الحصول على قسط كافٍ من النوم في الليلة السابقة للتبرع بالدم \n\n وجبة خفيفة وصحية قبل التبرع بالدم. تأكد من تناول الكربوهيدرات (مثل الخبز أو الأرز) والبروتين (مثل اللحوم أو البيض) والفواكه والخضروات لضمان مستوى طاقة مناسب.\n\n  نصح بتجنب ممارسة الرياضة الشاقة أو الأنشطة البدنية الثقيلة قبل التبرع بالدم \n\n تأكد من تناول الكربوهيدرات (مثل الخبز أو الأرز) والبروتين (مثل اللحوم أو البيض) والفواكه والخضروات لضمان مستوى طاقة مناسب.  \n\nتأكد من شرب كمية كافية من السوائل قبل التبرع بالدم. يُفضل تناول الماء والعصائر الطبيعية للمساعدة في ترطيب الجسم.\n\nتجنب تناول الطعام الثقيل المشبوه أو الغذاء المقلي أو الدهني قبل التبرع بالدم، حيث قد يؤثر على نتائج اختبارات الدم. \n\n حاول الاسترخاء وتجنب أي توتر أو قلق قبل التبرع بالدم. الشعور بالراحة النفسية يمكن أن يساعد في تجربة التبرع بالدم بسلاسة."),
    BoardingModel(
        icon: 'assets/images/icons/during_donate.png',
        back_image: 'assets/images/cerves pages/inst3.png',
        title: 'عند التبرع',
        body:"تباع تعليمات الممرضين أو الفنيين: استمع جيدًا إلى تعليمات الممرضين أو الفنيين الذين يقومون بعملية التبرع بالدم. قد يطلبون منك القيام ببعض الإجراءات الإضافية أو توفير معلومات إضافية. \n\n الإبلاغ عن أي أعراض غير عادية: إذا شعرت بأي أعراض غير عادية أثناء أو بعد عملية التبرع، فلا تتردد في إبلاغ الممرضين أو الفنيين. قد يتم تقديم العناية اللازمة أو الإرشادات الإضافية.\n\n  من المهم الالتزام بتلك التعليمات لضمان تجربة تبرع بالدم آمنة ومريحة "),
    BoardingModel(
        icon: 'assets/images/icons/after_donate.png',
        back_image: 'assets/images/cerves pages/inst1.jpg',
        title: 'بعد التبرع',
        body:"قم بالجلوس لبعض الوقت بعد التبرع واسترح قليلاً. يُفضل ألا تقوم بمجهود بدني ثقيل في الساعات القليلة الأولى بعد التبرع.\n\n تناول وجبة خفيفة ومتوازنة بعد التبرع. يُفضل تناول الأطعمة الغنية بالبروتين والحديد لمساعدة جسمك على التعافي. كما يجب شرب كمية كافية من السوائل لتعويض السوائل التي فقدتها أثناء التبرع.\n\n يُنصح بتجنب ممارسة النشاطات الشاقة أو رفع الأوزان الثقيلة لمدة 24 ساعة بعد التبرع بالدم. \n\n اترك ضمادة الموقع التي وضعتها فرقة التبرع لمدة الزمن الموصى به. تجنب تعريض الموقع للماء أو الاحتكاك الشديد. إذا نزف الموقع قليلًا، استخدم الضغط الخفيف لمدة بضع دقائق حتى يتوقف النزيف. \n\n لإبلاغ عن أي مشاكل أو أعراض: إذا شعرت بأي أعراض غير عادية بعد التبرع بالدم، مثل الدوار أو الدوخة أو الضعف الشديد أو الدواليب، فيجب عليك إبلاغ مركز التبرع بالدم أو الرعاية الصحية الخاصة بك."),
  ];

  var boardController = PageController();

  bool isLastPage =false;


  void goToLogin (){
    // CachHelper.saveData(key: 'onBoarding', value: true).then((value) {
    //   if(value == true){
    //     // navegateAndFinish(context, ShopLoginScreen());
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            defaultTextButton(
              function: (){
                navigateTo(context, UserHomePage());
              },
              buttonlable: "تخطي",
              color: defultColor
            ),
          ],
          leading: IconButton(
                onPressed: (){
                  navigateTo(context, StuffSAndUser());
                },
                icon:Icon(
                  Icons.arrow_back_ios,
                color: defultColor),
              )

        ),
        body:Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index){
                  if (index == boarding.length-1){
                    setState(() {
                      isLastPage =true;
                    });
                  }else{
                    setState(() {
                      isLastPage =false;
                    });
                  }
                },
                itemBuilder: (context , index) => buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) =>
      Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Image(
                    image: AssetImage('${model.icon}'),
                  width: 121,
                  height: 117,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child:   Container(
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Image(
                      image:
                      AssetImage('${model.back_image}'),
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),

                    Container(
                      width: double.infinity,
                      padding: new EdgeInsets.only(
                          right: 10,
                        left: 70,
                        bottom: 50,
                        top: 90,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "${model.title}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 25,
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text(
                                    "${model.body}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                   
                    SizedBox(height: 40,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          FloatingActionButton(
                            heroTag: "previousPage",
                            backgroundColor: Colors.transparent,
                            elevation: 0.0,
                            onPressed: (){
                                boardController.previousPage(
                                    duration: Duration(milliseconds: 1,),
                                    curve: Curves.fastLinearToSlowEaseIn);
                            },
                            child: Icon(
                                Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          SmoothPageIndicator(
                              controller: boardController,
                              effect: ExpandingDotsEffect(
                                dotColor:Colors.grey ,
                                activeDotColor: Colors.white,
                                dotHeight: 10,
                                dotWidth: 10,
                                expansionFactor: 4,
                                spacing: 5.0,
                              ),
                              count: boarding.length),
                          Spacer(),
                          FloatingActionButton(
                            heroTag: "nextPage",
                            backgroundColor: Colors.transparent,
                            elevation: 0.0,
                            onPressed: (){
                              if(isLastPage){
                                navegateAndFinish(context, UserHomePage());
                              }else{
                                boardController.nextPage(
                                    duration: Duration(milliseconds: 1,),
                                    curve: Curves.fastLinearToSlowEaseIn);
                              }
                            },
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
}

// Widget Instructions () => Expanded(
//   child:   Container(
//     width: double.infinity,
//     height:double.infinity,
//     child: Stack(
//       children: [
//         Image(image: AssetImage('assets/images/cerves pages/instruction1.png')),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Text(
//               "موانع التبرع",
//               style: TextStyle(
//                 fontSize: 32,
//                 fontWeight: FontWeight.w400,
//                 height: 38,
//               ),
//             ),
//           ],
//         )
//       ],
//     ),
//   ),
// );
