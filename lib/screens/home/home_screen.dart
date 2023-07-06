import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) {
          return const Scaffold(
            backgroundColor: Color(0xFF101113),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _Head(),
                SizedBox(height: 15),
                Text(
                  'Hello, d.push91@gmail.com',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                _Title(),
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(24, 42, 24, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _BigRectangle(),
                          SizedBox(height: 28),
                          _GroupRectangle(),
                          SizedBox(height: 42),
                          _Content(),
                          SizedBox(height: 46),
                          _BtnStart(),
                          SizedBox(height: 150),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class _GroupRectangle extends StatelessWidget {
  const _GroupRectangle();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 59,
      child: GridView.count(
        childAspectRatio: 74 / 59,
        crossAxisCount: 4,
        mainAxisSpacing: 0,
        crossAxisSpacing: 16,
        padding: const EdgeInsets.all(0),
        children: const [
          _Rectangle(),
          _Rectangle(),
          _Rectangle(),
          _Rectangle(),
        ],
      ),
    );
  }
}

class _BigRectangle extends StatelessWidget {
  const _BigRectangle();

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      dashPattern: const [8, 4],
      strokeWidth: 2,
      color: const Color.fromRGBO(29, 185, 221, 0.32),
      radius: const Radius.circular(16),
      child: Container(
        width: double.infinity,
        height: 88,
        color: const Color.fromRGBO(0, 0, 0, 0.2),
        child: Image.asset('assets/images/foot.png'),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Row(
            children: [
              SizedBox.square(
                dimension: 32,
                child: Image.asset('assets/images/footwear.png'),
              ),
              Expanded(
                child: Text(
                  '0.00K /50K',
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Row(
            children: [
              SizedBox.square(
                dimension: 32,
                child: Image.asset('assets/images/lightning.png'),
              ),
              Expanded(
                child: Text(
                  '0.0/0.0',
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BtnStart extends GetView<HomeController> {
  const _BtnStart();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Container(
              width: double.infinity,
              height: 52,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(70, 75, 212, 0.5),
                    offset: Offset(0, 3),
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(141, 145, 255, 0.4),
                  ),
                  BoxShadow(
                    color: Color(0xFF1DB9DD),
                    spreadRadius: 0,
                    blurRadius: 6,
                    offset: Offset(0, -3),
                  ),
                ],
              ),
              child: Text(
                'Start',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(32),
              onTap: controller.onTapStart,
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/flash.png',
          fit: BoxFit.fill,
        ),
        const SizedBox(width: 8),
        Text(
          '00.0000',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

class _Rectangle extends StatelessWidget {
  const _Rectangle();

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      dashPattern: const [8, 4],
      strokeWidth: 2,
      color: const Color.fromRGBO(29, 185, 221, 0.32),
      radius: const Radius.circular(16),
      child: Container(
        alignment: Alignment.center,
        color: const Color.fromRGBO(0, 0, 0, 0.2),
        child: Image.asset('assets/images/add.png'),
      ),
    );
  }
}

class _Head extends GetView<HomeController> {
  const _Head();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 227,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/title.png',
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: SizedBox.square(
                dimension: 152,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/circle.png',
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundColor: const Color(0xFF01B8FF),
                        maxRadius: 69,
                        child: Obx(
                          () => controller.imageDog.value == null
                              ? Image.asset('assets/images/person.png')
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(69),
                                  child: Image.network(
                                    controller.imageDog.value!,
                                    width: 138,
                                    height: 138,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 117,
            right: 24,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.6),
                      offset: Offset(0, 16),
                      blurRadius: 24,
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Image.asset(
                  'assets/images/set.png',
                  height: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
