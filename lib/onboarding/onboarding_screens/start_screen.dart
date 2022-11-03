import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jling_fling_dating/onboarding/widgets/custom_button.dart';


class Start extends StatelessWidget {
  final TabController tabController;

  const Start({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                //This is for the starting page image. I might need to change the image.
                  height: 200,
                  width: 200,
                  child: Image.asset(
                      'assets/images/Jling Fling-logos.jpeg'
                  ), //To change the image of the starting screen, change the image name.
              ),
              SizedBox(height: 50),
              Text(
                  'Welcome to Jling Fling',
                  style: Theme.of(context).textTheme.headline2,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                    'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(height: 1.8),
                      textAlign: TextAlign.center,
                    ),
              ),
            ],
          ),
          CustomButton(tabController: tabController, text: 'START')
        ],
      ),
    );
  }
}