import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ufstask/Utils/Colors.dart';

import '../../Utils/fonts.dart';

class RiskAssessmentViewScreen extends StatefulWidget {
  const RiskAssessmentViewScreen({Key? key}) : super(key: key);

  @override
  State<RiskAssessmentViewScreen> createState() => _RiskAssessmentViewScreenState();
}

class _RiskAssessmentViewScreenState extends State<RiskAssessmentViewScreen> {
  List<String> containerTexts = [
    "Physical Hazard",
    "Safety Hazard",
    "Chemical Hazard",
    "Biological Hazard",
    "Ergonomics Hazard"
  ];

  // Add a state to keep track of the expanded container
  String expandedContainer = "";

  // Add a state to keep track of the expanded sub-container
  String expandedSubContainer = "";

  @override
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(
          Icons.apps,
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Risk Assessment",style: risktext,),
                      SizedBox(height: 10.0),
                      for (var text in containerTexts)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (expandedContainer == text) {
                                      expandedContainer = "";
                                    } else {
                                      expandedContainer = text;
                                      expandedSubContainer =
                                      ""; // Reset sub-container when main container changes
                                    }
                                  });
                                },
                                child: Container(
                                  height: 56,
                                  width: size.width,
                                  // Adjust to the screen width
                                  decoration: BoxDecoration(
                                    color: firstScreen,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(text),
                                        Icon(expandedContainer == text
                                            ? Icons.arrow_drop_up
                                            : Icons.arrow_drop_down),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              if (expandedContainer == "Chemical Hazard" &&
                                  text == "Chemical Hazard")
                                Column(
                                  children: [
                                    SizedBox(height: 10),
                                    buildSubContainer(
                                        "Cleaning Products", Colors.white),
                                    SizedBox(height: 10),
                                    buildSubContainer(
                                        "Pesticide", Colors.white),
                                    SizedBox(height: 10),
                                    buildSubContainer("Asbestos", Colors.white),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: firstScreenskip,
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Center(child: Text("Skip", style: TextStyle(
                          color: Colors.black))),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: firstScreennext,
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Center(child: Text("Next", style: TextStyle(
                          color: Colors.black))),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSubContainer(String text, Color color) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (expandedSubContainer == text) {
                expandedSubContainer = "";
              } else {
                expandedSubContainer = text;
              }
            });
          },
          child: Container(
            height: 56,
            width: double.infinity, // Adjust to the screen width
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(text),
                  Icon(expandedSubContainer == text
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
        ),
        if (expandedSubContainer == "Cleaning Products" &&
            text == "Cleaning Products")
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              buildTextField("Risk Description"),
              buildTextField("Initial Score"),
              buildTextField("Go"),
              buildTextField("Mitigation Measure"),
              buildTextField("Final Score"),
              buildTextField("No Go"),
              buildTextField("Equipment List", icon: Icons.arrow_drop_down),
            ],
          ),
        if (expandedSubContainer == "Pesticide" && text == "Pesticide")
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              buildTextField("Risk Description"),
              buildTextField("Initial Score"),
              buildTextField("Go"),
              buildTextField("Mitigation Measure"),
              buildTextField("Final Score"),
              buildTextField("No Go"),
              buildTextField("Equipment List", icon: Icons.arrow_drop_down),
            ],
          ),
      ],
    );
  }

  Widget buildTextField(String label, {IconData? icon}) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width / 2 - 20, // Half of screen width minus padding
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: icon != null ? Icon(icon) : null,
        ),
      ),
    );
  }
}
