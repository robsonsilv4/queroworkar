import 'package:flutter/material.dart';
import 'package:quero_workar/data/models/job_model.dart';
import 'package:share_plus/share_plus.dart';

class JobShare extends StatelessWidget {
  final Job job;

  JobShare({required this.job});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Icon(
        Icons.share,
        size: 16,
      ),
      onTap: () {
        return _share(
          context: context,
          url: job.url,
        );
      },
    );
  }

  _share({required BuildContext context, required String url}) {
    final box = context.findRenderObject() as RenderBox?;

    if (box == null) return;

    SharePlus.instance.share(ShareParams(
      text: url,
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
    ));
  }
}
