import 'package:flutter/material.dart';
import 'package:lol/utilities/size_config.dart';

class HomeCard extends StatelessWidget {
  const HomeCard(
      {required this.title,
      required this.goal,
      required this.iconPath,
      required this.heading,
      required this.value,
      Key? key})
      : super(key: key);
  final String iconPath;
  final String title;
  final String goal;
  final String heading;
  final double value;
  final TextStyle _titleStyle = const TextStyle(
      fontSize: 10, fontWeight: FontWeight.w500, color: Colors.black);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.heightMultiplier * 14.325,
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Colors.grey.shade300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(17, 16, 8, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '$heading ',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: title,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: SizeConfig.heightMultiplier * 2.0465),
                    Flexible(
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          /// change the value of the progress bar
                          value: value / 100,
                          valueColor:
                              const AlwaysStoppedAnimation(Colors.black),
                          backgroundColor: Colors.white,
                          minHeight: SizeConfig.heightMultiplier * 2.0465,
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.heightMultiplier * 1.043),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '0',
                          style: _titleStyle,
                        ),
                        Text(
                          'Goal: $goal',
                          style: _titleStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: SizeConfig.widthMultiplier * 5.347),
              SizedBox(
                height: SizeConfig.heightMultiplier * 6.651,
                width: SizeConfig.widthMultiplier * 13.241,
                child: Image.asset(iconPath),
              )
            ],
          ),
        ),
      ),
    );
  }
}
