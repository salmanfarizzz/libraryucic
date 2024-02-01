import 'package:libraryucic/cubit/auth_cubit.dart';
import 'package:libraryucic/cubit/page_cubit.dart';
import 'package:libraryucic/shared/theme.dart';
import 'package:libraryucic/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class ProfilePage1 extends StatelessWidget {
//   const ProfilePage1({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           const Expanded(flex: 2, child: _TopPortion()),
//           Expanded(
//             flex: 3,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: [
                  // Text(
                  //   "Richie Lorie",
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .headline6
                  //       ?.copyWith(fontWeight: FontWeight.bold),
                  // ),
//                   const SizedBox(height: 16),

                  
//                   const SizedBox(height: 16),
                  
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



// class _TopPortion extends StatelessWidget {
//   const _TopPortion({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       fit: StackFit.expand,
//       children: [
//         Container(
//           margin: const EdgeInsets.only(bottom: 50),
//           decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(
//                   'assets/coding.jpg',
//                 ),
//               ),
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(50),
//                 bottomRight: Radius.circular(50),
//               )),
//         ),
        // Align(
        //   alignment: Alignment.bottomCenter,
        //   child: SizedBox(
        //     width: 150,
        //     height: 150,
        //     child: Stack(
        //       fit: StackFit.expand,
        //       children: [
        //         Container(
        //           decoration: const BoxDecoration(
        //             color: Colors.black,
        //             shape: BoxShape.circle,
        //             image: DecorationImage(
        //                 fit: BoxFit.cover,
        //                 image: NetworkImage(
        //                     'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80')),
        //           ),
        //         ),
        //         Positioned(
        //           bottom: 0,
        //           right: 0,
        //           child: CircleAvatar(
        //             radius: 20,
        //             backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        //             child: Container(
        //               margin: const EdgeInsets.all(8.0),
        //               decoration: const BoxDecoration(
        //                   color: Colors.green, shape: BoxShape.circle),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // )
//       ],
//     );
//   }
// }

// @override
// Widget build(BuildContext context) {
//   return BlocConsumer<AuthCubit, AuthState>(
//     listener: (context, state) {
//       if (state is AuthFailed) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             backgroundColor: kRedColor,
//             content: Text(state.error),
//           ),
//         );
//       } else if (state is AuthInitial) {
//         context.read<PageCubit>().setPage(0);
//         Navigator.pushNamedAndRemoveUntil(
//             context, '/sign-up', (route) => false);
//       }
//     },
//     builder: (context, state) {
//       if (state is AuthLoading) {
//         return Center(
//           child: CircularProgressIndicator(),
//         );
//       }

//       return Center(
//         child: CustomButton(
//           title: 'Sign Out',
//           onPressed: () {
//             context.read<AuthCubit>().signOut();
//           },
//           width: 220,
//         ),
//       );
//     },
//   );
// }

class ProfilePage1 extends StatelessWidget {
  const ProfilePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kRedColor,
              content: Text(state.error),
            ),
          );
        } else if (state is AuthInitial) {
          context.read<PageCubit>().setPage(0);
          Navigator.pushNamedAndRemoveUntil(
              context, '/sign-up', (route) => false);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        // Tambahkan foto profil dan nama user
        // final user = context
        //     .watch<AuthCubit>()
        //     .getUser(); // Ganti dengan cara mendapatkan informasi pengguna dari state atau sumber lainnya
        // final photoUrl = user
        //     .photoUrl; // Ganti dengan cara mendapatkan URL foto profil pengguna
        // final userName =
        //     user.name; // Ganti dengan cara mendapatkan nama pengguna

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // CircleAvatar(
              //   radius: 50,
              //   backgroundImage: NetworkImage(
              //       photoUrl), // Gunakan NetworkImage jika foto profil berasal dari URL
              //   // atau Image.network(photoUrl) jika menggunakan widget Image
              // ),
              // SizedBox(height: 16),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                            'https://img.freepik.com/premium-vector/user-profile-icon-flat-style-member-avatar-vector-illustration-isolated-background-human-permission-sign-business-concept_157943-15752.jpg')
                            ),
                            ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                child: Container(
                                  margin: const EdgeInsets.all(8.0),
                                  decoration: const BoxDecoration(
                                    color: Colors.green, shape: BoxShape.circle),
                                    ),
                                    ),
                                    ),
                                    ],
                                    ),
                                    ),
                                    ),
              Text(
                    "${state.user.name}",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
              SizedBox(height: 16),
              CustomButton(
                title: 'Sign Out',
                onPressed: () {
                  context.read<AuthCubit>().signOut();
                },
                width: 220,
              ),
            ],
          ),
        );
      },
    );
  }
}
