import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/assets/constants/colors.dart';
import 'package:productive/features/tasks/presentation/widgets/list_item.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<String> titles = [
    "Commitment resource lecture",
    "Duas",
    "Commitment resource lecture",
    "Commitment resource lecture",
    "Duas",
  ];
  List<String> desc = [
    "We explained the definition of commitment and it..",
    "Allahuma aeni ealaa dikrika wa shukrika wa husn e..",
    "We explained the definition of commitmen..",
    "We explained the definition of commitment and it..",
    "Allahuma aeni ealaa dikrika wa shukrika wa husn e..",
  ];
  List<bool> audio = [false, false, true, false, false];
  List<String?> images = [null, null, "assets/images/gm.png", null, null];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Notes',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Books",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: onBoardingColor),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/notes/book.svg",
                        height: 91,
                      ),
                      const Text(
                        "Password",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: white),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/notes/book_red.svg",
                        height: 91,
                      ),
                      const Text(
                        "Memories",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: white),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/notes/plus-book.svg",
                        height: 91,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const Expanded(
                    child: Text(
                  "Quick Notes",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: onBoardingColor),
                )),
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ListView.builder(
                padding: const EdgeInsets.only(bottom: 24),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: titles.length,
                itemBuilder: (context, index) {
                  return ListItem(
                    title: titles[index],
                    image: images[index],
                    desc: desc[index],
                    date: "15 November",
                    isAudio: audio[index],
                    onDelete: () {
                      titles.removeAt(index);
                      desc.removeAt(index);
                      images.removeAt(index);
                      audio[index];
                      setState(() {});
                    },
                  );
                }),
            const Gap(100),
          ],
        ),
      ),
    );
  }
}
