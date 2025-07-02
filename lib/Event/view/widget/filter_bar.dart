import 'package:flutter/material.dart';

class LocationWidget extends StatefulWidget {
  final List<String> selectedConditions;
  final List<String> allConditions;
  final String selectedCondition;

  const LocationWidget({
    Key? key,
    required this.allConditions,
    required this.selectedCondition,
    required this.selectedConditions,
  }) : super(key: key);

  @override
  _LocationWidgetState createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Autocomplete<String>(
          optionsBuilder: (TextEditingValue value) {
            if (value.text == '') return const Iterable<String>.empty();
            return widget.allConditions.where((condition) =>
                condition.toLowerCase().contains(value.text.toLowerCase()) &&
                !widget.selectedConditions.contains(condition));
          },
          onSelected: (value) {
            setState(() {
              if (!widget.selectedConditions.contains(value)) {
                widget.selectedConditions.add(value);
              }
            });
          },
          fieldViewBuilder:
              (context, controller, focusNode, onEditingComplete) {
            return TextField(
              controller: controller,
              focusNode: focusNode,
              onEditingComplete: onEditingComplete,
              enabled: widget.allConditions.isNotEmpty,
              decoration: InputDecoration(
                hintText: "Search ${widget.selectedCondition}" +
                    (widget.allConditions.isNotEmpty
                        ? " (e.g: ${widget.allConditions.first})"
                        : ""),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: widget.selectedConditions.map((condition) {
            return Chip(
              label: Text(condition),
              onDeleted: () {
                setState(() => widget.selectedConditions.remove(condition));
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
