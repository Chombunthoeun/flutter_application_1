
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/button.dart';
import 'package:flutter_application_1/utils/config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_application_1/components/custom_appbar.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  // for favorite button 
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Doctor Details',
        icon: const FaIcon(Icons.arrow_back_ios),
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                isFav =!isFav;
              });
            }, 
            icon: FaIcon(
              isFav ? Icons.favorite_rounded: Icons.favorite_outline,
              color: Colors.red,
              )
            )
        ],
      ),
      body: SafeArea(
        child:SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AboutDoctor(),
              DetailBody(),
              
              Padding(
                padding: const EdgeInsets.all(20),
                child: Button(
                  width: double.infinity,
                  title: 'Book Appointment',
                  onPressed: (){
                    Navigator.of(context).pushNamed('booking_page');
                  },
                  disable: false,
                ),

                
              ),
              
            ],
          ),
          
        )
         ),
    );
  }
}


class AboutDoctor extends StatelessWidget {
  const AboutDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return  Container(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          const CircleAvatar(
            radius: 65.0,
            backgroundImage: AssetImage('assets/doctor2.jpg'),
            backgroundColor: Colors.white,

          ),
          Config.spaceMedium,
          const Text(
            'Dr Bunthoeun',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold
            ),
          ),
          
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: const Text(
              'MBBS (International Medical University , Malaysia ) MRCP (Royal College of Pysicians , United Kingdom)',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 0.75,
            child: const Text(
              'Karameth Hospital',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 15
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),

      
    );
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({super.key});

  @override
  Widget build(BuildContext context) {
     Config().init(context);
    return  Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Config.spaceSmall,
           DoctorInfo(),
           Config.spaceMedium,
           const Text(
            'About Doctor',
            style: TextStyle( fontWeight: FontWeight.w600 , fontSize: 18),

           ),
           Config.spaceSmall,
           const Text(
            'Dr.Bunthoeun is an experience Dentist at Karameth He is graduated back since 2008 , and completed his traning at Ang doung Hospital.',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              height: 1.5
            ),
            softWrap: true,
            textAlign: TextAlign.justify,
            )
        ],
      ),
    );
  }
}


class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        InfoCard(
          label: 'patients',
          value: '109',
        ),
        const SizedBox(width: 15,),
         InfoCard(
          label: 'Experiences',
          value: '10 years',
        ),
         const SizedBox(width: 15,),
         InfoCard(
          label: 'Rating',
          value: '4.6',
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key , required this.label , required this.value});
  final String label ;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Config.primaryColor,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 15,
            ),
            child: Column(
              children: <Widget>[
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 10,),
                 Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w800
                  ),
                ),
              ],
            ),
          ),
        );
  }
}