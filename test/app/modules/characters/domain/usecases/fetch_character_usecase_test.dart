import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:faker/faker.dart';

class Operacao {
  final int num1;
  final int num2;

  Operacao(this.num1, this.num2);

  int somar() {
    return num1 + num2;
  }

  int subtrair(int number) {
    return somar() - number;
  }
}

class OperacaoMock extends Mock implements Operacao {}

void main() {
  tearDownAll(() {});

  late Operacao operacao;

  setUpAll(() {
    operacao = OperacaoMock();
  });

  group('Teste Subtrair', () {
    late int resultado;

    setUpAll(() {
      resultado = faker.randomGenerator.integer(20);
    });

    test('Teste de sucesso subtrair', () {
      when(() => operacao.subtrair(any()))
          .thenAnswer((invocation) => resultado);

      final result = operacao.subtrair(15);

      expect(result, resultado);
      expect(result, isA<int>());

      verify(() => operacao.subtrair(any())).called(1);
    });
    test('Teste de falha subtrair', () {
      when(() => operacao.subtrair(any()))
          .thenThrow(Exception('Erro na subtracao'));

      expect(() => operacao.subtrair(15), throwsA(isException));

      verify(() => operacao.subtrair(any())).called(1);
    });
  });

  group('teste Soma', () {
    late int resultado;

    setUpAll(() {
      resultado = faker.randomGenerator.integer(20);
    });

    test('teste deve fazer a soma com sucesso', () {
      when(() => operacao.somar()).thenAnswer((invocation) => resultado);

      final result = operacao.somar();

      expect(result, resultado);
      expect(result, isA<int>());

      verify(() => operacao.somar()).called(1);
    });

    test('teste deve falhar na soma', () {
      when(() => operacao.somar()).thenThrow(Exception('erro de soma'));

      expect(() => operacao.somar(), throwsA(isException));

      verify(() => operacao.somar()).called(1);
    });
  });
}
