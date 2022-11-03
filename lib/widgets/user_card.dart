import 'package:flutter/material.dart';
import 'package:jling_fling_dating/widgets/user_image_small.dart';

import '../models/user_model.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'user_image',
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.4,
          width: MediaQuery.of(context).size.width,
          child: Stack(children: [
            Container(
              //This is for user picture card design setting
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(user.imageUrls[0]),
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 4,
                      offset: Offset(3,3),
                    ),
                  ]
              ),
            ),
            Container(
              //This is for user picture card design setting
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(200, 0, 0, 0),
                  Color.fromARGB(0, 0, 0, 0),
                ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    //Because there are 2 arguments so we need ${} for the strings
                      '${user.name}, ${user.age}', //This is the user name and user age
                      style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.white, fontWeight: FontWeight.bold)
                  ),
                  Text(
                    //Because this is just 1 argument so no need for ${}
                      user.jobTitle, //This is the user job title
                      style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white)
                  ),
                  Row(children: [
                    UserImageSmall(imageUrl: user.imageUrls[1]),
                    UserImageSmall(imageUrl: user.imageUrls[2]),
                    UserImageSmall(imageUrl: user.imageUrls[3]),
                    UserImageSmall(imageUrl: user.imageUrls[4]),
                    SizedBox(width: 2),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white,),
                      child: Icon(
                        Icons.info_outline,
                        size: 25,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ])
                ],
              ),
            )
          ],
          ),
        ),
      ),
    );
  }
}

