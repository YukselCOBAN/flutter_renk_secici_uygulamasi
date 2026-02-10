import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_renk_secici_uygulamasi/constants/colors.dart';
import 'package:flutter_renk_secici_uygulamasi/widgets/color_display.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ColorPickerPage extends StatefulWidget {
  const ColorPickerPage({super.key});

  @override
  State<ColorPickerPage> createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends State<ColorPickerPage> {
  Color selectedColor = Colors.blue;
  bool isCircular = false;
  bool isShowColorName = true;

  void _rastgeleRenkSec() {
    final colors = renkler.keys.toList();
    final rastgeleIndex = Random().nextInt(colors.length);
    final randomColor = colors[rastgeleIndex]; // Rastgele index seçtik.
    setState(() {
      selectedColor = randomColor;
      debugPrint(
        rastgeleIndex.toString(),
      ); // rastgeleIndex integer olduğu için casting
    });
  }

  void _renginKodunuGosterToastMessage() {
    Fluttertoast.showToast(
      msg:
          // ignore: deprecated_member_use
          "RGB: (${selectedColor.red},${selectedColor.green},${selectedColor.blue})",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: selectedColor,
      textColor: Colors.white,
      fontSize: 24.0,
    );
  }

  void _containerSekliniDegistir() {
    setState(() {
      isCircular =
          !isCircular; // Değeri true ise false,false ise true olacak butona basıldıkça.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Renk Seçici"),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                isShowColorName = !isShowColorName;
              });
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: "a", // Popup ekran görünmesi için
                  child: Row(
                    children: [
                      Icon(
                        isShowColorName
                            ? Icons.visibility_off
                            : Icons.visibility,
                        size: 20,
                        color: Colors.black54,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        isShowColorName
                            ? "Renk Adını Gizle "
                            : "Renk Adını Göster",
                      ),
                    ],
                  ),
                ),
              ];
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ColorDisplay(
                selectedColor: selectedColor,
                isCircular: isCircular,
              ),
              SizedBox(height: 10),
              isShowColorName
                  ? Text(renkler[selectedColor] ?? "Seçilen Renk")
                  : SizedBox(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropdownButton<Color>(
                      value:
                          selectedColor, //Bunu atamazsak ekrandaki değişiklik gerçekleşmez
                      items: renkler.entries.map((entry) {
                        return DropdownMenuItem(
                          value: entry
                              .key, // Bunu(value) mutlaka yazmalısın yoksa ekranda görünmüyor! key->renkler,value->isimleri(map->key-value eşleşmesi için kullanıldı)
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                color: entry.key,
                              ), // * minik renk containerleri
                              SizedBox(width: 4),
                              Text(entry.value),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedColor = value!;
                        });
                      },
                    ),
                    ElevatedButton(
                      onPressed: _rastgeleRenkSec,

                      child: Text("Rastgele"),
                    ),
                    IconButton(
                      onPressed: _renginKodunuGosterToastMessage,
                      icon: Icon(Icons.info),
                    ),
                    IconButton(
                      onPressed: () {
                        _containerSekliniDegistir();
                      },
                      icon: Icon(
                        isCircular ? Icons.crop_square : Icons.circle_outlined,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
