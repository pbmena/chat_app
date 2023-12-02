import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/services/auth/service_auth.dart';
import 'package:chat_app/ui/constants/constants.dart';
import 'package:chat_app/ui/utils/utils.dart';
import 'package:chat_app/ui/view/chat/chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signOut() {
    final authService = Provider.of<ServiceAuth>(context, listen: false);

    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TxtConstant.hHeaderTxt),
        titleTextStyle: khHeaderStyle,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              onPressed: signOut,
              icon: const Icon(Icons.logout),
            ),
          ),
        ],
      ),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text(
            TxtConstant.errorTxt,
            style: TextStyle(color: AppColors.kcHeaderText),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text(
            TxtConstant.loadingTxt,
            style: TextStyle(color: AppColors.kcHeaderText),
          );
        }

        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: ListView(
              children: snapshot.data!.docs
                  .map<Widget>((doc) => _buildUserListItem(doc))
                  .toList(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    if (_auth.currentUser!.email != data['email']) {
      return Container(
        margin: const EdgeInsets.only(top: 8.0),
        padding: keSymLarge,
        child: Card(
          elevation: 3,
          color: AppColors.kcWhiteBg,
          child: ListTile(
            leading: Chip(
              label: Text(
                data['email'].toString().substring(0, 1).toUpperCase(),
                style: khChipLeadingStyle,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: const BorderSide(color: AppColors.kcNoBg),
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              backgroundColor: AppColors.kcLeadingBg,
              padding: const EdgeInsets.all(2.5),
            ),
            title: Text(
              data['email'].toString().split("@").first,
              style: khChipTitleStyle,
            ),
            subtitle: Text(data['email']),
            trailing: const Icon(
              Icons.telegram,
              color: AppColors.kcTrailingBg,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(
                '/chat_page',
                arguments: ChatPage(
                  receiverUserEmail: data['email'],
                  receiverUserID: data['uid'],
                ),
              );
            },
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
