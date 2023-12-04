import 'package:day_3/day_3.dart';
import 'package:test/test.dart';

const engineStr = '''
1.2
...
...''';

const engineStrSpread = '''
12..
..*.
1234''';

const engineGearMultiple = '''
12..
..*.
1234
*...''';
void main() {
  group(
      "Part 1",
      () => {
            test('test isInside', () {
              var engine = Engine.parse(engineStr);

              expect(engine.isInside(-1, 0), false);
              expect(engine.isInside(0, -1), false);
              expect(engine.isInside(3, 0), false);
              expect(engine.isInside(0, 3), false);
              expect(engine.isInside(0, 2), true);
            }),
            test('test spreadNumber', () {
              var engine = Engine.parse(engineStrSpread);
              engine.spreadNumber(0, 0);
              engine.spreadNumber(2, 2);

              expect(engine.used[0][0], true);
              expect(engine.used[0][1], true);
              expect(engine.used[0][2], false);

              for (int i = 0; i < 3; i++) {
                expect(engine.used[2][i], true);
              }
            }),
            test('search for symbol', () {
              var engine = Engine.parse(engineStrSpread);

              engine.searchForSymbol();
              expect(engine.used[0][0], true);
              expect(engine.used[0][1], true);
              expect(engine.used[0][2], false);

              for (int i = 0; i < 3; i++) {
                expect(engine.used[2][i], true);
              }
            }),
            test('getNumber', () {
              var engine = Engine.parse(engineStrSpread);
              engine.searchForSymbol();
              expect(engine.getNumber(0, 0), "12");
              expect(engine.getNumber(2, 0), "1234");
            }),
            test('sumPartNumbers', () {
              var engine = Engine.parse(engineStrSpread);
              engine.searchForSymbol();
              expect(engine.sumPartNumbers(), 12 + 1234);
            })
          });

  group(
      "Part 2",
      () => {
            test("test parseNumber()", () {
              var engine = Engine.parse(engineStrSpread);
              expect(engine.parseNumber(0, 0), 12);
              expect(engine.parseNumber(2, 0), 1234);
            }),
            test("test getAdjacentNumbers", () {
              var engine = Engine.parse(engineStrSpread);
              expect(engine.getAdjacentNumbers(1, 2), [12, 1234]);
              expect(engine.getAdjacentNumbers(2, 0), [1234]);
            })
          });
}
