import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_nest/View/auth_view/login_in_Screen.dart';
import 'package:note_nest/View/user_view/add_note_screen.dart';
import 'package:note_nest/constant/app_colors.dart';
import 'package:note_nest/models/note_model.dart';
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
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<NoteProvider>(context, listen: false).getNotes(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.read<AuthenticationProvider>();
    final noteProvider = context.read<NoteProvider>();

    return Scaffold(
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
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
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
          // TextFormField(controller: _noteController),
          // TextButton(
          //   onPressed: () {
          //     final noteText = _noteController.text.trim();
          //     if (noteText.isNotEmpty) {
          //       noteProvider.addNote(context, noteText);
          //     }
          //   },
          //   child: Text('UPLOAD NOTE'),
          // ),
          // Uncomment to show notes list
          Expanded(
            child: Consumer<NoteProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (provider.noteList.isNotEmpty) {
                  return ListView.builder(
                    itemCount: noteProvider
                        .noteList
                        .length, // Adjust based on your model
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 20.w,
                      ),
                      child: Card(
                        color: AppColors.backgroundColor,
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 15.h,
                          ),
                          leading: IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: AppColors.profileBackGround,
                            ),
                            onPressed: () {
                              final List<NoteModel> dataList =
                                  provider.noteList;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => AddNoteScreen(
                                    description: dataList[index].description,
                                    title: dataList[index].title,
                                    edit: true,
                                    docId: noteProvider.noteList[index].docId,
                                  ),
                                ),
                              );
                            },
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: AppColors.profileBackGround,
                            ),
                            onPressed: () {
                              noteProvider.deleteNote(
                                context,
                                provider.noteList[index].docId,
                              );
                            },
                          ),
                          title: Center(
                            child: Text(
                              provider.noteList[index].title,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          subtitle: Center(
                            child: Text(
                              provider.noteList[index].description,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,

                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (provider.noteList == null) {
                  return const Center(child: Text('No data found.'));
                }
                return Container();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.buttonBackGround,
        onPressed: () {
          // noteProvider.getNotes(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNoteScreen(edit: false)),
          );
        },
        child: Icon(Icons.add, color: AppColors.primaryColor),
      ),
    );
  }
}
