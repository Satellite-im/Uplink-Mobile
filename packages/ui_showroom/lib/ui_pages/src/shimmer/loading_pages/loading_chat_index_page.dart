import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class LoadingChatIndexPage extends StatelessWidget {
  const LoadingChatIndexPage({Key? key}) : super(key: key);

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
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    URectContainer(
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: URectContainer(
                        height: 27,
                      ),
                    ),
                    SizedBox(width: 16),
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
                const SizedBox(height: 17),
                const URectContainer(
                  height: 18,
                  bordRadius: BorderRadius.horizontal(
                    left: Radius.circular(4),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 103,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(16, 16, 0, 24),
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemBuilder: (context, index) => Column(
              children: const [
                UShimmer.med(child: CircleAvatar()),
                SizedBox(
                  height: 8,
                ),
                UShimmer.med(
                    child: URectContainer(
                  height: 15,
                  width: 72,
                )),
              ],
            ),
            itemCount: 5,
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const SizedBox(height: 24),
            itemBuilder: (context, index) => Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                          height: 36,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
