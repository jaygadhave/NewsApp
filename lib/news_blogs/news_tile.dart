import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../description/description_screen.dart';

class NewsTile extends StatelessWidget {
  final String? imageUrl, title, date, name, desc;

  NewsTile({this.imageUrl, this.title, this.date, this.name = "", this.desc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DescriptionScreen(
                    imageUrl: imageUrl,
                    title: title,
                    name: name,
                    date: date,
                    desc: desc,
                  )),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          child: Container(
            child: Stack(alignment: Alignment.bottomCenter, children: [
              Image.network(
                imageUrl!,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text(
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      title!,
                      style: GoogleFonts.robotoSlab(
                        textStyle: const TextStyle(
                          color: Color(0XFFf2f2f2),
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Text(
                          name!,
                          style: GoogleFonts.robotoSlab(
                            textStyle: const TextStyle(
                              color: Color(0XFFbababa),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          date!,
                          style: GoogleFonts.robotoSlab(
                            textStyle: const TextStyle(
                              color: Color(0XFFbababa),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
