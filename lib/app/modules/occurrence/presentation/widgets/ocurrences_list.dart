import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:portox_app/app/commons/adapters/services/formatters/date_formatter_service_adapter.dart';
import 'package:portox_app/app/commons/domain/occurrence_entity.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';
import 'package:portox_app/app/modules/occurrence/presentation/stores/occurrence_store.dart';

class OxOccurrencesList extends StatefulWidget {
  const OxOccurrencesList({
    required this.occurrences,
    required this.onTapOccurrence,
    super.key,
  });

  final List<OccurrenceEntity> occurrences;
  final void Function(OccurrenceEntity occurrence) onTapOccurrence;

  @override
  State<OxOccurrencesList> createState() => _OxOccurrencesListState();
}

class _OxOccurrencesListState extends State<OxOccurrencesList> {
  late OccurrenceStore store;
  late IDateServiceAdapter dateAdapter;
  @override
  void initState() {
    super.initState();
    store = Modular.get<OccurrenceStore>();
    dateAdapter = Modular.get<IDateServiceAdapter>();
  }

  String _formatDate(DateTime date) {
    final hourMinute = dateAdapter.formatHourMinute(date);
    final dayMonth = dateAdapter.formatDayMonthYear(date);
    return '$dayMonth - $hourMinute';
  }

  @override
  Widget build(BuildContext context) => Expanded(
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: widget.occurrences.length,
          separatorBuilder: (context, index) =>
              SizedBox(height: Ox.space.ref30),
          itemBuilder: (context, index) {
            final occurrence = widget.occurrences[index];

            return Material(
              elevation: Ox.elevation.medium,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Ox.radii.ref10),
                side: BorderSide(color: Ox.colors.blue),
              ),
              child: ListTile(
                onTap: () => widget.onTapOccurrence(occurrence),
                title: Text(
                  _formatDate(DateTime.parse(occurrence.createdAt))
                      .replaceAll(' ', '\u{00A0}')
                      .replaceAll('-', '\u{2011}'),
                  style: TextStyle(
                    color: Ox.colors.blue,
                    fontWeight: Ox.fontWeights.bold,
                    fontSize: Ox.fontSizes.ref45,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                subtitle: Text(
                  store
                      .getOccurrenceDescriptionById(occurrence.type)
                      .replaceAll(' ', '\u{00A0}')
                      .replaceAll('-', '\u{2011}'),
                  style: TextStyle(
                    color: Ox.colors.blue,
                    fontSize: Ox.fontSizes.ref45,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                trailing: Icon(
                  Icons.remove_red_eye,
                  color: Ox.colors.gray,
                  size: Ox.size.ref80,
                ),
              ),
            );
          },
        ),
      );
}
