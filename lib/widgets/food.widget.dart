import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/food.model.dart';

import '../config/colors.constants.dart';
import '../config/layout.constants.dart';

const Duration _kDuration = Duration(milliseconds: 300);

class FoodWidget extends StatelessWidget {
  final FoodModel food;
  final bool active;
  const FoodWidget({super.key, required this.food, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPadding(
          padding: EdgeInsets.only(
              top: kDefaultPadding * (active ? 4 : 4.7), bottom: active ? 0 : kDefaultPadding),
          duration: _kDuration,
          child: Hero(
            tag: "bg${food.id}",
            flightShuttleBuilder: (
              BuildContext flightContext,
              Animation<double> animation,
              HeroFlightDirection flightDirection,
              BuildContext fromHeroContext,
              BuildContext toHeroContext,
            ) {
              late Widget hero;
              if (flightDirection == HeroFlightDirection.push) {
                hero = fromHeroContext.widget;
              } else {
                hero = toHeroContext.widget;
              }
              return RotationTransition(
                turns: Tween<double>(begin: 0, end: 1 / 4).animate(animation),
                child:
                    ScaleTransition(scale: Tween<double>(begin: 1, end: 2.2).animate(animation), child: hero),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: kFoodColors[int.parse(food.id) - 1],
                borderRadius: BorderRadius.circular(kDefaultPadding * 2),
              ),
            ),
          ),
        ),
        AnimatedPadding(
          duration: _kDuration,
          padding:
              EdgeInsets.only(top: active ? 0 : kDefaultPadding * 5, left: active ? 0 : kDefaultPadding / 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                child: AnimatedContainer(
                  duration: _kDuration + const Duration(milliseconds: 500),
                  curve: Curves.easeOutBack,
                  transformAlignment: Alignment.center,
                  transform: Matrix4.identity()..rotateZ(active ? 0 : pi / 2),
                  child: Hero(
                    tag: "plate${food.id}",
                    flightShuttleBuilder: (
                      BuildContext flightContext,
                      Animation<double> animation,
                      HeroFlightDirection flightDirection,
                      BuildContext fromHeroContext,
                      BuildContext toHeroContext,
                    ) {
                      late Widget hero;
                      if (flightDirection == HeroFlightDirection.push) {
                        hero = fromHeroContext.widget;
                      } else {
                        hero = toHeroContext.widget;
                      }
                      return RotationTransition(
                        turns: Tween<double>(begin: 0, end: 1).animate(animation),
                        child: ScaleTransition(
                            scale: Tween<double>(begin: 1, end: 2).animate(animation), child: hero),
                      );
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: kBlackColor.withOpacity(.5),
                            blurRadius: 30,
                            offset: const Offset(0, kDefaultPadding + 5), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Image.asset(
                        "assets/images/pasta/plate${food.id}.png",
                        height: kDefaultPadding * 9,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedContainer(
                      duration: _kDuration,
                      height: !active ? 0 : kDefaultPadding,
                    ),
                    Row(
                      children: [1, 2, 3, 4, 5]
                          .map((rate) => Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Icon(
                                  CupertinoIcons.star_fill,
                                  color: food.rating >= rate ? kWhiteColor : kWhiteColor.withOpacity(.4),
                                  size: 10,
                                ),
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: kDefaultPadding / 2),
                    Text(food.name,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(color: kWhiteColor)),
                    const SizedBox(height: kDefaultPadding / 2),
                    AnimatedContainer(
                      duration: _kDuration,
                      height: !active ? 0 : kDefaultPadding * 3,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Text(food.description + food.description + food.description,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: kWhiteColor.withOpacity(.5))),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: kDefaultPadding / 2),
                    Text("${food.price}€",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: kWhiteColor, fontWeight: FontWeight.w700)),
                    if (active) ...[
                      const SizedBox(height: kDefaultPadding),
                    ]
                  ],
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight + const Alignment(-.3, -.1),
          child: AnimatedOpacity(
            duration: _kDuration,
            opacity: active ? 1 : 0,
            child: Container(
              padding: const EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(kDefaultPadding),
              ),
              child: IntrinsicWidth(
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.bag_badge_plus,
                      color: kBlackColor,
                      size: 20,
                    ),
                    const SizedBox(width: kDefaultPadding / 2),
                    Text("Add to cart",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: kBlackColor, fontWeight: FontWeight.w900)),
                    const SizedBox(width: kDefaultPadding / 2),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
