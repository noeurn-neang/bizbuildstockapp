import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core/constants/dimens.dart';
import 'package:flutter_core/getx.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../utils/common_utils.dart';
import '../bar_code_scanner.dart';
import '../input_field/custom_input_form_field.dart';

class SearchDialog extends StatefulWidget {
  final List<String>? dropdownlist;
  SearchDialog(
      {super.key,
      this.dropdownlist,
      this.onChange,
      this.controller,
      this.onDetect,
      this.isSearchByDate});
  final Function(String? loc, DateTime? startDate, DateTime? endTime)? onChange;
  final TextEditingController? controller;
  final Function(BarcodeCapture)? onDetect;
  final bool? isSearchByDate;
  String? selectedLoc;
  DateTime? startDate;
  DateTime? endDate;

  SearchDialog.withDate(
      {super.key,
      this.dropdownlist,
      this.onChange,
      this.controller,
      this.selectedLoc,
      this.startDate,
      this.endDate})
      : isSearchByDate = true,
        onDetect = null;

  @override
  State<SearchDialog> createState() => _StateSearchDialog();
}

class _StateSearchDialog extends State<SearchDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(15),
          ),
          child: DropdownButton<String>(
              underline: Container(),
              isExpanded: true,
              focusColor: Colors.amber,
              value: widget.selectedLoc,
              //elevation: 5,
              style: TextStyle(color: Colors.cyan),
              iconEnabledColor: Colors.black,
              items: widget.dropdownlist
                  ?.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
              hint: const Text(
                "Please select the location",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              onChanged: (value) {
                widget.onChange!(value, widget.startDate, widget.endDate);
                setState(() {
                  widget.selectedLoc = value ?? '';
                });
              }),
        ),
        Dimens.vml,
        if (!(widget.isSearchByDate ?? false)) ...[
          CustomInputFormField(
            controller: widget.controller,
            label: Text('Barcode'),
            placeHolder: 'Barcode search',
            suffixIcon: IconButton(
              onPressed: () {
                Get.to(
                  BarCoderScannerWithController(
                    onDetect: widget.onDetect ?? (barcodeCapture) => {},
                  ),
                );
              },
              icon: Icon(Icons.qr_code),
            ),
          ),
        ],
        if (widget.isSearchByDate ?? false) ...[
          Row(
            children: [
              Flexible(
                  child: InkWell(
                child: Container(
                    width: 200,
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.surfaceVariant,
                    ),
                    child: Text(formatDateToString(
                        widget.startDate ?? DateTime.now()))),
                onTap: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: 250,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text('Done')),
                              Expanded(child: CupertinoDatePicker(
                                  onDateTimeChanged: (dateTime) {
                                setState(() {
                                  widget.startDate = dateTime;
                                });
                                widget.onChange!(widget.selectedLoc, dateTime,
                                    widget.endDate);
                              }))
                            ],
                          ),
                        );
                      });
                },
              )),
              Dimens.hml,
              Flexible(
                  child: InkWell(
                child: Container(
                    width: 200,
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.surfaceVariant,
                    ),
                    child: Text(
                        formatDateToString(widget.endDate ?? DateTime.now()))),
                onTap: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: 250,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: Text('Done')),
                              Expanded(
                                child: CupertinoDatePicker(
                                  minimumDate: widget.startDate,
                                  onDateTimeChanged: (dateTime) {
                                    setState(() {
                                      widget.endDate = dateTime;
                                    });
                                    widget.onChange!(widget.selectedLoc,
                                        widget.startDate, dateTime);
                                  },
                                ),
                              )
                            ],
                          ),
                        );
                      });
                },
              )),
            ],
          )
        ]
      ],
    );
  }
}
