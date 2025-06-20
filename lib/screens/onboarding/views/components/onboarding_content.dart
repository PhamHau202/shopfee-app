import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    //this.isTextOnTop = false,
    required this.title,
    required this.description,
    required this.image,
  });

  //final bool isTextOnTop;
  final String title, description, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.only(top: 30)),

        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: 
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Image.asset(
                image,
                //fit: BoxFit.cover,
              ),
            ),
          ),

        OnboardTitleDescription(
            title: title,
            description: description,
          ),
        const Spacer(),
      ],
    );
  }
}

class OnboardTitleDescription extends StatelessWidget {
  const OnboardTitleDescription({
    super.key,
    required this.title,
    required this.description,
  });

  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 129,
          width: 336,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: defaultPadding),
              Text(
                description,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
        
      ],
    );
  }
}
