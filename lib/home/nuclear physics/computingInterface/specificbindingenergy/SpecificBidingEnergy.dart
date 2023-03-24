// ignore_for_file: non_constant_identifier_names

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nuclearphysicssimple/accessories/periodicTable.dart';
import 'package:nuclearphysicssimple/accessories/proportionalityfactors.dart';
import 'package:nuclearphysicssimple/design/colors.dart';
import 'package:nuclearphysicssimple/design/fontSize.dart';

class SpecificBidingEnergy extends StatefulWidget {
  const SpecificBidingEnergy({Key? key}) : super(key: key);

  @override
  State<SpecificBidingEnergy> createState() => _SpecificBidingEnergyState();
}

class _SpecificBidingEnergyState extends State<SpecificBidingEnergy> {
  TextEditingController licenseNumberController = TextEditingController();
  TextEditingController relativeMassController = TextEditingController();

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

  String name = '';
  String relative_mass = '';
  String chemical_sign = '';
  String license_number = '';
  String even_odd = '';

  double? relative_mass_number;
  int? license_number_number;

  int? neutron;
  int? delta;

  double pEnergy = -1.49;

  double? energyV;
  double? energyF;
  double? energyC;
  double? energyA;
  double? energyP;

  double? energy;
  double? epsilon;

  var numberForm = NumberFormat("##0");
  var energyForm = NumberFormat("#0.0000");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
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
                'Egyetlen nukleon átlagos energiája:',
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
                Container(
                  height: 145.0,
                  width: 145.0,
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
                          margin: const EdgeInsets.only(top: 15.0, left: 15.0),
                          child: Text(relative_mass,
                              style: GoogleFonts.getFont('Dosis',
                                  textStyle: TextStyle(
                                      color: textAtom, fontSize: indexes))),
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
                          margin:
                              const EdgeInsets.only(bottom: 15.0, left: 15.0),
                          child: Text(license_number,
                              style: GoogleFonts.getFont('Dosis',
                                  textStyle: TextStyle(
                                      color: textAtom, fontSize: indexes))),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(
                      vertical: 2.5, horizontal: 10.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      color: deepLightBlue,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text('Protonok száma: $license_number p+',
                      style: GoogleFonts.getFont('Dosis',
                          textStyle:
                              TextStyle(color: textAtom, fontSize: data))),
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(
                      vertical: 2.5, horizontal: 10.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      color: deepBlue,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text(
                      'Neutronok száma: ${neutron == null ? '' : neutron.toString()} n0',
                      style: GoogleFonts.getFont('Dosis',
                          textStyle:
                              TextStyle(color: textAtom, fontSize: data))),
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(
                      vertical: 2.5, horizontal: 10.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      color: deepLightBlue,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text(
                      'Atommag kötési energia: ${energy == null ? '' : energy!.toStringAsExponential(3)} pJ',
                      style: GoogleFonts.getFont('Dosis',
                          textStyle:
                              TextStyle(color: textAtom, fontSize: data))),
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(
                      vertical: 2.5, horizontal: 10.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: deepBlue,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Text(
                      'Egyetlen nukleon átlagos energiája: ${energy == null ? '' : epsilon!.toStringAsExponential(3)} pJ',
                      style: GoogleFonts.getFont('Dosis',
                          textStyle:
                              TextStyle(color: textAtom, fontSize: data))),
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
                            style:
                                TextStyle(color: textAtom, fontSize: itemsDrp)),
                        items: drpPeriodicTable.map(buildMenuItem).toList(),
                        onChanged: (value) => setState(
                              () {
                                selectedItem = value!;
                                int license =
                                    drpPeriodicTable.indexOf(value) + 1;
                                name =
                                    periodicTable[license]['name'].toString();
                                relative_mass = numberForm
                                    .format(
                                        periodicTable[license]['relative_mass'])
                                    .toString();
                                chemical_sign = periodicTable[license]
                                        ['chemical_sign']
                                    .toString();
                                license_number = periodicTable[license]
                                        ['license_number']
                                    .toString();
                                relative_mass_number =
                                    periodicTable[license]['relative_mass'];
                                license_number_number =
                                    periodicTable[license]['license_number'];
                                neutron = relative_mass_number!.round() -
                                    license_number_number!;
                                if (license_number_number! % 2 == 0 ||
                                    neutron! % 2 == 0) {
                                  if (license_number_number!.toInt() % 2 == 0 &&
                                      neutron! % 2 == 0) {
                                    delta = 1;
                                    even_odd = 'Páros-Páros';
                                  } else {
                                    delta = 0;
                                    if (license_number_number! % 2 == 0 &&
                                        neutron! % 2 != 0) {
                                      even_odd = 'Páros-Páratlan';
                                    } else {
                                      even_odd = 'Páratlan-Páros';
                                    }
                                  }
                                } else {
                                  delta = -1;
                                  even_odd = 'Páratlan-Páratlan';
                                }
                                energyV = proportionalityFactors[1]
                                        ['valueInpJ'] *
                                    relative_mass_number!;
                                energyF = proportionalityFactors[2]
                                        ['valueInpJ'] *
                                    pow(relative_mass_number!, 2 / 3);
                                energyC = proportionalityFactors[3]
                                        ['valueInpJ'] *
                                    (pow(license_number_number!, 2) /
                                        pow(relative_mass_number!, 1 / 3));
                                energyA = proportionalityFactors[4]
                                        ['valueInpJ'] *
                                    (pow(
                                            (relative_mass_number! -
                                                2 * license_number_number!),
                                            2) /
                                        relative_mass_number!);
                                energyP = proportionalityFactors[5]
                                        ['valueInpJ'] *
                                    delta *
                                    pow(relative_mass_number!, -1 / 2);
                                print('EnergyP: $energyP');
                                energy = energyV! -
                                    energyF! -
                                    energyC! -
                                    energyA! +
                                    energyP!;
                                epsilon = energy! / relative_mass_number!;
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
                                      if (license > 0 && license < 119) {
                                        name = periodicTable[license]['name']
                                            .toString();
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
                                        relative_mass_number =
                                            periodicTable[license]
                                                ['relative_mass'];
                                        license_number_number =
                                            periodicTable[license]
                                                ['license_number'];
                                        if (license_number.isNotEmpty &&
                                            relative_mass.isNotEmpty) {
                                          neutron =
                                              relative_mass_number!.round() -
                                                  license_number_number!;
                                          if (license_number_number! % 2 == 0 ||
                                              neutron! % 2 == 0) {
                                            if (license_number_number!.toInt() %
                                                        2 ==
                                                    0 &&
                                                neutron! % 2 == 0) {
                                              delta = 1;
                                              even_odd = 'Páros-Páros';
                                            } else {
                                              delta = 0;
                                              if (license_number_number! % 2 ==
                                                      0 &&
                                                  neutron! % 2 != 0) {
                                                even_odd = 'Páros-Páratlan';
                                              } else {
                                                even_odd = 'Páratlan-Páros';
                                              }
                                            }
                                          } else {
                                            delta = -1;
                                            even_odd = 'Páratlan-Páratlan';
                                          }
                                          energyV = proportionalityFactors[1]
                                                  ['valueInpJ'] *
                                              relative_mass_number!;
                                          energyF = proportionalityFactors[2]
                                                  ['valueInpJ'] *
                                              pow(relative_mass_number!, 2 / 3);
                                          energyC = proportionalityFactors[3]
                                                  ['valueInpJ'] *
                                              (pow(license_number_number!, 2) /
                                                  pow(relative_mass_number!,
                                                      1 / 3));
                                          energyA = proportionalityFactors[4]
                                                  ['valueInpJ'] *
                                              (pow(
                                                      (relative_mass_number! -
                                                          2 * license_number_number!),
                                                      2) /
                                                  relative_mass_number!);
                                          energyP = proportionalityFactors[5]
                                                  ['valueInpJ'] *
                                              delta *
                                              pow(relative_mass_number!,
                                                  -1 / 2);
                                          print('EnergyP: $energyP');
                                          energy = energyV! -
                                              energyF! -
                                              energyC! -
                                              energyA! +
                                              energyP!;
                                          epsilon =
                                              energy! / relative_mass_number!;
                                        }
                                      }
                                      if (license < 1) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                backgroundColor:
                                                    errorBackground,
                                                content: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Az érték túl kicsi! Az értéknek 1 és 118 között kell lennie.',
                                                      style: GoogleFonts.getFont(
                                                          'Dosis',
                                                          textStyle: TextStyle(
                                                              color: errorText,
                                                              fontSize: error)),
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
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Az érték túl nagy! Az értéknek 1 és 118 között kell lennie.',
                                                      style: GoogleFonts.getFont(
                                                          'Dosis',
                                                          textStyle: TextStyle(
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
                                          double mass = double.parse(
                                              relativeMassController.text);
                                          if (mass > 0 && mass < 301) {
                                            relative_mass =
                                                relativeMassController.text
                                                    .toString();
                                            relative_mass_number = mass;
                                            if (relative_mass.isNotEmpty) {
                                              neutron = relative_mass_number!
                                                      .round() -
                                                  license_number_number!;
                                              if (license_number_number! % 2 ==
                                                      0 ||
                                                  neutron! % 2 == 0) {
                                                if (license_number_number! %
                                                            2 ==
                                                        0 &&
                                                    neutron! % 2 == 0) {
                                                  delta = 1;
                                                  even_odd = 'Páros-Páros';
                                                } else {
                                                  delta = 0;
                                                  if (license_number_number! %
                                                              2 ==
                                                          0 &&
                                                      neutron! % 2 != 0) {
                                                    even_odd = 'Páratlan-Páros';
                                                  } else {
                                                    even_odd = 'Páros-Páratlan';
                                                  }
                                                }
                                              } else {
                                                delta = -1;
                                                even_odd = 'Páratlan-Páratlan';
                                              }
                                              energyV =
                                                  proportionalityFactors[1]
                                                          ['valueInpJ'] *
                                                      relative_mass_number;
                                              energyF =
                                                  proportionalityFactors[2]
                                                          ['valueInpJ'] *
                                                      pow(relative_mass_number!,
                                                          2 / 3);
                                              energyC = proportionalityFactors[
                                                      3]['valueInpJ'] *
                                                  (pow(license_number_number!,
                                                          2) /
                                                      pow(relative_mass_number!,
                                                          1 / 3));
                                              energyA = proportionalityFactors[
                                                      4]['valueInpJ'] *
                                                  (pow(
                                                          (relative_mass_number! -
                                                              2 * license_number_number!),
                                                          2) /
                                                      relative_mass_number!);
                                              energyP =
                                                  proportionalityFactors[5]
                                                          ['valueInpJ'] *
                                                      delta *
                                                      pow(relative_mass_number!,
                                                          -1 / 2);
                                              energy = energyV! -
                                                  energyF! -
                                                  energyC! -
                                                  energyA! +
                                                  energyP!;
                                              epsilon = energy! /
                                                  relative_mass_number!;
                                            }
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
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Először a rendszámot kell megadnia!',
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
                            hintText: 'Pl.: 235',
                            hintStyle: GoogleFonts.getFont('Dosis',
                                textStyle: TextStyle(
                                    color: textInput, fontSize: inputField)))),
                  ),
                ),
                const SizedBox(
                  height: 70.0,
                )
              ],
            ),
          ),
        )
      ]),
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
            neutron = null;
            delta = null;
            energyV = null;
            energyF = null;
            energyC = null;
            energyA = null;
            energyP = null;
            energy = null;
            epsilon = null;
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
