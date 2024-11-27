import 'package:flutter/material.dart';

import '../../../../core/app_theme/app_pallete.dart';
import '../../../../core/constants/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController searchEditingController;
  final Function(String)? onSearchSubmitted;
  final Function()? onClearSearch;

  const CustomAppBar({
    super.key,
    required this.searchEditingController,
    this.onSearchSubmitted,
    this.onClearSearch,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppPallete.gradientColor,
      title: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextField(
          style: const TextStyle(
            color: AppPallete.textColor,
            fontWeight: FontWeight.bold,
          ),
          controller: searchEditingController,
          decoration: InputDecoration(
            hintText: Constants.searchField,
            hintStyle: const TextStyle(
              color: AppPallete.textColor,
              fontStyle: FontStyle.italic,
            ),
            suffixIconColor: AppPallete.textColor,
            prefixIconColor: AppPallete.textColor,
            filled: true,
            fillColor: AppPallete.backgroundColor,
            prefixIcon: const Icon(
              Icons.search,
              color: AppPallete.textColor,
            ),
            suffixIcon: searchEditingController.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(
                      Icons.clear,
                    ),
                    onPressed: onClearSearch,
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          ),
          onSubmitted: onSearchSubmitted,
          onChanged: (value) => (context as Element).markNeedsBuild(),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
