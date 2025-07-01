import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  List<String> selectedConditions;
  List<String> allConditions;
  String selectedCondition;

  FilterWidget({super.key,required this.allConditions, required this.selectedCondition , required this.selectedConditions});

 
  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  // final List<String> allConditions = [
  //   "Autism",
  //   "FND",
  //   "Anxiety",
  //   "Depression",
  //   "Parkinson’s",
  //   "PTSD",
  //   "Epilepsy",
  //   "ADHD",
  //   "Down Syndrome",
  //   "Cancer"
  // ];


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
              decoration: InputDecoration(
                hintText: "Search ${widget.selectedCondition} (e.g: ${widget.allConditions.first})",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
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
