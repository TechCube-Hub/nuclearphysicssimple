class Question {
  final String text;
  final List<Option> options;
  Option? selectedOption;

  Question({
    required this.text,
    required this.options,
    this.selectedOption,
  });
}

class Option {
  final String text;
  final bool isCorrect;

  Option({required this.text, required this.isCorrect});
}

final questions = [
  [
    Question(text: 'Mikből áll egy atom?', options: [
      Option(text: 'p+; n0; e-', isCorrect: true),
      Option(text: 'Kvartokból', isCorrect: false),
      Option(text: 'Atommagból', isCorrect: false),
    ]),
    Question(text: 'Melyik részecske nem rendelkezik töltéssel?', options: [
      Option(text: 'Proton', isCorrect: false),
      Option(text: 'Neutron', isCorrect: true),
      Option(text: 'Elektron', isCorrect: false),
    ]),
    Question(text: 'Milyen töltésű egy atom?', options: [
      Option(text: 'Pozitív', isCorrect: false),
      Option(text: 'Semleges', isCorrect: true),
      Option(text: 'Negatív', isCorrect: false),
    ]),
    Question(text: 'Mik alkotját az atommagot?', options: [
      Option(text: 'p+; e-', isCorrect: false),
      Option(text: 'e-; n0', isCorrect: false),
      Option(text: 'p+; n0', isCorrect: true),
    ]),
    Question(text: 'Az "A" betű mit jelöl egy atomnál?', options: [
      Option(text: 'Töltését', isCorrect: false),
      Option(text: 'Vegyjelét', isCorrect: false),
      Option(text: 'Tömegszámát', isCorrect: true),
      Option(text: 'Rendszámát', isCorrect: false),
    ]),
    Question(text: 'Miből tudhatjuk egy atom protonjainak számát?', options: [
      Option(text: 'Nevéből', isCorrect: false),
      Option(text: 'Rendszámából', isCorrect: true),
      Option(text: 'Vegyjeléből', isCorrect: false),
      Option(text: 'Sehogy', isCorrect: false),
    ]),
    Question(text: 'Meg egyezik-e a protonok és elektronok száma?', options: [
      Option(text: 'Nem', isCorrect: false),
      Option(text: 'Igen', isCorrect: true),
    ]),
    Question(
        text: 'Melyik képlettel határozható meg a neutronok száma?',
        options: [
          Option(text: 'A = Z * N', isCorrect: false),
          Option(text: 'N = A - Z', isCorrect: true),
          Option(text: 'Z = A * A - N', isCorrect: false),
          Option(text: 'N = Z - A', isCorrect: false),
        ]),
    Question(text: 'Az izotópok melyik tulajdonsága egyezik meg?', options: [
      Option(text: 'Fizikai', isCorrect: true),
      Option(text: 'Kémiai', isCorrect: false),
      Option(text: 'Egyik sem', isCorrect: false),
    ]),
    Question(text: 'Mi igaz a stabil atommagokra?', options: [
      Option(text: 'Nem bomlanak radioaktívan', isCorrect: true),
      Option(text: 'Gyorsan bomlanak', isCorrect: false),
      Option(text: 'Nincs stabil atommag', isCorrect: false),
    ]),
  ],
  [
    Question(text: 'Milyen bomlások vannak?', options: [
      Option(text: 'Nincsnek bomlások', isCorrect: false),
      Option(text: 'Elektron, proton', isCorrect: false),
      Option(text: 'Alfa, béta, gamma', isCorrect: true),
    ]),
    Question(text: 'Mi történik alfa sugárzáskor?', options: [
      Option(text: 'Z - 2 és A - 4', isCorrect: true),
      Option(text: 'Semmi', isCorrect: false),
      Option(text: 'Z + 2', isCorrect: false),
      Option(text: 'Z + 1 és A - 2', isCorrect: false),
    ]),
    Question(text: 'Mi történik negatív béta sugárzáskor?', options: [
      Option(text: 'Z - 2 és A - 4', isCorrect: false),
      Option(text: 'Z + 1', isCorrect: true),
      Option(text: 'Z + 1 és A - 2', isCorrect: false),
    ]),
    Question(text: 'Mi keletkezik negatív béta sugárzáskor?', options: [
      Option(text: 'Semmi', isCorrect: false),
      Option(text: 'Fölösleges atommag', isCorrect: false),
      Option(text: 'Anti neutrínó', isCorrect: true),
    ]),
    Question(text: 'Mi történik pozitív béta sugárzáskor?', options: [
      Option(text: 'Z - 1 és A + 1', isCorrect: false),
      Option(text: 'Z - 1', isCorrect: true),
      Option(text: 'Z - 2 és A - 4', isCorrect: false),
    ]),
    Question(
        text:
            'Keletkezik-e nagy áthatoló képességű részecske pozitív béta bomláskor?',
        options: [
          Option(text: 'Nem', isCorrect: false),
          Option(text: 'Igen', isCorrect: true),
        ]),
    Question(text: 'Mi történik gamma sugárzáskor?', options: [
      Option(text: 'Z - 1 és A + 1', isCorrect: false),
      Option(text: 'Semmi', isCorrect: true),
      Option(text: 'Z - 2 és A - 4', isCorrect: false),
      Option(text: 'Z + 1', isCorrect: false),
    ]),
    Question(text: 'Melyik bomlási család valós?', options: [
      Option(text: 'Urán', isCorrect: false),
      Option(text: '5B-235', isCorrect: false),
      Option(text: '4k+1', isCorrect: true),
      Option(text: 'Tórium', isCorrect: false),
    ]),
    Question(
        text: 'Egy atommag pozitront bocsájt ki akkor milyen bomlás?',
        options: [
          Option(text: 'Alfa', isCorrect: false),
          Option(text: 'Gamma', isCorrect: false),
          Option(text: 'Pozitív Béta', isCorrect: false),
          Option(text: 'Negatív Béta', isCorrect: true),
        ]),
    Question(text: 'Mi a végterméke a 4k+3 családnak?', options: [
      Option(text: '207-es Ólom', isCorrect: true),
      Option(text: '236-os Urán', isCorrect: false),
      Option(text: '232-es Tórium', isCorrect: false),
    ]),
  ],
  [
    Question(text: 'Melyik képletből vezethető le a tömegdefektus?', options: [
      Option(text: 'N = A - Z', isCorrect: false),
      Option(text: 'N = E / A', isCorrect: false),
      Option(text: 'E = m * c^2', isCorrect: true),
    ]),
    Question(text: 'Mi tartja egyben az atommagot?', options: [
      Option(text: 'Erős magerő', isCorrect: true),
      Option(text: 'Coulomb taszítás', isCorrect: false),
      Option(text: 'Elektron felhő', isCorrect: false),
    ]),
    Question(text: 'Könnyű atommagok hogy bomlanak?', options: [
      Option(text: 'Magfúzióval', isCorrect: true),
      Option(text: 'Radioaktív bomlással', isCorrect: false),
      Option(text: 'Mag hasadással', isCorrect: false),
    ]),
    Question(text: 'Mi van az energia völgy legalján?', options: [
      Option(text: 'Szén', isCorrect: false),
      Option(text: 'Urán', isCorrect: false),
      Option(text: 'Vas', isCorrect: true),
      Option(text: 'Hidrogén', isCorrect: false),
    ]),
    Question(text: 'Nehéz atommagok hogyan bomlanak?', options: [
      Option(text: 'Tömegdefektussal', isCorrect: false),
      Option(text: 'Magfúzióval', isCorrect: false),
      Option(text: 'Radioaktív bomlással', isCorrect: true),
      Option(text: 'Sehogy', isCorrect: false),
    ]),
    Question(text: 'Milyen pontos a cseppmodell?', options: [
      Option(text: '10%', isCorrect: false),
      Option(text: '2%', isCorrect: true),
      Option(text: '61%', isCorrect: false),
    ]),
    Question(text: 'Mi nem található a cseppmodell képletében?', options: [
      Option(text: 'Felületi energia', isCorrect: false),
      Option(text: 'Térfogati energia', isCorrect: false),
      Option(text: 'Kötési energia', isCorrect: true),
      Option(text: 'Pár energia', isCorrect: false),
    ]),
    Question(
        text: 'Melyik képlet az egyetlen nukleon átlagos energiájáé?',
        options: [
          Option(text: 'Cseppmodell képlete / Tömegszám', isCorrect: true),
          Option(text: 'Nem meghatározható', isCorrect: false),
          Option(text: 'Tömegdefektus * Rendszám', isCorrect: false),
        ]),
    Question(text: 'Miben ábrázoljuk az atommagok stabilitását?', options: [
      Option(text: 'Rendszám táblában', isCorrect: false),
      Option(text: 'Periodusos rendszerben', isCorrect: false),
      Option(text: 'Energia völgyben', isCorrect: true),
    ]),
    Question(text: 'Mi állandó ezek közül?', options: [
      Option(text: 'Felületi energia', isCorrect: true),
      Option(text: 'Rendszám', isCorrect: false),
      Option(text: 'Tömegszám', isCorrect: true),
    ]),
  ],
];
