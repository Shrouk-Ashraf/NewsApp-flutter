import 'package:flutter/material.dart';


class CircularIndicator extends StatelessWidget {
  const CircularIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery
            .of(context)
            .size
            .height / 2,
        child: const Center(child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}