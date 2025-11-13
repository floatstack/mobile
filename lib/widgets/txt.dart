import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Txt extends StatefulWidget {
  final String title;
  final Color? color;
  final FontWeight? weight;
  final String? font;
  final double? size;
  final int? lines;
  final FontStyle? style;
  final TextAlign? align;
  final Function()? onTap;

  const Txt({
    super.key,
    required this.title,
    this.color,
    this.weight,
    this.font,
    this.size,
    this.lines,
    this.style,
    this.align,
    this.onTap,
  });

  @override
  State<Txt> createState() => _State();
}

class _State extends State<Txt> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Text(
        softWrap: true,
        overflow: widget.lines == null ? null : TextOverflow.ellipsis,
        widget.title,
        maxLines: widget.lines,
        textAlign: widget.align ?? TextAlign.start,
        style:
            widget.font == 'i'
                ? GoogleFonts.inter(
                  color: widget.color ?? Colors.black,
                  fontSize: widget.size ?? 14,
                  fontStyle: widget.style ?? FontStyle.normal,
                  fontWeight: widget.weight ?? FontWeight.w400,
                )
                : GoogleFonts.rubik(
                  color: widget.color ?? Colors.black,
                  fontSize: widget.size ?? 14,
                  fontStyle: widget.style ?? FontStyle.normal,
                  fontWeight: widget.weight ?? FontWeight.w500,
                ),
      ),
    );
  }
}
