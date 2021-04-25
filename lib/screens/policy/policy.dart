import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Policy extends StatelessWidget {
  const Policy({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Privacy Policy',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 5,
                ),
                Text('Last updated: April 24, 2021',
                    style: TextStyle(color: Colors.grey)),
                SizedBox(
                  height: 20,
                ),
                Text(
                    'This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.'),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Collecting and Using Your Personal Data',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      SizedBox(
                        height: 5,
                      ),
                      Text('-Types of Data Collected-',
                          style: TextStyle(fontStyle: FontStyle.italic)),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Personal Data',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'While using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to: \n-First name and last name \n-Usage Data',
                      ),
                      SizedBox(height: 20),
                      Text('Usage Data',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Usage Data is collected automatically when using the Service.\n\nWhen You access the Service by or through a mobile device, We may collect certain information automatically, including, but not limited to, the type of mobile device You use, Your mobile device unique ID, the IP address of Your mobile device, Your mobile operating system, the type of mobile Internet browser You use, unique device identifiers and other diagnostic data.\n\nWe may also collect information that Your browser sends whenever You visit our Service or when You access the Service by or through a mobile device.',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Use of Your Personal Data',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          'The App may use Personal Data for the following purposes:'),
                      SizedBox(
                        height: 5,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'For the performance of a contract: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text:
                                  'the development, compliance and undertaking of the purchase contract for the products, items or services You have purchased or of any other contract with Us through the Service.',
                              style: TextStyle(color: Colors.black)),
                        ]),
                      ),
                      SizedBox(height: 5),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'To provide You ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text:
                                  'with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless You have opted not to receive such information.',
                              style: TextStyle(color: Colors.black)),
                        ]),
                      ),
                      SizedBox(height: 5),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'To manage Your requests: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text: 'To attend and manage Your requests to Us.',
                              style: TextStyle(color: Colors.black)),
                        ]),
                      ),
                      SizedBox(height: 10),
                      Text(
                          'We may share Your personal information in the following situations:',
                          style: TextStyle(fontStyle: FontStyle.italic)),
                      SizedBox(height: 5),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'With Service Providers: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          TextSpan(
                              text:
                                  'We may share Your personal information with Service Providers to monitor and analyze the use of our Service, to contact You.',
                              style: TextStyle(color: Colors.black)),
                        ]),
                      ),
                      SizedBox(height: 10),
                      Text('Security of Your Personal Data',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          'The security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While We strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee its absolute security.'),
                      SizedBox(height: 10),
                      Text('Security of Your Personal Data',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                          'We may update Our Privacy Policy from time to time. We will notify You of any changes by posting the new Privacy Policy on this page.\n\nWe will let You know via email and/or a prominent notice on Our Service, prior to the change becoming effective and update the "Last updated" date at the top of this Privacy Policy.\n\nYou are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.'),
                      SizedBox(
                        height: 25,
                      ),
                      Text("Privacy Policy for Kurt's Portfolio",
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
