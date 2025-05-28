import 'package:flutter/material.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';

class OxAutocomplete extends StatefulWidget {
  const OxAutocomplete({
    required this.options,
    required this.onSelected,
    super.key,
    this.labelText = '',
    this.focusNode,
    this.controller,
    this.validator,
    this.decoration = const InputDecoration(),
    this.initialValue,
    this.maxOptionsToShow = 4,
    this.enabled = true,
    this.readOnly = false,
  });

  final String labelText;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final InputDecoration decoration;
  final TextEditingValue? initialValue;
  final List<String> options;
  final num maxOptionsToShow;
  final bool enabled;
  final bool readOnly;
  final void Function(String value) onSelected;

  @override
  State<StatefulWidget> createState() => _OxAutocompleteState();
}

class _OxAutocompleteState extends State<OxAutocomplete> {
  late TextEditingController _textEditingController;
  late FocusNode _localFocusNode;
  final GlobalKey _autocompleteKey = GlobalKey();
  bool isOpened = false;

  @override
  void initState() {
    super.initState();
    _textEditingController = widget.controller ?? TextEditingController();
    _localFocusNode = FocusNode();

    _localFocusNode.addListener(() {
      setState(() {
        isOpened = _localFocusNode.hasFocus;
      });
    });
    widget.focusNode?.addListener(() {
      if (mounted) {
        setState(() {
          isOpened = widget.focusNode?.hasFocus ?? false;
        });
      }
    });
  }

  @override
  void dispose() {
    _localFocusNode.dispose();
    super.dispose();
  }

  void handleClear() {
    widget.onSelected('');
    _textEditingController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget getSuffixIcon() {
      if (_textEditingController.text.isNotEmpty) {
        return IconButton(
          iconSize: Ox.size.ref40,
          icon: const Icon(Icons.close),
          onPressed: handleClear,
        );
      }

      if (isOpened) {
        return const Icon(Icons.arrow_drop_up);
      }

      return const Icon(Icons.arrow_drop_down);
    }

    return LayoutBuilder(
      builder: (context, constraints) => Container(
        key: const Key('clickable-autocomplete-area'),
        child: RawAutocomplete<String>(
          key: _autocompleteKey,
          focusNode: widget.focusNode ?? _localFocusNode,
          textEditingController: _textEditingController,
          optionsBuilder: (searchText) {
            if (searchText.text.isEmpty) {
              return widget.options.toList();
            }
            return widget.options
                .where(
                  (option) => option
                      .toUpperCase()
                      .contains(searchText.text.toUpperCase()),
                )
                .toList();
          },
          fieldViewBuilder: (
            context,
            fieldTextEditingController,
            fieldFocusNode,
            onFieldSubmitted,
          ) =>
              TextFormField(
            controller: fieldTextEditingController,
            focusNode: fieldFocusNode,
            autocorrect: false,
            enableSuggestions: false,
            onTapOutside: (pointerDownEvent) {
              widget.focusNode?.unfocus();
              _localFocusNode.unfocus();
            },
            keyboardType: TextInputType.text,
            enabled: widget.enabled,
            readOnly: widget.readOnly,
            style: TextStyle(fontSize: Ox.fontSizes.ref40),
            decoration: widget.decoration.copyWith(
              contentPadding: EdgeInsets.only(
                left: Ox.space.ref30,
              ),
              border: const OutlineInputBorder(),
              labelText: widget.labelText.isNotEmpty || widget.labelText == ''
                  ? widget.labelText
                  : intl(context, 'autocomplete.label'),
              suffixIcon: getSuffixIcon(),
            ),
            validator: widget.validator,
          ),
          onSelected: widget.enabled ? widget.onSelected : null,
          optionsViewBuilder: (
            context,
            onSelected,
            options,
          ) =>
              Align(
            alignment: Alignment.topLeft,
            child: Material(
              elevation: Ox.elevation.medium,
              shadowColor: Ox.colors.black,
              child: ConstrainedBox(
                key: const Key('constraints-autocomplete-list-area'),
                constraints: BoxConstraints(
                  maxWidth: constraints.biggest.width,
                  minWidth: constraints.biggest.width,
                  maxHeight: options.length > widget.maxOptionsToShow
                      ? Ox.size.ref140 * widget.maxOptionsToShow
                      : Ox.size.ref140 * options.length,
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.all(4),
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    final option = options.elementAt(index);

                    return GestureDetector(
                      key: const Key('selectable-autocomplete-area'),
                      onTap: widget.enabled
                          ? () {
                              onSelected(option);
                              widget.focusNode?.unfocus();
                              _localFocusNode.unfocus();
                            }
                          : null,
                      child: ListTile(
                        title: Text(
                          option,
                          style: TextStyle(color: Ox.colors.black),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
