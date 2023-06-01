import 'package:flutter/material.dart';
import '../models/job.dart';
import 'icon_text.dart';

class JobItem extends StatefulWidget {
  JobItem({Key? key, required this.job, this.showTime = false})
      : super(key: key);

  final Job job;
  final bool showTime;

  @override
  State<JobItem> createState() => _JobItemState();
}

class _JobItemState extends State<JobItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.pink.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Image.asset(widget.job.logoUrl),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.job.company,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.job.isMark = !widget.job.isMark;
                    // if(selected = true)
                    //   selected=false;
                  });
                },
                child: Container(
                  child: Icon(
                      widget.job.isMark == false
                          ? Icons.bookmark_outline_sharp
                          : Icons.bookmark,
                      color: widget.job.isMark == false
                          ? Colors.black
                          : Colors.pink),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.job.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconText(
                  icon: Icons.location_on_outlined, text: widget.job.location),
              if (widget.showTime)
                IconText(
                    icon: Icons.access_time_outlined, text: widget.job.time)
            ],
          ),
        ],
      ),
    );
  }
}
