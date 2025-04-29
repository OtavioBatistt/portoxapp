import 'package:flutter/material.dart';
import 'package:portox_app/app/commons/domain/checklist_seal_entity.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';

class OxChecklistSeals extends StatelessWidget {
  const OxChecklistSeals({
    super.key,
    required this.seals,
    required this.onRemoveSeal,
  });

  final List<ChecklistSealEntity> seals;
  final void Function(int sealIndex) onRemoveSeal;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // height: Ox.size.ref800.h,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: seals.length,
        separatorBuilder: (context, index) => SizedBox(height: Ox.space.ref10),
        itemBuilder: (context, index) {
          final seal = seals[index];

          return DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Ox.colors.blue),
              borderRadius: BorderRadius.circular(Ox.radii.ref10),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                left: Ox.space.ref40,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    seal.code.toUpperCase(),
                    style: TextStyle(color: Ox.colors.black),
                  ),
                  IconButton(
                    onPressed: () => onRemoveSeal(index),
                    icon: Icon(
                      Icons.close,
                      color: Ox.colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
