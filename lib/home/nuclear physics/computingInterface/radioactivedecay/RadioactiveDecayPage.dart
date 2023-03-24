// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nuclearphysicssimple/accessories/emisson.dart';
import 'package:nuclearphysicssimple/accessories/periodicTable.dart';
import 'package:nuclearphysicssimple/design/colors.dart';
import 'package:nuclearphysicssimple/design/fontSize.dart';

import 'package:slidable_button/slidable_button.dart';

class RadioactiveDecayPage extends StatefulWidget {
  const RadioactiveDecayPage({Key? key}) : super(key: key);

  @override
  State<RadioactiveDecayPage> createState() => _RadioactiveDecayPageState();
}

class _RadioactiveDecayPageState extends State<RadioactiveDecayPage> {
  TextEditingController licenseNumberController = TextEditingController();
  TextEditingController relativeMassController = TextEditingController();

  String name = '';
  String relative_mass = '';
  String chemical_sign = '';
  String license_number = '';

  final drpPeriodicTable = [
    'H - Hidrogén',
    'He - Hélium',
    'Li - Lítium',
    'Be - Berillium',
    'B - Bór',
    'C - Szén',
    'N - Nitrogén',
    'O - Oxigén',
    'F - Flour',
    'Ne - Neon',
    'Na - Nátrium',
    'Mg - Magnézium',
    'Al - Alumínium',
    'Si - Szilícium',
    'P - Foszfor',
    'S - Kén',
    'Cl - Klór',
    'Ar - Argon',
    'K - Kálium',
    'Ca - Kálcium',
    'Sc - Szkandium',
    'Ti - Titán',
    'V - Vanádium',
    'Cr - Króm',
    'Mn - Mangán',
    'Fe - Vas',
    'Co - Kobalt',
    'Ni - Nikkel',
    'Cu - Réz',
    'Zn - Cink',
    'Ga - Gallium',
    'Ge - Germánium',
    'As - Arzén',
    'Se - Szelén',
    'Br - Bróm',
    'Kr - Kripton',
    'Rb - Rubídium',
    'Sr - Stroncium',
    'Y - Ittrium',
    'Zr - Cirkónium',
    'Nb - Nióbium',
    'Mo - Molibdén',
    'Te - Technécium',
    'Ru - Ruténium',
    'Rh - Ródium',
    'Pd - Palládium',
    'Ag - Ezüst',
    'Cd - Kadmium',
    'In - Indium',
    'Sn - Ón',
    'Sb - Antimon',
    'Te - Tellúr',
    'I - Jód',
    'Xe - Xenon',
    'Cs - Cézium',
    'Ba - Bárium',
    'La - Lantán',
    'Ce - Cérium',
    'Pr - Prazeodímium',
    'Nd - Neodímium',
    'Rm - Prométium',
    'Sm - Szamárium',
    'Eu - Európium',
    'Gd - Gadolínium',
    'Tb - Terbium',
    'Dy - Diszprózium',
    'Ho - Holmium',
    'Er - Erbrium',
    'Tm - Túlium',
    'Yb - Itterbium',
    'Lu - Lutécium',
    'Hf - Hafnium',
    'Ta - Tantál',
    'W - Volfrám',
    'Re - Rénium',
    'Os - Ozmium',
    'Ir - Iridium',
    'Pt - Platina',
    'Au - Arany',
    'Hg - Higany',
    'Tl - Tallium',
    'Pb - Ólom',
    'Bi - Bizmut',
    'Po - Polónium',
    'At - Asztáncium',
    'Rn - Radon',
    'Fr - Francium',
    'Ra - Rádium',
    'Ac - Aktínium',
    'Th - Tórium',
    'Pa - Proaktínium',
    'U - Urán',
    'Np - Neptúnium',
    'Pu - Plutónium',
    'Am - Amerícium',
    'Cm - Kűrium',
    'Bk - Berkélium',
    'Cf - Kalifornium',
    'Es - Einsteinium',
    'Fm - Ferimium',
    'Md - Mendelévium',
    'No - Nobélium',
    'Lr - Laurencium',
    'Rf - Raderfordium',
    'Db - Dubnium',
    'Sg - Sziborgium',
    'Bh - Bohrium',
    'Hs - Hasszium',
    'Mt - Mietnerium',
    'Ds - Darstadtium',
    'Rg - Röntgénium',
    'Cn - Kopernícium',
    'Nh - Nihónium',
    'Fl - Fleróvium',
    'Mc - Moszkóvium',
    'Lv - Livermórium',
    'Ts - Tenesszium',
    'Og - Oganeszon'
  ];

