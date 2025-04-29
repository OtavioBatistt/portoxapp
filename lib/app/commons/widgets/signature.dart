import 'package:flutter/material.dart';
import 'package:portox_app/app/commons/adapters/localizations/translate_app.dart';
import 'package:portox_app/app/commons/widgets/asset.dart';
import 'package:signature/signature.dart';
import 'package:portox_app/app/commons/styles/tokens.dart';

enum OxSignatureOrientationEnum { landscape, portrait }

class OxSignature extends StatelessWidget {
  const OxSignature({
    super.key,
    required this.controller,
    this.orientation = OxSignatureOrientationEnum.portrait,
    this.height = 200.00,
  });

  final SignatureController controller;
  final double height;
  final OxSignatureOrientationEnum orientation;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(color: Ox.colors.blue),
            borderRadius: BorderRadius.circular(Ox.radii.ref10)),
        child: Stack(alignment: Alignment.bottomRight, children: [
          Signature(
            key: const Key("signature-drawer"),
            controller: controller,
            width: orientation == OxSignatureOrientationEnum.portrait
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.height,
            height: height,
            backgroundColor: Colors.transparent,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              key: const Key('clear-button'),
              onPressed: controller.clear,
              style: ButtonStyle(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor:
                      MaterialStateProperty.all(Ox.colors.grayLight)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: orientation == OxSignatureOrientationEnum.portrait
                        ? Ox.size.ref50
                        : Ox.size.ref60,
                    width: orientation == OxSignatureOrientationEnum.portrait
                        ? Ox.size.ref50
                        : Ox.size.ref60,
                    child: OxAsset(
                      Ox.assets.iconTrash,
                      color: Ox.colors.blue,
                    ),
                  ),
                  SizedBox(width: Ox.size.ref10),
                  Text(
                    intl(context, 'signature.clear').toUpperCase(),
                    style: TextStyle(
                      fontSize:
                          orientation == OxSignatureOrientationEnum.portrait
                              ? Ox.fontSizes.ref25
                              : Ox.fontSizes.ref40,
                      color: Ox.colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
