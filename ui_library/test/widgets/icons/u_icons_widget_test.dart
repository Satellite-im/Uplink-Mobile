

      testWidgets('renders WeatherEmpty for WeatherStatus.initial',
          (tester) async {
        when(() => weatherCubit.state).thenReturn(WeatherState());
        await tester.pumpWidget(BlocProvider.value(
          value: weatherCubit,
          child: _L10nTest(WeatherView()),
        ));
        expect(find.byType(WeatherEmpty), findsOneWidget);
      });