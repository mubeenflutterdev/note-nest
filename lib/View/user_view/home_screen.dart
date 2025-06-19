import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_nest/view/auth_view/login_in_Screen.dart';
import 'package:note_nest/constant/app_colors.dart';
import 'package:note_nest/provider/feature_provider.dart/auth_provider.dart';
import 'package:note_nest/provider/feature_provider.dart/note_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.read<AuthProvider>();
    final noteProvider = context.read<NoteProvider>();

    final List notesList = [
      {
        'title': 'Home Work',
        'description':
            'Do Math hamoe work and eat breakfast ,Do Math hamoe work and eat breakfast ,Do Math hamoe work and eat breakfast ,Do Math hamoe work and eat breakfast ,Do Math hamoe work and eat breakfast ,Do Math hamoe work and eat breakfast , ',
        'date': '5/5/2023',
        'docId': 'djfahahhahdsfh',
      },

      {
        'title': 'this is dummy title',
        'description': 'this is dummy description',
        'date': '5/5/2023',
        'docId': 'djfahahhahdsfh',
      },

      {
        'title': 'this is dummy title',
        'description': 'this is dummy description',
        'date': '5/5/2023',
        'docId': 'djfahahhahdsfh',
      },
      {
        'title': 'this is dummy title',
        'description': 'this is dummy description',
        'date': '5/5/2023',
        'docId': 'djfahahhahdsfh',
      },
      {
        'title': 'this is dummy title',
        'description': 'this is dummy description',
        'date': '5/5/2023',
        'docId': 'djfahahhahdsfh',
      },
    ];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          noteProvider.addNote(context, 'hello', 'heheheh');
        },
        child: Icon(Icons.add, color: AppColors.primaryColor),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 229.h,
            decoration: BoxDecoration(color: AppColors.profileBackGround),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 285.w),
                  child: IconButton(
                    onPressed: () {
                      authProvider.signOutProvider().then((_) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      });
                    },
                    icon: Icon(Icons.logout, color: AppColors.primaryColor),
                  ),
                ),
                CircleAvatar(
                  radius: 50.r,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                Text(
                  'Welcome , Oliva Grace',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Good Afternoon',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                ),
                Text(
                  'Task List',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),

          Consumer<NoteProvider>(
            builder: (context, provider, child) {
              if (provider.isLoading == true) {
                return CircularProgressIndicator(color: Colors.red);
              } else if (provider.noteList.isEmpty) {
                return Text('no data found ');
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount:
                        provider.noteList.length, // Adjust based on your model
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Card(
                        color: AppColors.backgroundColor,
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 15.h,
                          ),
                          title: Center(
                            child: Text(
                              provider.noteList[index].title.toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          subtitle: Center(
                            child: Text(
                              provider.noteList[index].description.toString(),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,

                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
