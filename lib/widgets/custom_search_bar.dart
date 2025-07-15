import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final VoidCallback? onTap;
  final TextEditingController? controller;

  const CustomSearchBar({
    Key? key,
    this.onTap,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        child: SizedBox(
          height: 48, // fixed height for consistent centering
          child: Center(
            child: IntrinsicWidth(
              child: TextField(
                controller: controller,
                onTap: onTap,
                readOnly: onTap != null,
                textAlign: TextAlign.center,                   // horizontal centering
                textAlignVertical: TextAlignVertical.center,   // vertical centering
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF242424),
                ),
                decoration: InputDecoration(
                  hintText: 'Start your search',
                  hintStyle: const TextStyle(color: Color(0xFF242424)),
                  prefixIcon: const Icon(Icons.search, color: Color(0xFF242424)),
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 0, minHeight: 0,
                  ),
                  border: InputBorder.none,
                  isDense: true,               // remove default vertical padding
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
