import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:quero_workar/data/models/job_model.dart';
import 'package:quero_workar/shared/constants/images.dart';
import 'package:quero_workar/shared/constants/qw_theme.dart';
import 'package:quero_workar/shared/widgets/job_share.dart';
import 'package:quero_workar/ui/pages/detail_page.dart';

class JobItem extends StatelessWidget {
  const JobItem({
    required this.job,
    super.key,
  });

  final Job job;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha((0.1 * 255).toInt()),
              blurRadius: 8,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  _CompanyLogoAvatar(
                    imageUrl: job.image,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              job.title,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: QWTheme.title,
                              ),
                            ),
                            const SizedBox(height: 1),
                            Text(
                              // Format date later
                              job.date.toString(),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: <Widget>[
                            GestureDetector(
                              child: Text(
                                'Ver mais...',
                                style: TextStyle(
                                  color: Colors.red.shade700,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onTap: () => _toDetail(
                                context: context,
                                job: job,
                              ),
                            ),
                            const Spacer(),
                            JobShare(
                              job: job,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      onDoubleTap: () => _toDetail(
        job: job,
        context: context,
      ),
      onLongPress: () => _toDetail(
        job: job,
        context: context,
      ),
    );
  }

  void _toDetail({required Job job, required BuildContext context}) {
    unawaited(
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (context) {
            return DetailScreen(
              jobTitle: job.title,
              jobUrl: job.url,
            );
          },
        ),
      ),
    );
  }
}

class _CompanyLogoAvatar extends StatelessWidget {
  const _CompanyLogoAvatar({
    required this.imageUrl,
    // The radius could be passed as parameter if needed
    // ignore: unused_element_parameter
    this.radius = 30.0,
  });

  final String imageUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final size = radius * 2;
    final cacheSize = size.ceil();
    late final placeholder = Image.asset(Images.companyLogo);
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: size,
      height: size,
      memCacheWidth: cacheSize,
      memCacheHeight: cacheSize,
      fit: BoxFit.contain,
      placeholder: (context, url) => placeholder,
      errorWidget: (context, url, error) => placeholder,
      imageBuilder: (context, imageProvider) {
        return CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: imageProvider,
          radius: radius,
        );
      },
    );
  }
}
