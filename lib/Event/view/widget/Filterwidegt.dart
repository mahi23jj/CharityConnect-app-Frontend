import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  final List<String> selectedConditions;
  final List<String> allConditions;
  final String selectedCondition;

  const FilterWidget({
    Key? key,
    required this.allConditions,
    required this.selectedCondition,
    required this.selectedConditions,
  }) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  String? _dropdownValue;

  @override
  Widget build(BuildContext context) {
    // Filter out already selected ones
    List<String> availableOptions = widget.allConditions
        .where((c) => !widget.selectedConditions.contains(c))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          value: _dropdownValue,
          hint: Text("Select ${widget.selectedCondition}"),
          items: availableOptions.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null &&
                !widget.selectedConditions.contains(newValue)) {
              setState(() {
                widget.selectedConditions.add(newValue);
                _dropdownValue = null; // Reset dropdown
              });
            }
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
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
