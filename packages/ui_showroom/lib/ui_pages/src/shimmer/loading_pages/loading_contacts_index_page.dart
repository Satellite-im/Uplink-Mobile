import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class LoadingContactsIndexPage extends StatelessWidget {
  const LoadingContactsIndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topSpacing = MediaQuery.of(context).padding.top;
    return Column(
      children: [
        SizedBox(
          height: topSpacing,
        ),
        const SizedBox(
          height: 20,
        ),
        UShimmer.dark(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    URectContainer(
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(width: 16),
                    URectContainer(
                      height: 27,
                      width: 152,
                    ),
                  ],
                ),
                Row(
                  children: const [
                    URectContainer(
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(width: 24),
                    URectContainer(
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(width: 24),
                    URectContainer(
                      height: 24,
                      width: 24,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 17),
        UShimmer.dark(
          child: Row(
            children: const [
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: URectContainer(
                  height: 21,
                  bordRadius: BorderRadius.horizontal(
                    left: Radius.circular(4),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemBuilder: (context, index) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const UShimmer.med(child: CircleAvatar()),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    children: const [
                      UShimmer.med(child: URectContainer(height: 19)),
                      SizedBox(height: 2),
                      UShimmer.dark(
                        child: URectContainer(
                          height: 18,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            itemCount: 15,
          ),
        ),
      ],
    );
  }
}
