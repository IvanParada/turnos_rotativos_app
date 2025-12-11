import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

class RepositoryProviders extends StatelessWidget {
  const RepositoryProviders({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
      final providers = <SingleChildWidget>[];

  if (providers.isEmpty) {
    return child;
  }
    return MultiRepositoryProvider(
      providers: [
        // RepositoryProvider<UserLoginRepository>(
        //   create: (context) => UserLoginRepository(
        //     userLoginDatasource: Provider.of<UserLoginDatasource>(
        //       context,
        //       listen: false,
        //     ),
        //     secureStorageClient: Provider.of<SecureStorageClient>(
        //       context,
        //       listen: false,
        //     ),
        //   ),
        // ),
      ],
      child: child,
    );
  }
}
