import 'package:flutter/material.dart';
import 'package:test_interview/core/constants/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EnterButton extends StatefulWidget {
  const EnterButton({Key? key, required this.status}) : super(key: key);
  final String status;

  @override
  State<EnterButton> createState() => _EnterButtonState();
}

class _EnterButtonState extends State<EnterButton> {
  bool done = false;
  @override
  void initState() {
    if (widget.status.contains("تایید")) {
      done = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          done
              ? SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                )
              : const Text(""),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 13.0, vertical: 5.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: Constants.navyBlue, width: 2)),
            child: Text(
              AppLocalizations.of(context)!.enter,
              style: TextStyle(color: Constants.navyBlue),
            ),
          ),
          done
              ? Column(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: const Color(0xFF1CAE81),
                      size: MediaQuery.of(context).size.width / 9,
                    ),
                    Text(AppLocalizations.of(context)!.done,
                        style: const TextStyle(
                            color: Color(0xFF1CAE81), fontSize: 10)),
                  ],
                )
              : const Text("")
        ],
      ),
    );
  }
}
