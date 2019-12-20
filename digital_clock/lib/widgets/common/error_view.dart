import 'package:digital_clock/widgets/common/info_view.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class ErrorView extends InfoMessageView {
  static final Key tryAgainButtonKey = new Key('tryAgainButton');

  ErrorView({
    String title,
    String description,
    @required VoidCallback onRetry,
  })
      : super(
    actionButtonKey: tryAgainButtonKey,
    title: title ?? 'Oops!',
    description:
    description ?? 'There was an error while\nloading movies.',
    onActionButtonTapped: onRetry,
  );
}