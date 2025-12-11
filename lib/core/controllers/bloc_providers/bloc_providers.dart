import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

class BlocProviders extends StatelessWidget {
  const BlocProviders({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
      final providers = <SingleChildWidget>[];

  if (providers.isEmpty) {
    return child;
  }
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (context) {
        //     final loginCubit = LoginCubit(
        //         userLoginRepository:
        //             RepositoryProvider.of<UserLoginRepository>(context));

        //     Provider.of<ApiClient>(context, listen: false).loginCubit =
        //         loginCubit;
        //     return loginCubit;
        //   },
        // ),
      ],
      child: ChildWidget(child: child),
    );
  }
}

class ChildWidget extends StatelessWidget {
  const ChildWidget({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
