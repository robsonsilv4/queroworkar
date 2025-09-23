import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quero_workar/data/models/job_model.dart';
import 'package:share_plus/share_plus.dart';

class JobShare extends StatelessWidget {
  const JobShare({required this.job, super.key});
  final Job job;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: const Icon(
        Icons.share,
        size: 16,
      ),
      onTap: () => _share(context: context, url: job.url),
    );
  }

  Future<void> _share({
    required BuildContext context,
    required String url,
  }) async {
    final box = context.findRenderObject() as RenderBox?;

    if (box == null) return;

    unawaited(
      SharePlus.instance.share(
        ShareParams(
          text: url,
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
        ),
      ),
    );
  }
}
