import 'package:flutter/material.dart';
import 'package:submission_restaurantapp/app/data/model/common_enum.dart';

class LoadingViewWidget extends StatelessWidget {
  final XStatus status;
  final String errorMessage;
  final Widget? child;
  final Widget Function(String? error)? onError;
  final Widget? onLoading;
  final Widget? onEmpty;
  const LoadingViewWidget({
    Key? key,
    this.status = XStatus.loading,
    this.errorMessage = '',
    this.child,
    this.onError,
    this.onLoading,
    this.onEmpty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, box) {
      switch (status) {
        case XStatus.loading:
          return onLoading ?? Container();
        case XStatus.empty:
          return onEmpty ??
              Center(
                child: Text('Data tidak ditemukan / kosong'),
              );
        case XStatus.error:
          return onError != null
              ? onError!(errorMessage)
              : Center(
                  child: Text('Error: $errorMessage'),
                );
        default:
          return child ?? Container();
      }
    });
  }
}
