import 'package:bloc_2_internet_connectivity_using_cubits_enum/cubits/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<InternetCubit, InternetState>(
            builder: (context, state) {
          if (state == InternetState.GainedState) {
            return Text("Internet Connected!");
          } else if (state == InternetState.LostState) {
            return Text("Internet Not Connected!");
          }
          return Text("Loading...");
        }, listener: (context, state) {
          if (state == InternetState.GainedState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Internet Connected")));
          } else if (state == InternetState.LostState) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Internet Not Connected!")));
          }
        }),
      ),
    );
  }
}
