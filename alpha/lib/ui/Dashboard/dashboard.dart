import 'package:alpha/resources/app_colors.dart';
import 'package:alpha/resources/reponsive_size.dart';
import 'package:alpha/ui/Dashboard/activityChart.dart';
import 'package:alpha/ui/Dashboard/customCircularBar.dart';
import 'package:alpha/ui/Dashboard/dashboard_function.dart';
import 'package:alpha/ui/Dashboard/lineChartWidget.dart';
import 'package:alpha/ui/appbar/appbar.dart';
import 'package:alpha/ui/calander/calanderMenuSideBar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String? selectedVal = 'This Week';
  final int malefollowers = 42;
  final int femalefollowers = 58;
  List<Map<String, dynamic>> items = [
    {
      "platform_name": "Facebook",
      "person_name": "Mitchell Cooper",
      "follower": "353,49K",
      "remarks": 1.43
    },
    {
      "platform_name": "Instagram",
      "person_name": "Mitchell Cooper",
      "follower": "753,49K",
      "remarks": 1.33
    },
    {
      "platform_name": "Tiktok",
      "person_name": "Mitchell Cooper",
      "follower": "833,49K",
      "remarks": 1.45
    }
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    MySize.init(context); // Initialize MySize with the current context
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 221, 221, 221),
      drawer: NavBar(),
      appBar: const CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.all(MySize.size5),
        child: Column(
          children: [
            Container(
              width: MySize.screenWidth,
              color: AppColors.lineColor,
              height: MySize.size2,
            ),
            // First Row
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(MySize.size5),
                    child: Row(
                      children: [
                        Container(
                          width: MySize.size140,
                          height: MySize.size60,
                          child: Center(
                            child: Text(
                              'Overview',
                              style: TextStyle(
                                fontSize: MySize.size25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: MySize.size200),
                        Container(
                          width: MySize.size40,
                          height: MySize.size40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              image: AssetImage('assets/images/messenger2.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Second Row
            Padding(
              padding: EdgeInsets.all(MySize.size8),
              child: Row(
                children: [
                  Container(
                    width: MySize.size50,
                    height: MySize.size50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: Icon(
                      Icons.download,
                      size: MySize.size15,
                    ),
                  ),
                  SizedBox(width: MySize.size20),
                  Expanded(
                    child: Container(
                      height: MySize.size50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(MySize.size14),
                        border:
                            Border.all(color: AppColors.lineColor, width: 1),
                      ),
                      child: Center(
                        child: DropdownButton<String>(
                          dropdownColor: Colors.blueGrey,
                          hint: Padding(
                            padding: EdgeInsets.all(MySize.size10),
                            child: Text(
                              '$selectedVal',
                            ),
                          ),
                          items: <String>[
                            'This Week',
                            'Yesterday Week',
                            'Tomorrow Week'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedVal =
                                  newValue; // Update state inside setState
                            });
                          },
                          isExpanded: true,
                          iconSize: MySize.size40,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // ListView for items
            SizedBox(
              height: MySize.size10,
            ),

            Padding(
              padding: EdgeInsets.only(left: MySize.size18),
              child: SizedBox(
                height: MySize.size180,
                // Set a fixed height for the ListView
                child: ListView.builder(
                  scrollDirection: Axis.horizontal, // Horizontal scrolling
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MySize.size300, // Set width for each item
                      height: MySize.size100,
                      margin: EdgeInsets.symmetric(
                          horizontal: MySize.size8), // Add margin between items
                      padding: EdgeInsets.all(
                          MySize.size10), // Add padding inside the item
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(MySize
                            .size10), // Round corners for better aesthetics
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Align text to start
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                iconSize: MySize.size40,
                                icon: DashboardFunction().getPlatformIcon(
                                    items[index]["platform_name"]),
                              ),
                              SizedBox(
                                  width: MySize
                                      .size10), // Space between icon and text
                              Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .start, // Align text to start
                                children: [
                                  Text('${items[index]['person_name']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight
                                              .bold)), // Bold the person's name
                                  Text('${items[index]['platform_name']}'),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween, // Space between follower and remarks
                            children: [
                              Column(
                                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment
                                    .start, // Align text to start
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: MySize.size10),
                                    child: Row(
                                      children: [
                                        Text(
                                          '${items[index]['follower']}',
                                          style: TextStyle(
                                              fontSize: MySize.size18,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          width: MySize.size10,
                                        ),
                                        Icon(
                                            color: Colors.green,
                                            size: MySize.size20,
                                            Icons.arrow_outward_sharp),
                                        Text(
                                          '${items[index]['remarks']}%',
                                          style: TextStyle(color: Colors.green),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: MySize.size10),
                                    child: Text('Followers',
                                        style: TextStyle(
                                            fontSize: MySize.size12,
                                            color: Colors.grey)),
                                  ), // Adjust follower text color
                                ],
                              ),
                              Row(
                                children: [],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: MySize.size8,
            ),
            Expanded(
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        width: MySize.size340,
                        height: MySize.size400,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(MySize.size12)),
                        child: Padding(
                          padding: EdgeInsets.all(MySize.size8),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text('Followers',
                                      style:
                                          TextStyle(fontSize: MySize.size20)),
                                  SizedBox(
                                    width: MySize.size200,
                                  ),
                                  Icon(Icons.more_horiz)
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '254,68k',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: MySize.size20),
                                  ),
                                  SizedBox(
                                    width: MySize.size10,
                                  ),
                                  Container(
                                    width: MySize.size72,
                                    height: MySize.size32,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 207, 205, 205),
                                        borderRadius: BorderRadius.circular(
                                            MySize.size10)),
                                    child: Row(
                                      children: [
                                        Icon(
                                            color: Colors.green,
                                            size: MySize.size20,
                                            Icons.arrow_outward_sharp),
                                        Text(
                                          '6.18%',
                                          style: TextStyle(color: Colors.green),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Expanded(
                                child: DashboardFunction().bargrahp(),
                              ),
                              SizedBox(
                                height: MySize.size8,
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        '834',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: MySize.size20),
                                      ),
                                      Opacity(
                                          opacity: 0.5,
                                          child: Text(
                                            'Followers',
                                            style: TextStyle(),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    width: MySize.size160,
                                  ),
                                  Column(
                                    children: [
                                      Text('152',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: MySize.size20)),
                                      Opacity(
                                          opacity: 0.5,
                                          child: Text('Unfollowed'))
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MySize.size10,
                      ),
                      //      ------------------------------container 2  gender portion
                      Container(
                        width: MySize.size340,
                        height: MySize.size400,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(MySize.size12)),
                        child: Padding(
                          padding: EdgeInsets.all(MySize.size8),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text('Gender',
                                      style: TextStyle(
                                          fontSize: MySize.size20,
                                          fontWeight: FontWeight.w500)),
                                  SizedBox(
                                    width: MySize.size200,
                                  ),
                                  Icon(Icons.more_horiz)
                                ],
                              ),
                              Expanded(
                                // child: DashboardFunction()
                                //     .buildGenderCircularBar(58, 42)
                                child: GenderCircularBar(
                                    femalePercent: 58, malePercent: 42),
                              ),
                              SizedBox(
                                height: MySize.size8,
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: MySize.size10,
                                        height: MySize.size10,
                                        child: CircularProgressIndicator(
                                          value: 100, // Female percentage
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  const Color.fromARGB(
                                                      255, 35, 136, 219)),
                                          strokeWidth: 2,
                                          // Optionally, set the background color
                                          backgroundColor: Colors.grey[300],
                                        ),
                                      ),
                                      SizedBox(
                                        width: MySize.size8,
                                      ),
                                      Text(
                                        'Male: ',
                                        style:
                                            TextStyle(fontSize: MySize.size16),
                                      ),
                                      Opacity(
                                          opacity: 0.5,
                                          child: Text(
                                            '352K',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    width: MySize.size80,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: MySize.size10,
                                        height: MySize.size10,
                                        child: CircularProgressIndicator(
                                          value: 100, // Female percentage
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  const Color.fromARGB(
                                                      206, 230, 217, 39)),
                                          strokeWidth: 2,
                                          // Optionally, set the background color
                                          backgroundColor: Colors.grey[300],
                                        ),
                                      ),
                                      SizedBox(
                                        width: MySize.size8,
                                      ),
                                      Text(
                                        'Female: ',
                                        style:
                                            TextStyle(fontSize: MySize.size16),
                                      ),
                                      Opacity(
                                          opacity: 0.5,
                                          child: Text(
                                            '834K',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800),
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MySize.size10,
                      ),
                      //  ------------------------container 3
                      Container(
                        width: MySize.size340,
                        height: MySize.size400,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(MySize.size12)),
                        child: Padding(
                          padding: EdgeInsets.all(MySize.size8),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 10, left: 10),
                                    child: Text('Activity',
                                        style: TextStyle(
                                            fontSize: MySize.size20,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  SizedBox(
                                    width: MySize.size200,
                                  ),
                                  Icon(Icons.more_horiz)
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      '462,98k',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: MySize.size20),
                                    ),
                                    SizedBox(
                                      width: MySize.size10,
                                    ),
                                    Container(
                                      width: MySize.size72,
                                      height: MySize.size32,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 207, 205, 205),
                                          borderRadius: BorderRadius.circular(
                                              MySize.size10)),
                                      child: Row(
                                        children: [
                                          Icon(
                                              color: Colors.green,
                                              size: MySize.size20,
                                              Icons.arrow_outward_sharp),
                                          Text(
                                            '3.48%',
                                            style:
                                                TextStyle(color: Colors.green),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                //child: LineChartWidget(),
                                child: LineChartWidget(),
                              ),
                              SizedBox(
                                height: MySize.size8,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MySize.size10,
                      ),
                      // ---------4th Container()
                      Container(
                        width: MySize.size340,
                        height: MySize.size520,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(MySize.size12)),
                        child: Padding(
                          padding: EdgeInsets.all(MySize.size10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text('Statistics',
                                      style: TextStyle(
                                          fontSize: MySize.size20,
                                          fontWeight: FontWeight.w700)),
                                  SizedBox(
                                    width: MySize.size200,
                                  ),
                                  Icon(Icons.more_horiz)
                                ],
                              ),
                              SizedBox(
                                height: MySize.size10,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: MySize.size50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            MySize.size14),
                                        border: Border.all(
                                            color: AppColors.lineColor,
                                            width: 1),
                                      ),
                                      child: Center(
                                        child: DropdownButton<String>(
                                          dropdownColor: Colors.blueGrey,
                                          hint: Padding(
                                            padding:
                                                EdgeInsets.all(MySize.size10),
                                            child: Text(
                                              '$selectedVal',
                                            ),
                                          ),
                                          items: <String>[
                                            'This Week',
                                            'Yesterday Week',
                                            'Tomorrow Week'
                                          ].map((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              selectedVal =
                                                  newValue; // Update state inside setState
                                            });
                                          },
                                          isExpanded: true,
                                          iconSize: MySize.size40,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(MySize.size10),
                                    child: Text(
                                      'Share',
                                      style: TextStyle(
                                          fontSize: MySize.size18,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MySize.size160,
                                  ),
                                  Text('Likes',
                                      style: TextStyle(
                                          fontSize: MySize.size18,
                                          fontWeight: FontWeight.w300))
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '254,68k',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: MySize.size20),
                                  ),
                                  SizedBox(
                                    width: MySize.size10,
                                  ),
                                  Container(
                                    width: MySize.size72,
                                    height: MySize.size32,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 207, 205, 205),
                                        borderRadius: BorderRadius.circular(
                                            MySize.size10)),
                                    child: Row(
                                      children: [
                                        Icon(
                                            color: Colors.green,
                                            size: MySize.size20,
                                            Icons.arrow_outward_sharp),
                                        Text(
                                          '6.18%',
                                          style: TextStyle(color: Colors.green),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: MySize.size50,
                                  ),
                                  Text(
                                    '23,689k',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: MySize.size20),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: DashboardFunction().bargrahp_Statistic(),
                              ),
                              SizedBox(
                                height: MySize.size8,
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        '834',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontSize: MySize.size20),
                                      ),
                                      Opacity(
                                          opacity: 0.5,
                                          child: Text(
                                            'Followers',
                                            style: TextStyle(),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    width: MySize.size160,
                                  ),
                                  Column(
                                    children: [
                                      Text('152',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: MySize.size20)),
                                      Opacity(
                                          opacity: 0.5,
                                          child: Text('Unfollowed'))
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MySize.size10,
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
