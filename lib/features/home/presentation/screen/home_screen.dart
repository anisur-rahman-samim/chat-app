import 'package:chat_app/core/router/app_router.dart';
import 'package:chat_app/core/style/app_colors.dart';
import 'package:chat_app/core/translation/l10n.dart';
import 'package:chat_app/features/authentication/application/current_user_controller.dart';
import 'package:chat_app/features/chat/application/user_list_controller.dart';
import 'package:chat_app/features/home/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../chat/presentation/controller/list_message_controller.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  var isSearch = false;
  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(userListControllerNotifierProvider.notifier).getUsers();
    });
  }
  String search = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
          title: const Text("Messages",style: TextStyle(color: Colors.white),),
          actions: [
        IconButton(
          onPressed: () {

          },
          icon: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white.withOpacity(0.5))
              ),
              child: const Icon(Icons.notifications_active,size: 16,color: Colors.white,)),
        ),
        IconButton(
          onPressed: () {
            ref.read(homeControllerNotifierProvider.notifier).logout();
          },
          icon: Container(
            height: 30,
              width: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white.withOpacity(0.5))
              ),
              child: const Icon(Icons.logout,size: 16,color: Colors.white,)),
        ),
        const SizedBox(width: 10,)
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Column(
          children: [
            Container(

             // height: preferredSize.height,
              height: 60,

              decoration: BoxDecoration(
                  color: Colors.blue.shade300,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade400,
                    borderRadius: BorderRadius.circular(20),
                  //  border: Border.all(color: Colors.black.withOpacity(0.5)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0,vertical: 10),
                    child: TextField(
                      onChanged: (String? value) {
                        setState(() {
                          search = value.toString();
                        });
                      },
                      controller: searchController,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search here...",
                          hintStyle: TextStyle(fontSize: 14,color: Colors.white),
                        prefixIcon: Icon(Icons.search,color: Colors.white,)
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,)
          ],
        ),
      )
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _listUsersAll(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Chats",style: TextStyle(fontSize: 20),),
            ),
            _listUsersChat(searchController: searchController),
          ],
        ),
      ),
    );
  }

  Widget _listUsersChat({required TextEditingController searchController}) {
    final users = ref.watch(userListControllerNotifierProvider);
    final data = ref.watch(listMessageControllerNotifierProvider);

    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final user = users[index];
          String position = users[index].email.toString();
          final currentUser = ref
              .read(currentUserControllerNotifierProvider.notifier)
              .getCurrentUser();

          if (user.email == currentUser?.email) {
            return const SizedBox();
          }
          print(data.length);
          String username = user.email!.split('@')[0];
         if(searchController.text.isEmpty){
             return FilledButton(
             onPressed: () {
               context.go(
                 AppRoute.chat.path,
                 extra: {"uid": user.uid ?? "", "email": user.email},
               );
             },
             style: ButtonStyle(
               backgroundColor: MaterialStateProperty.all(
                 Colors.grey[200],
               ),
               shape: MaterialStateProperty.all(
                 RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(8),
                 ),
               ),
             ),
             child: ListTile(
               leading: CircleAvatar(radius: 30,backgroundColor: Colors.black,child: Center(child: ColorfulText(user.email![0].toUpperCase().toString()),),),
             // leading: ColorfulCircleAvatarText(user.email![0]),
               title: Text(username),
               subtitle: Text(user.email ?? ""),
             ),
           );
         }else if(position.toLowerCase().contains(searchController.text.toLowerCase())){
           return FilledButton(
             onPressed: () {
               context.go(
                 AppRoute.chat.path,
                 extra: {"uid": user.uid ?? "", "email": user.email},
               );
             },
             style: ButtonStyle(
               backgroundColor: MaterialStateProperty.all(
                 Colors.grey[200],
               ),
               shape: MaterialStateProperty.all(
                 RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(8),
                 ),
               ),
             ),
             child: ListTile(
               leading: CircleAvatar(radius: 30,backgroundColor: Colors.black,child: Center(child: ColorfulText(user.email![0].toUpperCase().toString()),),),
               title: Text(username),
               subtitle: Text(user.email ?? ""),
             ),
           );
         }else{
           return Container();
         }
        },
        separatorBuilder: (context, index) {
          final user = users[index];
          final currentUser = ref
              .read(currentUserControllerNotifierProvider.notifier)
              .getCurrentUser();
          if (user.email == currentUser?.email) {
            return const SizedBox();
          }
          return const SizedBox(height: 16);
        },
        itemCount: users.length);
  }
  Widget _listUsersAll() {
    final users = ref.watch(userListControllerNotifierProvider);

    return SizedBox(
      height: 100,
      child: ListView.separated(
          //physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final user = users[index];
            final currentUser = ref
                .read(currentUserControllerNotifierProvider.notifier)
                .getCurrentUser();

            if (user.email == currentUser?.email) {
              return const SizedBox();
            }
            String username = user.email!.split('@')[0];
            return InkWell(
                onTap: () {
                  context.go(
                    AppRoute.chat.path,
                    extra: {"uid": user.uid ?? "", "email": user.email},
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: Column(
                    children: [
                      CircleAvatar(radius: 30,backgroundColor: letterColors[user.email![0].toUpperCase()] ?? Colors.black,child: Center(child: Text(user.email![0].toUpperCase().toString(),style: TextStyle(fontSize: 22,color: Colors.white),),),),
                      Text(username)
                    ],
                  ),
                ));
          },
          separatorBuilder: (context, index) {
            final user = users[index];
            final currentUser = ref
                .read(currentUserControllerNotifierProvider.notifier)
                .getCurrentUser();
            if (user.email == currentUser?.email) {
              return const SizedBox();
            }
            return const SizedBox(height: 16);
          },
          itemCount: users.length),
    );
  }
}
