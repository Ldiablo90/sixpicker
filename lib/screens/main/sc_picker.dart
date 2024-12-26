import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sixpicker/mvvm/view_model/vm_local.dart';
import 'package:sixpicker/mvvm/view_model/vm_picker.dart';
import 'package:sixpicker/router/route_path.dart';
import 'package:sixpicker/screens/main/widget/w_pick_ball.dart';
import 'package:sixpicker/screens/public/widget/w_button_fit.dart';
import 'package:sixpicker/screens/public/widget/w_scaffold.dart';

class Picker extends ConsumerStatefulWidget {
  const Picker({super.key});

  @override
  ConsumerState createState() => _PickerState();
}

class _PickerState extends ConsumerState<Picker> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){FocusManager.instance.primaryFocus?.unfocus();},
      child: BaseScaffold(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 10,
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    maxLength: 20,
                    decoration: const InputDecoration(counterText: ""),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
                const Spacer(flex: 1),
                ElevatedButton(
                  onPressed: () {ref.read(vmPicker.notifier).setSeed(context, seed: controller.text);},
                  child: Text("Set Seed"),
                ),
              ],
            ),
            const Spacer(flex: 2),
            Row(children: [Text("Seed : ${ref.watch(vmPicker).seed}", style: const TextStyle(fontSize: 18),)]),
            if(ref.watch(vmPicker).pickType > 2)
            Row(children: [Text("Location : ${ref.watch(vmLocal).latitude} /  ${ref.watch(vmLocal).longitude}", style: const TextStyle(fontSize: 18),)]),
            const Spacer(flex: 2),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [Text("make : ${ref.watch(vmPicker).ymd}")]),
            Row(
              children: [
                Text("Type : ${ref.watch(vmPicker).seed}", style: const TextStyle(fontSize: 18)),
                Expanded(
                  child: DropdownButtonHideUnderline(child: DropdownButton(
                      value: ref.watch(vmPicker).pickType,
                      alignment: AlignmentDirectional.topStart,
                      dropdownColor: Colors.grey.shade200,
                      items: const [
                        DropdownMenuItem(value: 0, child: Text("")),
                        DropdownMenuItem(value: 1, child: Text("Seed")),
                        DropdownMenuItem(value: 2, child: Text("Seed + Time")),
                        DropdownMenuItem(value: 3, child: Text("Seed + Location")),
                        DropdownMenuItem(value: 4, child: Text("Seed + Time + Location")),
                  ], onChanged: ref.read(vmPicker.notifier).setPickType)),
                ),
              ],
            ),
            const Spacer(flex: 2),
            Row(
              children: [
                ButtonFit(
                  flex: 5,
                  onTap: (){ref.read(vmPicker.notifier).initPickData();},
                  child: _buttonBox("Data Reset"),
                ),
                const Spacer(),
                ButtonFit(
                  flex: 5,
                  onTap: (){ref.read(vmPicker.notifier).setPickData(context);},
                  child: _buttonBox("Pick Data"),
                ),
              ],
            ),
            const Spacer(flex: 3),
            Wrap(
              runSpacing: 10,
              children: ref.watch(vmPicker).pickData.map(
                    (pickData) => Row(
                  children: pickData
                      .map(
                        (data) => Expanded(
                      child: Center(
                        child: PickBall(pick: data),
                      ),
                    ),
                  )
                      .toList(),
                ),
              ).toList(),
            ),
            const Spacer(flex: 3),
            Row(
              children: [
                ButtonFit(
                  onTap: (){context.push(PathBill.path);},
                  child: _buttonBox("Bill View"),
                ),
              ],
            ),
            const Spacer(flex: 15),
          ],
        ),
      ),
    );
  }

  Widget _buttonBox(String text){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99),
        color: Colors.grey.shade200,
        boxShadow: const [BoxShadow(color: Colors.grey,offset: Offset(.5, 1),blurRadius: 3)]
      ),
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Center(
        child:  Text(text),
      ),
    );
  }
}
