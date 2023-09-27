import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionScreen extends StatelessWidget {
  final String? imageUrl, title, desc, date, name;
  const DescriptionScreen(
      {Key? key,
      this.date = "",
      this.name = "",
      this.title,
      this.imageUrl,
      this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Image.network(
            imageUrl!,
            fit: BoxFit.cover, // Cover the entire screen
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      maxLines: 5,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      title!,
                      style: GoogleFonts.robotoSlab(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name!,
                          style: GoogleFonts.robotoSlab(
                            textStyle: const TextStyle(
                              color: Color(0XFFf2f2f2),
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        date!,
                        style: GoogleFonts.robotoSlab(
                          textStyle: const TextStyle(
                            color: Color(0XFFf2f2f2),
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    desc!,
                    style: GoogleFonts.robotoSlab(
                      textStyle: const TextStyle(
                        color: Color(0XFFbababa),
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
