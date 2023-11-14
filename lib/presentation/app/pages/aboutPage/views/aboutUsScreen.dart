import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:speedylimo/presentation/presentation.dart';
import '../../../../../../../utils/constants/app/app_constants.dart';
import '/utils/utils.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  TextEditingController emailController = TextEditingController();
  bool showSuffix = false;
  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      if (emailController.text.isEmpty) {
        showSuffix = false;
      } else {
        showSuffix = true;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            pinned: true,
            leading: IconButton(
                icon: const Icon(
                  Icons.filter_1,
                  color: Colors.transparent,
                ),
                onPressed: () {
                  // Do something
                }),
            floating: true,
            // snap: true,
            // elevation: 50,
            backgroundColor: Colors.grey,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: CustomLinearGradientWidget(
                  firstText: 'learn about',
                  lastText: 'limo',
                  fontSize: 30,
                ),
              ),
              background: Image.asset(
                "lib/assets/icons/abput1.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Column(
                children: [
                  //todo email form

                  Column(children: [
                    Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        // border: Border.all(
                        //   color: tempColor.t,
                        //   style: BorderStyle.solid,
                        //   width: 1.5,
                        // ),
                        color: tempColor.whiteColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        children: [
                          const CustomLinearGradientWidget(
                            firstText: 'Who We',
                            lastText: 'Are',
                            fontSize: 30,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Speedy Limo offers luxury transportation services at affordable rates through its vast range of stretch limos, SUVs, party buses, vans and sedans. Travelers rely on our services for executive rides, corporate meetings, parties and other events. Since its inception, Speedy Limo has transformed into a marvelous limousine service that is now set to beat your travel expectations. If you want an unforgettable experience for your next meeting or special occasion, Speedy Limo has the ability to live up to your expectations thanks to its professional staff and dependable vehicles. We have strived to establish a culture of excellence since the very beginning, which helps us make your moments memorable without giving your pocket a second thought.",
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Image.asset("lib/assets/icons/arrows.PNG"),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        // border: Border.all(
                        //   color: tempColor.t,
                        //   style: BorderStyle.solid,
                        //   width: 1.5,
                        // ),
                        color: tempColor.whiteColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        children: [
                          // ignore: avoid_unnecessary_containers
                          Container(
                            child: const CustomLinearGradientWidget(
                              firstText: 'Awards and',
                              lastText: 'Accolades',
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "For many years, Speedy Limo has established a reputation for delivering a luxurious limousine service experience for its users, making their special events even more memorable. Because of this excellent record, Speedy Limo has been bestowed with several awards for its professional service, dependability and impeccable safety.",
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          // border: Border.all(
                          //   color: tempColor.t,
                          //   style: BorderStyle.solid,
                          //   width: 1.5,
                          // ),
                          color: tempColor.whiteColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: const CarouselImageWidget()),
                    Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        // border: Border.all(
                        //   color: tempColor.t,
                        //   style: BorderStyle.solid,
                        //   width: 1.5,
                        // ),
                        color: tempColor.whiteColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        children: [
                          Image.asset("lib/assets/icons/one time.PNG"),
                          const SizedBox(
                            height: 20,
                          ),
                          Image.asset('lib/assets/icons/pp.PNG'),
                          const SizedBox(
                            height: 20,
                          ),
                          Image.asset('lib/assets/icons/car.PNG'),
                          const SizedBox(
                            height: 20,
                          ),
                          Image.asset("lib/assets/icons/quility.PNG")
                        ],
                      ),
                    ),
                  ]),
                ],
              );
            },
            childCount: 1,
          )),
        ],
      ),
    );
  }
}
