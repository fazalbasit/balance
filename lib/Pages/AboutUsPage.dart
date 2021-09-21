import 'package:balance/Component/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Stack(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(top: 0),
                          child: Image.asset(
                            "assets/images/aboutus.png",
                            fit: BoxFit.fitWidth,
                          )),
                      Container(
                        margin: EdgeInsets.only(top: 220),
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40))),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            "Our Award-Winning Approach",
                            style: kLabelStyle.copyWith(
                                fontSize: 30, color: PrimaryColor),
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      RichText(
                        text: TextSpan(
                          // Here is the explicit parent TextStyle
                          style: aboutus_mainstyle.copyWith(fontSize: 16,height: 1.6),
                          children: <TextSpan>[
                            new TextSpan(
                                text:
                                    'Balance by Nature is an award-winning corporate health & wellness consulting firm that develops wellness programs to help employees thrive. We were recently awarded as the “Best in Corporate Wellness Services USA 2021”  by Global Business Leaders Magazine. We were also awarded “Top 20 Leading Companies of the Year” by GHP News, and “Top 30 Most Reputable Company 2021” by Silicon Review, amongst other prestigious awards and recognitions. ',
                                style:
                                    new TextStyle(fontWeight: FontWeight.w600)),
                            new TextSpan(
                                text:
                                    'We guide our corporate clients to create cultures of health, improving the way employees feel and perform in all areas of their lives. Happier and healthier employees are more productive and have greater job satisfaction, a win-win situation for any company.'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Image.asset('assets/images/badge1.png'),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                          'We take a consultative approach to designing and managing corporate wellness programs by first gaining an in-depth understanding of your unique culture and work environment, and then gathering employee feedback to determine what elements your wellness program should include. This allows us to tailor a wellness solution for your employees with high levels of participation and engagement.',
                          style: aboutus_mainstyle.copyWith(fontSize: 16,height: 1.6)),
                      SizedBox(
                        height: 40,
                      ),
                      Image.asset('assets/images/badge2.png'),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                          'Every program is different, from 1 fitness class per week, all the way up to a comprehensive program with stress reduction classes, fitness classes, wellness speaker series, learning & development workshops, nutrition demonstrations, chair massage days, and so much more. We have helped several of our clients earn awards for Healthiest Workplaces, supporting their goals of becoming Top Companies to Work For.',
                          style: aboutus_mainstyle.copyWith(fontSize: 16,height: 1.6)),
                      SizedBox(
                        height: 40,
                      ),
                      Image.asset('assets/images/nicole1.png'),
                      SizedBox(
                        height: 40,
                      ),

                      Row(
                        children: [
                          Text(
                            "About Nicole Mixdorf",
                            textAlign: TextAlign.start,
                            style: kLabelStyle.copyWith(
                                fontSize: 25, color: PrimaryColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //nicole2.png
                      Text(
                          'Nicole Mixdorf is the Chief Wellness Officer of Balance by Nature, and was recently awarded as the “Most Influential Woman in Corporate Wellness Services USA 2020” by Acquisition INTL Magazine as part of their 2020 Global Excellence Awards. She was also awarded as  a “Top 100 Healthcare Leader in the World 2020” by the International Forum on Advancements in Healthcare.',
                          style: aboutus_mainstyle.copyWith(fontWeight: FontWeight.w600,fontSize: 16,height: 1.6)),
                      SizedBox(
                        height: 40,
                      ),
                      Image.asset('assets/images/nicole2.png'),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                          'She is a motivational leader who inspires people to be the very best that they can be. After spending over a decade working her way up the corporate ladder in a global firm, she experienced the debilitating health consequences of a stressful work environment. After taking time off to heal her body, she launched Balance by Nature in 2012 to help other busy professionals find more balance in their lives and thrive.',
                          style: aboutus_mainstyle.copyWith(fontSize: 16,height: 1.6)),
                      SizedBox(
                        height: 30,
                      ),
                      Image.asset('assets/images/nicole5.png'),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                          'Nicole takes a consultative and strategic approach to program design, and delivers inspiring content to businesses around the country. These programs help corporations to reduce healthcare claims and absenteeism, while boosting morale and attracting top talent.',
                          style: aboutus_mainstyle.copyWith(fontSize: 16,height: 1.6)),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset('assets/images/nicole4.png'),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          Text(
                            "Good Day Show Interview",
                            textAlign: TextAlign.start,
                            style: kLabelStyle.copyWith(
                                fontSize: 25, color: PrimaryColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //nicole2.png
                      Text(
                          'Enjoy this recent TV interview on the Good Day Show where Balance by Nature’s Chief Wellness Officer, Nicole Mixdorf, shares strategies for structuring your day for success and building emotional resiliency.',
                          style: aboutus_mainstyle.copyWith(fontWeight: FontWeight.w600,height: 1.6)),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          Text(
                            "Booking Nicole",
                            textAlign: TextAlign.start,
                            style: kLabelStyle.copyWith(
                                fontSize: 25, color: PrimaryColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //nicole2.png
                      Text(
                          'Interested in booking Nicole for a speaking event? ',
                          style: aboutus_mainstyle.copyWith(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 30,
                      ),

                      Image.asset('assets/images/nicole3.png'),
                      SizedBox(
                        height: 40,
                      ),
                      //nicole2.png
                      Text(
                          'In addition to corporate wellness consulting, Nicole Mixdorf is also a dynamic and inspiring keynote speaker. Whether you are hosting an event for thousands, or a small executive retreat, Nicole dazzles with her ability to inspire individuals to play a bigger game in their lives and be the best versions of themselves that they can be. ',
                          style: aboutus_mainstyle.copyWith(fontSize: 16,height: 1.6)),
                      SizedBox(
                        height: 40,
                      ),
                      _buildSignupBtn(context),
                      SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignupBtn(var context) {
    return GestureDetector(
      onTap: () => {Navigator.pushNamed(context, "/signup")},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          decoration: Login_Button_BoxDecoration.copyWith(color: PrimaryColor),
          padding: EdgeInsets.symmetric(vertical: 15.0),
          width: double.infinity,
          child: Text(
            'Book nicole',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1.5,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
      ),
    );
  }
}
