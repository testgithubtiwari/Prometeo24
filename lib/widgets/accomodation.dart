import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prometeo/widgets/accomodation_cultural.dart';
import 'package:prometeo/widgets/accomodation_event.dart';
// import 'package:prometeo/widgets/bottom_nav_bar.dart';
import 'package:prometeo/widgets/custom_appbar.dart';
import 'package:prometeo/widgets/faq.dart';
import 'package:prometeo/widgets/nav_drawer.dart';

class Accomodation extends StatefulWidget {
  const Accomodation({super.key});

  @override
  State<Accomodation> createState() => _AccomodationState();
}

class _AccomodationState extends State<Accomodation> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      drawer: const NavDrawer(),
      body: Container(
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/accom.jpg'), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            padding: EdgeInsets.fromLTRB(
              size.width * 0.02,
              size.width * 0.05,
              size.width * 0.02,
              0,
            ),
            child: Column(
              children: [
                const CustomAppBar(
                  isHomePage: true,
                ),
                SizedBox(
                  height: size.width * 0.05,
                ),
                Text(
                  'ACCOMMODATION',
                  style: GoogleFonts.orbitron(
                    fontSize: size.width * 0.06,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(237, 147, 64, 1),
                  ),
                ),
                Text(
                  'A COMFORTABLE AND CONVENIENT ACCOMMODATION IN PROMETEO',
                  style: GoogleFonts.poppins(
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: size.width * 0.02,
                ),
                const AccomodationEventCard(),
                SizedBox(
                  height: size.width * 0.04,
                ),
                const AccomodationCultural(),
                SizedBox(
                  height: size.width * 0.05,
                ),
                Text(
                  'ABOUT US',
                  style: GoogleFonts.orbitron(
                    color: const Color.fromRGBO(237, 147, 64, 1),
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(size.width * 0.03),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(15, 0, 255, 255)),
                  child: Text(
                    "Indian Institute of Technology Jodhpur was established in 2008, to foster technology, education, and research in India. The Institute is committed to pursuing technological advancements in the process of the economic develop ment of India. It functions from its sprawling residential Permanent Campus of 852 acres, with the campus plan being awarded a 5-star rating by GRIHA Council The institute's infrastructure is vividly unique while optimizing all resources to become a near-zero-emission campus. The Institute is committed to a mul tidisciplinary approach to technological development and it has established MoUs with six international universities, two international agencies, and three national institutes and universities for academic cooperation and research, The big breakthroughs in the research field include A1 intelligent gloves equipped with speech to facilitate specially-abled people. Hope to see you at Prometeo 2024. Please visit the Frequently Asked Questions (FAQ) section to get most of your queries resolved.",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: size.width * 0.035,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(
                  height: size.width * 0.04,
                ),
                Text(
                  'ACCOMMODATION GUIDELINES',
                  style: GoogleFonts.orbitron(
                    color: const Color.fromRGBO(237, 147, 64, 1),
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: size.width * 0.03,
                ),
                Container(
                  padding: EdgeInsets.all(size.width * 0.03),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(15, 0, 255, 255)),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '1 . ',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "Every participant shall at all times be in possession of a current, government-issued photo ID and student participants must also carry a valid photo ID issued by their college. If a visitor cannot present their identification card, they will not be permitted to enter the Prometeo'24 campus.",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.w600,
                              ),
                              // maxLines: 10,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '2 . ',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "Alcohol, drugs, illegal substances, sharp objects, and any kind of explosives are absolutely prohibited on campus. Anything else that is deemed hazardous is prohibited. The Security and Prometeo'24 team's decision shall be final if there are any disputes.",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.w600,
                              ),
                              // maxLines: 10,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '3 . ',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "Throughout the fest of Prometeo '24, no outside vehicles will be permitted on campus.",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.w600,
                              ),
                              // maxLines: 10,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '4 . ',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "All participants are expected to maintain the campus's decorum and cleanliness as well as to diligently and consistently abide by its rules and regulations.",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.w600,
                              ),
                              // maxLines: 10,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '5 . ',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "IIT Jodhpur and its students disclaim all liability for any accidents that may or may not happen during the course of Prometeo '24.",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.w600,
                              ),
                              // maxLines: 10,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '6 . ',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "To prevent any unauthorized activities on campus, random checks would be conducted.",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.w600,
                              ),
                              // maxLines: 10,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '7 . ',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "Any commodities issued to the guests would have to be returned in sound condition to the organizers during check-out.",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.w600,
                              ),
                              // maxLines: 10,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '8 . ',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "Anyone found visiting a hostel other than the one that is designated will be penalized and appropriate action will be taken against them.",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.w600,
                              ),
                              // maxLines: 10,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '9 . ',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "Hostel guests must take care to prevent damage to the institute's property and facilities, since those found guilty of such behavior will be responsible for covering any necessary repairs.",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.w600,
                              ),
                              // maxLines: 10,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '10 . ',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "Participants are requested to refrain from causing any disruptions to their other participants.",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.w600,
                              ),
                              // maxLines: 10,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '11 . ',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "The administration will not be held liable for any damage or loss of property or valuables of the participants stored in places of lodging.",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.w600,
                              ),
                              // maxLines: 10,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '12 . ',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "Institute will provide the pickup and drop facility to the participants between bus/railway stations and campus during the dates which will be announced soon.",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.w600,
                              ),
                              // maxLines: 10,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.width * 0.03,
                ),
                Text(
                  'INSTRUCTIONS FOR SCHOOL STUDENTS',
                  style: GoogleFonts.orbitron(
                    color: const Color.fromRGBO(237, 147, 64, 1),
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: size.width * 0.04,
                ),
                Container(
                  padding: EdgeInsets.all(size.width * 0.03),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(15, 0, 255, 255)),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '1 . ',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "School students only need to register  and will not be provided accomodation on campus because of security reasons. Hence, they are not supposed to pay any fee during registration.",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.w600,
                              ),
                              // maxLines: 10,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '2 . ',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "Presence of a guardian (mentor/parents/teacher) is compulsory for school students at all point of time when they are participating or attending any event.",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.w600,
                              ),
                              // maxLines: 10,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '3 . ',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "Presence of a guardian (mentor/parents/teacher) is compulsory for school students at all point of time when they are participating or attending any event.",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.w600,
                              ),
                              // maxLines: 10,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '4 . ',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "Prizes will also be provided accordingly.",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.w600,
                              ),
                              // maxLines: 10,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.width * 0.03,
                ),
                Text(
                  'INSTRUCTIONS',
                  style: GoogleFonts.orbitron(
                    color: const Color.fromRGBO(237, 147, 64, 1),
                    fontSize: size.width * 0.05,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: size.width * 0.04,
                ),
                Container(
                  padding: EdgeInsets.all(size.width * 0.03),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(15, 0, 255, 255)),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '1 . ',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "All guests carrying electronic items of any kind will have to declare them at the IIT Jodhpur main gate through a ‘Gate Pass'. The belongings will also be checked on the way out of IIT Jodhpur along with the ‘Gate Pass', failing to do so will result in the belongings being impounded.",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.w600,
                              ),
                              // maxLines: 10,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '2 . ',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "All guests will be provided with mattress. Prometeo will not provide mattress cover, blankets or pillows. The guests are encouraged to arrange them on their own (if required), since the weather might get cold during the night.",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.w600,
                              ),
                              // maxLines: 10,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '3 . ',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "Any commodities issued to the guests would have to be returned in sound condition to the organisers during check-out.",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.w600,
                              ),
                              // maxLines: 10,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '4 . ',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "Random checks would be made to avoid any illegal stay at the campus. Any team failing to produce their electronic/physical receipts of accommodation would be heavily fined and disqualified.",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.w600,
                              ),
                              // maxLines: 10,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '5 . ',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "Entry will be only through the 'Main Gate' of IIT Jodhpur. All other gates will be closed for entry.",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.w600,
                              ),
                              // maxLines: 10,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '6 . ',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "All guests are required to carry their valid government photo id proofs at all times. In addition, the student participants are also required to carry their valid College photo id card. Any guest failing to produce their id card will not be permitted inside the campus during Prometeo 2024.",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.w600,
                              ),
                              // maxLines: 10,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '7 . ',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "Alcohol, drugs, sharp objects and explosives of any kind are strictly prohibited inside the campus. Any other item if deemed unsafe will be prohibited. The decision of Security and Prometeo team will be final in case of any disputes.",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.w600,
                              ),
                              // maxLines: 10,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '8 . ',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "No outside vehicles will be allowed into the campus during the Prometeo 2024.",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.w600,
                              ),
                              // maxLines: 10,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '9 . ',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              "All guests are required to maintain the decorum and cleanliness of the campus, and follow the rules of the campus at all times.",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: size.width * 0.035,
                                fontWeight: FontWeight.w600,
                              ),
                              // maxLines: 10,
                              textAlign: TextAlign.justify,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.width * 0.06,
                      ),
                      Text(
                        'Prometeo 2024 and IIT Jodhpur will not be responsible for any mishaps that occur through the duration of stay for Prometeo 2024.',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: size.width * 0.035,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.width * 0.05,
                ),
                Text(
                  "FAQ'S",
                  style: GoogleFonts.orbitron(
                    color: const Color.fromRGBO(237, 147, 64, 1),
                    fontSize: size.width * 0.06,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: size.width * 0.03,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, size.width * 0.15),
                  padding: EdgeInsets.all(size.width * 0.03),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(15, 0, 255, 255)),
                  child: const FAQ(),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        margin:
            EdgeInsets.fromLTRB(0, size.width * 0.95, size.width * 0.025, 0),
        // padding: EdgeInsets.all(size.width * 0.01),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.white),
          borderRadius: BorderRadius.circular(size.width * 0.015),
          // color: const Color.fromARGB(93, 0, 0, 0),
        ),
        child: FloatingActionButton(
          onPressed: () {
            _scrollController.animateTo(
              0.0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          backgroundColor: Colors.transparent,
          child: Icon(
            Icons.arrow_upward,
            color: Colors.white,
            size: size.width * 0.07,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // bottomNavigationBar: NavBar(currentIndex: -1),
    );
  }
}
