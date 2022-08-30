import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class LoadingProfileIndexPage extends StatelessWidget {
  const LoadingProfileIndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 214,
          child: Stack(
            children: const [
              UShimmer.dark(child: URectContainer(height: 164)),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: UShimmer.med(child: CircleAvatar(radius: 50))),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              UShimmer.med(child: URectContainer(height: 21)),
              SizedBox(height: 4),
              UShimmer.dark(
                child: URectContainer(height: 18),
              ),
              SizedBox(height: 16),
              UShimmer.med(
                  child: URectContainer(
                height: 40,
                bordRadius: BorderRadius.circular(50),
              )),
              SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        UShimmer.dark(
                          child: URectContainer(height: 15),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...List.generate(
                                3,
                                (index) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      child: UShimmer.light(
                                          child: URectContainer(
                                              height: 24, width: 24)),
                                    ))
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      children: [
                        UShimmer.dark(
                          child: URectContainer(height: 15),
                        ),
                        SizedBox(height: 8),
                        UShimmer.med(
                          child: URectContainer(height: 15),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      children: [
                        UShimmer.dark(
                          child: URectContainer(height: 15),
                        ),
                        SizedBox(height: 8),
                        UShimmer.med(
                          child: URectContainer(height: 15),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 24,
        ),
        UDivider(),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Column(
            children: [
              UShimmer.dark(
                  child: URectContainer(
                height: 24,
              )),
              SizedBox(
                height: 16,
              ),
              UShimmer.med(
                  child: URectContainer(
                height: 45,
              ))
            ],
          ),
        ),
        UDivider(),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => const UDivider(),
            itemBuilder: (context, index) => UShimmer.dark(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: URectContainer(height: 24),
              ),
            ),
            itemCount: 6,
          ),
        ),
      ],
    );
  }
}
