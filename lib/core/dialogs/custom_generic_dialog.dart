import 'package:flutter/material.dart';

Future customGenericDialog(
    {String message = 'Something wrong happen',
    required BuildContext context}) {
  return showDialog(
    useSafeArea: true,
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
                height: 200,
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 40,
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.only(
                    top: 40, left: 20, right: 20, bottom: 20),
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Center(
                      child: Text(
                        message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                    )
                  ],
                )),
            Positioned(
              top: 0,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: const Icon(
                  Icons.error,
                  size: 80,
                  color: Colors.redAccent,
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}
