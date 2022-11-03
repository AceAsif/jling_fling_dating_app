import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final TabController tabController;
  final String text;
  final void function;

  const CustomButton({
    Key? key,
    required this.tabController,
    required this.text,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).primaryColor,
          ],
        ),
      ),
      //This is for the "Start" button customisation.
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          elevation: 0,
        ),
        onPressed: () {},
        child: Container(
          width: double.infinity,
          child: Center(
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}