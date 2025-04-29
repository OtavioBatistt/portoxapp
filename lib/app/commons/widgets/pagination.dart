import 'package:flutter/material.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';

class OxPagination extends StatelessWidget {
  const OxPagination({
    required this.selectedIndex,
    required this.itemAmount,
    required this.onBackPress,
    required this.onNextPress,
    required this.onItemPress,
    super.key,
    this.maxItems = 5,
  });

  final int selectedIndex;
  final int itemAmount;
  final int maxItems;
  final Function() onBackPress;
  final Function() onNextPress;
  final Function(int index) onItemPress;

  @override
  Widget build(BuildContext context) {
    final style = TextButton.styleFrom(
      shape: const CircleBorder(),
      fixedSize: Size.square(Ox.size.ref120),
      backgroundColor: Colors.transparent,
    );
    final selectedStyle = TextButton.styleFrom(
      shape: const CircleBorder(),
      fixedSize: Size.square(Ox.size.ref120),
      backgroundColor: Ox.colors.blueLight,
    );

    Widget renderText(int? item) => SizedBox(
          height: Ox.size.ref120,
          width: Ox.size.ref120,
          child: TextButton(
            onPressed: item != null ? () => onItemPress(item) : null,
            style: selectedIndex == item ? selectedStyle : style,
            child: Text(
              item != null ? '${item + 1}' : '...',
              style: TextStyle(
                fontSize: Ox.fontSizes.ref60,
                color:
                    selectedIndex == item ? Ox.colors.white : Ox.colors.black,
              ),
            ),
          ),
        );

    Widget handleContent(int index) {
      if (itemAmount <= maxItems) {
        return renderText(index);
      }

      final showRange = [selectedIndex - 1, selectedIndex, selectedIndex + 1];
      final initialRange = [selectedIndex + 2, selectedIndex + 3];
      final finalRange = [selectedIndex - 3, selectedIndex - 2];

      final isInShowRange = showRange.contains(index);
      final isInitialItem =
          (selectedIndex == 0 && initialRange.contains(index)) ||
              (selectedIndex == 1 && index == selectedIndex + 2);
      final isFinalItem =
          (selectedIndex == (itemAmount - 1) && finalRange.contains(index)) ||
              (selectedIndex == (itemAmount - 2) && index == selectedIndex - 2);

      if (isInShowRange || isInitialItem || isFinalItem) {
        return renderText(index);
      }

      if ((selectedIndex == 0 || selectedIndex == itemAmount - 1) &&
          (index == selectedIndex - 4 || index == selectedIndex + 4)) {
        return renderText(null);
      }

      if ((selectedIndex == 1 || selectedIndex == itemAmount - 2) &&
          (index == selectedIndex - 3 || index == selectedIndex + 3)) {
        return renderText(null);
      }

      if ((selectedIndex - 2 == index) || (selectedIndex + 2 == index)) {
        return renderText(null);
      }

      return Container();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: Ox.size.ref120,
          width: Ox.size.ref120,
          child: IconButton(
            onPressed: onBackPress,
            style: style,
            icon: Icon(Icons.arrow_back_ios, size: Ox.size.ref40),
          ),
        ),
        Row(
          children:
              Iterable<int>.generate(itemAmount).map(handleContent).toList(),
        ),
        SizedBox(
          height: Ox.size.ref120,
          width: Ox.size.ref120,
          child: IconButton(
            onPressed: onNextPress,
            style: style,
            icon: Icon(Icons.arrow_forward_ios, size: Ox.size.ref40),
          ),
        )
      ],
    );
  }
}
