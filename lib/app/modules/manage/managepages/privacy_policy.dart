//Terms and conditions page

import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatefulWidget {
  @override
  _PrivacyPolicyPageState createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.only(bottom: 15.0),
      child: new Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.grey,
          ),
          backgroundColor: Colors.white,
          toolbarHeight: 100,
          elevation: 0,
          title: Text(
            'Terms & Conditions',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        body: new SingleChildScrollView(
          child: Text(
            'This application agreement, hereafter referred to as “Agreement”, is the agreement between the development team and the user with respect to use of the application (“Software”). This software has been developed for the sole purpose of accessing using the capabilities and developed by Nikhil Adhikari, Daniel Derheim, Bishnu Sharma, and John West. The development team will hereafter be referred to as the “Team”. Grant of License Subject to your compliance with the terms and conditions set forth within this agreement, the Team grants you a limited, non-exclusive, non-transferable license to install and use one copy of the Software on your mobile device services enabled via the Software.Restrictions on Use You may not: (i) copy, modify, translate, reverse engineer, decompile or disassemble the Software or create derivative works based thereon; (ii) install the Software onto a server so that it is accessible via a public network; (iii) share or permit other individuals/entities to use the Software, rent, lease or transfer the Software or rights to use it; or (iv) delete or modify any attributions, legal notices or other proprietary designations in the Software or part thereof. Any such forbidden use shall immediately and automatically terminate your license to use the Software, without derogating from any other remedies available to the Team at law or in equity. Title and Ownership The Software and any revisions, modifications, enhancements and/or derivatives of it are owned by the Team and/or its licensors. Compliance with the Law The Software is intended for use only in compliance with the law. You undertake to use the Software in accordance with all applicable laws, including all applicable export laws, restrictions and regulations and agree that you will not export, or allow the export or re-export of the Software in violation of any such laws, restrictions and/or regulations. Limitation of Liability Under no circumstances shall the Team be liable to you or any other person for any indirect, special, incidental, or consequential damages of any type including, without limitation, damages for loss of goodwill, business interruption, device failure or malfunction, loss of business profits, loss of data or business or financial information, procurement of substitute goods or services or any and all other commercial damages or losses. In no event shall the Team liability to you or any third party for any loss or damages exceed the amount paid by you to the Team for use of the software, even if the Team had been informed of the possibility of such damages, or for any claim by any other party. Termination /nYour right to use this Software, as well as this Agreement, terminates if you fail to comply with any part of this License Agreement. The Team may terminate this Agreement at any time. You may terminate this license at any time by stopping your use of and uninstalling the Software.',
          ),
        ),
      ),);

  }
}