  String? selectedItem;

  int? emissionNumber;

  var numberForm = NumberFormat("##0");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Nuclear Physics Simple'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () => Navigator.of(context).pop(),
            ),
            expandedHeight: 125.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero,
              title: Container(
                height: 49.0,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.bottomLeft,
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.5),
                child: Text(
                  'Radioaktív bomlás:',
                  style: GoogleFonts.dosis(
                      textStyle: TextStyle(
                          color: textTitle,
                          fontSize: subtitle,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 140.0,
                        width: 140.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 15.0),
                        decoration: BoxDecoration(
                            color: deepLightBlue,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                    top: 15.0, left: 15.0),
                                child: Text(relative_mass,
                                    style: GoogleFonts.getFont('Dosis',
                                        textStyle: TextStyle(
                                            color: textAtom,
                                            fontSize: indexes))),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(chemical_sign,
                                    style: GoogleFonts.getFont('Dosis',
                                        textStyle: TextStyle(
                                            color: textAtom,
                                            fontSize: chemicalSign))),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(name,
                                    style: GoogleFonts.getFont('Dosis',
                                        textStyle: TextStyle(
                                            color: textAtom,
                                            fontSize: chemicalName))),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                margin: const EdgeInsets.only(
                                    bottom: 15.0, left: 15.0),
                                child: Text(license_number,
                                    style: GoogleFonts.getFont('Dosis',
                                        textStyle: TextStyle(
                                            color: textAtom,
                                            fontSize: indexes))),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          FloatingActionButton.small(
                            heroTag: 'btnAlfa',
                            onPressed: () {
                              if (license_number.isNotEmpty ||
                                  licenseNumberController.text.isNotEmpty) {
                                setState(() {
                                  if (int.parse(license_number) > 2) {
                                    emissionNumber = 1;
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            backgroundColor: errorBackground,
                                            content: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'A keletkező atom nem megtalálható a\nperiódusos rendszerben!',
                                                  style: GoogleFonts.getFont(
                                                      'Dosis',
                                                      textStyle: TextStyle(
                                                          color: errorText,
                                                          fontSize: error)),
                                                ),
                                              ],
                                            )));
                                  }
                                });
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        backgroundColor: errorBackground,
                                        content: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Kiindulási anyag nélkül nem lehet sugározni!',
                                              style: GoogleFonts.getFont(
                                                  'Dosis',
                                                  textStyle: TextStyle(
                                                      color: errorText,
                                                      fontSize: error)),
                                            ),
                                          ],
                                        )));
                              }
                            },
                            backgroundColor: emissionNumber == 1
                                ? deepLightBlue
                                : deepPurple,
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                emission[1]['chemical_sign'].toString(),
                                style: GoogleFonts.getFont(
                                  'Dosis',
                                  textStyle: TextStyle(
                                      color: textAtom, fontSize: indexes),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 2.5,
                          ),
                          FloatingActionButton.small(
                            heroTag: 'btnBeta',
                            onPressed: () {
                              if (license_number.isNotEmpty ||
                                  licenseNumberController.text.isNotEmpty) {
                                setState(() {
                                  if (int.parse(license_number) < 119) {
                                    emissionNumber = 2;
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            backgroundColor: errorBackground,
                                            content: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'A keletkező atom nem megtalálható a\nperiódusos rendszerben!',
                                                  style: GoogleFonts.getFont(
                                                      'Dosis',
                                                      textStyle: TextStyle(
                                                          color: errorText,
                                                          fontSize: error)),
                                                ),
                                              ],
                                            )));
                                  }
                                });
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        backgroundColor: errorBackground,
                                        content: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Kiindulási anyag nélkül nem lehet sugározni!',
                                              style: GoogleFonts.getFont(
                                                  'Dosis',
                                                  textStyle: TextStyle(
                                                      color: errorText,
                                                      fontSize: error)),
                                            ),
                                          ],
                                        )));
                              }
                            },
                            backgroundColor: emissionNumber == 2
                                ? deepLightBlue
                                : deepPurple,
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                emission[2]['chemical_sign'].toString(),
                                style: GoogleFonts.getFont(
                                  'Dosis',
                                  textStyle: TextStyle(
                                      color: textAtom, fontSize: indexes),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 2.5,
                          ),
                          FloatingActionButton.small(
                            heroTag: '-btnBeta',
                            onPressed: () {
                              if (license_number.isNotEmpty ||
                                  licenseNumberController.text.isNotEmpty) {
                                setState(() {
                                  if (int.parse(license_number) > 1) {
                                    emissionNumber = 3;
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            backgroundColor: errorBackground,
                                            content: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'A keletkező atom nem megtalálható a\nperiódusos rendszerben!',
                                                  style: GoogleFonts.getFont(
                                                      'Dosis',
                                                      textStyle: TextStyle(
                                                          color: errorText,
                                                          fontSize: error)),
                                                ),
                                              ],
                                            )));
                                  }
                                });
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        backgroundColor: errorBackground,
                                        content: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Kiindulási anyag nélkül nem lehet sugározni!',
                                              style: GoogleFonts.getFont(
                                                  'Dosis',
                                                  textStyle: TextStyle(
                                                      color: errorText,
                                                      fontSize: error)),
                                            ),
                                          ],
                                        )));
                              }
                            },
                            backgroundColor: emissionNumber == 3
                                ? deepLightBlue
                                : deepPurple,
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                emission[3]['chemical_sign'].toString(),
                                style: GoogleFonts.getFont(
                                  'Dosis',
                                  textStyle: TextStyle(
                                      color: textAtom, fontSize: indexes),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 2.5,
                          ),
                          FloatingActionButton.small(
                            heroTag: 'btnGamma',
                            onPressed: () {
                              setState(() {
                                if (license_number.isNotEmpty ||
                                    licenseNumberController.text.isNotEmpty) {
                                  setState(() {
                                    if (int.parse(license_number) > 0) {
                                      emissionNumber = 4;
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              backgroundColor: errorBackground,
                                              content: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'A keletkező atom nem megtalálható a\nperiódusos rendszerben!',
                                                    style: GoogleFonts.getFont(
                                                        'Dosis',
                                                        textStyle: TextStyle(
                                                            color: errorText,
                                                            fontSize: error)),
                                                  ),
                                                ],
                                              )));
                                    }
                                  });
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          backgroundColor: errorBackground,
                                          content: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Kiindulási anyag nélkül nem lehet sugározni!',
                                                style: GoogleFonts.getFont(
                                                    'Dosis',
                                                    textStyle: TextStyle(
                                                        color: errorText,
                                                        fontSize: error)),
                                              ),
                                            ],
                                          )));
                                }
                              });
                            },
                            backgroundColor: emissionNumber == 4
                                ? deepLightBlue
                                : deepPurple,
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 5.0),
                              child: Text(
                                emission[4]['chemical_sign'].toString(),
                                style: GoogleFonts.getFont(
                                  'Dosis',
                                  textStyle: TextStyle(
                                      color: textAtom, fontSize: indexes),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 140.0,
                        width: 140.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 15.0),
                        decoration: BoxDecoration(
                            color: deepLightBlue,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(
                                    top: 15.0, left: 15.0),
                                child: Text(
                                  relative_mass.isNotEmpty &&
                                          emissionNumber != null
                                      ? (int.parse(relative_mass).toInt() +
                                              emission[emissionNumber!]
                                                  ['relative_mass_effect'])
                                          .toString()
                                      : '',
                                  style: GoogleFonts.getFont(
                                    'Dosis',
                                    textStyle: TextStyle(
                                        color: textAtom, fontSize: indexes),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  license_number.isNotEmpty &&
                                          emissionNumber != null
                                      ? periodicTable[int.parse(license_number)
                                                      .toInt() +
                                                  emission[emissionNumber!]
                                                      ['license_number_effect']]
                                              ['chemical_sign']
                                          .toString()
                                      : '',
                                  style: GoogleFonts.getFont(
                                    'Dosis',
                                    textStyle: TextStyle(
                                        color: textAtom,
                                        fontSize: chemicalSign),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                    license_number.isNotEmpty &&
                                            emissionNumber != null
                                        ? periodicTable[int.parse(license_number)
                                                        .toInt() +
                                                    emission[emissionNumber!][
                                                        'license_number_effect']]
                                                ['name']
                                            .toString()
                                        : '',
                                    style: GoogleFonts.getFont('Dosis',
                                        textStyle: TextStyle(
                                            color: textAtom,
                                            fontSize: chemicalName))),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.bottomLeft,
                                margin: const EdgeInsets.only(
                                    bottom: 15.0, left: 15.0),
                                child: Text(
                                  license_number.isNotEmpty &&
                                          emissionNumber != null
                                      ? (int.parse(license_number).toInt() +
                                              emission[emissionNumber!]
                                                  ['license_number_effect'])
                                          .toString()
                                      : '',
                                  style: GoogleFonts.getFont(
                                    'Dosis',
                                    textStyle: TextStyle(
                                        color: textAtom, fontSize: indexes),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 2.5, horizontal: 5.0),
                    padding: const EdgeInsets.all(8.0),
                    height: 40.0,
                    decoration: BoxDecoration(
                        color: deepLightBlue,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                          dropdownColor: deepLightBlue,
                          value: selectedItem,
                          hint: Text('A kiindulási anyag atommagja',
                              style: TextStyle(
                                  color: textAtom, fontSize: itemsDrp)),
                          items: drpPeriodicTable.map(buildMenuItem).toList(),
                          onChanged: (value) => setState(
                                () {
                                  selectedItem = value!;
                                  int license =
                                      drpPeriodicTable.indexOf(value) + 1;
                                  emissionNumber = null;
                                  name =
                                      periodicTable[license]['name'].toString();
                                  relative_mass = numberForm
                                      .format(periodicTable[license]
                                          ['relative_mass'])
                                      .toString();
                                  chemical_sign = periodicTable[license]
                                          ['chemical_sign']
                                      .toString();
                                  license_number = periodicTable[license]
                                          ['license_number']
                                      .toString();
                                },
                              )),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 2.5, horizontal: 5.0),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 2.5, horizontal: 0.0),
                      child: TextField(
                          controller: licenseNumberController,
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          textAlignVertical: TextAlignVertical.center,
                          cursorColor: cursor,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: deepLightBlue,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            prefixIcon: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 11.5, horizontal: 5.0),
                              child: Text(
                                'Az atommag rendszáma:',
                                style: GoogleFonts.getFont('Dosis',
                                    textStyle: TextStyle(
                                        color: textInput, fontSize: input)),
                              ),
                            ),
                            suffixIcon: IconButton(
                                icon: const Icon(Icons.send),
                                color: iconSend,
                                onPressed: () => setState(() {
                                      if (licenseNumberController
                                          .text.isNotEmpty) {
                                        int license = int.parse(
                                            licenseNumberController.text);
                                        if (license >= 1 && license < 118) {
                                          emissionNumber = null;
                                          name = periodicTable[license]['name']
                                              .toString();
                                          relative_mass = numberForm
                                              .format(periodicTable[license]
                                                  ['relative_mass'])
                                              .toString();
                                          chemical_sign = periodicTable[license]
                                                  ['chemical_sign']
                                              .toString();
                                          license_number =
                                              periodicTable[license]
                                                      ['license_number']
                                                  .toString();
                                          selectedItem =
                                              drpPeriodicTable[license -= 1];
                                        }
                                        if (license < 1) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  backgroundColor:
                                                      errorBackground,
                                                  content: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Az érték túl kicsi! Az értéknek 1 és 118 között kell lennie.',
                                                        style: GoogleFonts.getFont(
                                                            'Dosis',
                                                            textStyle: TextStyle(
                                                                color:
                                                                    errorText,
                                                                fontSize:
                                                                    error)),
                                                      ),
                                                    ],
                                                  )));
                                        }
                                        if (license > 118) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  backgroundColor:
                                                      errorBackground,
                                                  content: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Az érték túl nagy! Az értéknek 1 és 118 között kell lennie.',
                                                        style: GoogleFonts.getFont(
                                                            'Dosis',
                                                            textStyle: TextStyle(
                                                                color:
                                                                    errorText,
                                                                fontSize:
                                                                    error)),
                                                      ),
                                                    ],
                                                  )));
                                        }
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                backgroundColor:
                                                    errorBackground,
                                                content: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'A rendszám mező nem lehet üres beküldés esetén!',
                                                      style: GoogleFonts.getFont(
                                                          'Dosis',
                                                          textStyle: TextStyle(
                                                              color: errorText,
                                                              fontSize: error)),
                                                    ),
                                                  ],
                                                )));
                                      }
                                    })),
                            hintText: 'Pl.: 92',
                            hintStyle: GoogleFonts.getFont('Dosis',
                                textStyle: TextStyle(
                                    color: textInput, fontSize: inputField)),
                          )),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 2.5, horizontal: 5.0),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 2.5, horizontal: 0.0),
                      child: TextField(
                          controller: relativeMassController,
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          textAlignVertical: TextAlignVertical.center,
                          cursorColor: cursor,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: deepLightBlue,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              prefixIcon: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 11.5, horizontal: 5.0),
                                child: Text(
                                  'Az atommag tömegszáma:',
                                  style: GoogleFonts.getFont('Dosis',
                                      textStyle: TextStyle(
                                          color: textInput, fontSize: input)),
                                ),
                              ),
                              suffixIcon: IconButton(
                                  icon: const Icon(Icons.send),
                                  color: iconSend,
                                  onPressed: () => setState(() {
                                        if (license_number.isNotEmpty) {
                                          if (relativeMassController
                                              .text.isNotEmpty) {
                                            int mass = int.parse(
                                                relativeMassController.text);
                                            if (mass > 0 && mass < 301) {
                                              relative_mass =
                                                  relativeMassController.text
                                                      .toString();
                                            }
                                            if (mass < 1) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      backgroundColor:
                                                          errorBackground,
                                                      content: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Az érték túl kicsi! Az értéknek 1 és 300 között kell lennie.',
                                                            style: GoogleFonts.getFont(
                                                                'Dosis',
                                                                textStyle: TextStyle(
                                                                    color:
                                                                        errorText,
                                                                    fontSize:
                                                                        error)),
                                                          ),
                                                        ],
                                                      )));
                                            }
                                            if (mass > 300) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      backgroundColor:
                                                          errorBackground,
                                                      content: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Az érték túl nagy! Az értéknek 1 és 300 között kell lennie.',
                                                            style: GoogleFonts.getFont(
                                                                'Dosis',
                                                                textStyle: TextStyle(
                                                                    color:
                                                                        errorText,
                                                                    fontSize:
                                                                        error)),
                                                          ),
                                                        ],
                                                      )));
                                            }
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    backgroundColor:
                                                        errorBackground,
                                                    content: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'A tömegszám mező nem lehet üres beküldés esetén!',
                                                          style: GoogleFonts.getFont(
                                                              'Dosis',
                                                              textStyle: TextStyle(
                                                                  color:
                                                                      errorText,
                                                                  fontSize:
                                                                      error)),
                                                        ),
                                                      ],
                                                    )));
                                          }
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  backgroundColor:
                                                      errorBackground,
                                                  content: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Először a rendszámot kell megadnia!',
                                                        style: GoogleFonts.getFont(
                                                            'Dosis',
                                                            textStyle: TextStyle(
                                                                color:
                                                                    errorText,
                                                                fontSize:
                                                                    error)),
                                                      ),
                                                    ],
                                                  )));
                                        }
                                      })),
                              hintText: 'Pl.: 235',
                              hintStyle: GoogleFonts.getFont('Dosis',
                                  textStyle: TextStyle(
                                      color: textInput,
                                      fontSize: inputField)))),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 12.5, horizontal: 35.0),
                    child: HorizontalSlidableButton(
                      isRestart: true,
                      width: MediaQuery.of(context).size.width,
                      height: 50.0,
                      buttonWidth: 50.0,
                      color: deepPurple.withOpacity(0.85),
                      buttonColor: deepPurple,
                      dismissible: false,
                      label: Icon(
                        Icons.arrow_forward_ios,
                        color: iconSend,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.all(16.0),
                        child: Text('Tovább sugárzás',
                            style: GoogleFonts.getFont('Dosis',
                                textStyle: TextStyle(
                                    color: sliderText, fontSize: slider))),
                      ),
                      onChanged: (position) {
                        setState(() {
                          if (position == SlidableButtonPosition.end) {
                            setState(() {
                              if (license_number.isNotEmpty &&
                                  emissionNumber != null) {
                                if ((int.parse(license_number).toInt() +
                                        emission[emissionNumber!]
                                            ['license_number_effect']) >
                                    3) {
                                  if ((int.parse(license_number).toInt() +
                                          emission[emissionNumber!]
                                              ['license_number_effect']) <
                                      117) {
                                    licenseNumberController.clear();
                                    relativeMassController.clear();
                                    relative_mass =
                                        (int.parse(relative_mass).toInt() +
                                                emission[emissionNumber!]
                                                    ['relative_mass_effect'])
                                            .toString();
                                    chemical_sign = periodicTable[int.parse(
                                                        license_number)
                                                    .toInt() +
                                                emission[emissionNumber!]
                                                    ['license_number_effect']]
                                            ['chemical_sign']
                                        .toString();
                                    name = periodicTable[int.parse(
                                                        license_number)
                                                    .toInt() +
                                                emission[emissionNumber!]
                                                    ['license_number_effect']]
                                            ['name']
                                        .toString();
                                    license_number =
                                        (int.parse(license_number).toInt() +
                                                emission[emissionNumber!]
                                                    ['license_number_effect'])
                                            .toString();
                                    selectedItem = drpPeriodicTable[
                                        int.parse(license_number).toInt() - 1];
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            backgroundColor: errorBackground,
                                            content: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'A keletkező anyag nem meghatározható a\nperiódusos rendszerből!',
                                                  style: GoogleFonts.getFont(
                                                      'Dosis',
                                                      textStyle: TextStyle(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          color: errorText,
                                                          fontSize: error)),
                                                ),
                                              ],
                                            )));
                                  }
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          backgroundColor: errorBackground,
                                          content: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'A keletkező anyag nem meghatározható a\nperiódusos rendszerből!',
                                                style: GoogleFonts.getFont(
                                                    'Dosis',
                                                    textStyle: TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        color: errorText,
                                                        fontSize: error)),
                                              ),
                                            ],
                                          )));
                                }
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                        backgroundColor: errorBackground,
                                        content: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Sugározott atom nélkül nem lehet tovább sugározni!',
                                              style: GoogleFonts.getFont(
                                                  'Dosis',
                                                  textStyle: TextStyle(
                                                      color: errorText,
                                                      fontSize: error)),
                                            ),
                                          ],
                                        )));
                              }
                            });
                          }
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            name = '';
            relative_mass = '';
            chemical_sign = '';
            license_number = '';
            licenseNumberController.clear();
            relativeMassController.clear();
            selectedItem = null;
            emissionNumber = null;
          });
        },
        backgroundColor: deepPurple,
        child: Center(
            child: Icon(
          Icons.clear,
          color: iconSend,
        )),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item,
            style: TextStyle(
              color: textAtom,
              fontSize: itemsDrp,
            ),
            overflow: TextOverflow.visible),
      );
}
