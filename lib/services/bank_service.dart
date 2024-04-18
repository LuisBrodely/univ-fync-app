import 'dart:convert';
import 'package:http/http.dart' as http;

class BankService {
  static const String baseUrl = 'http://3.22.52.255/api/bank_accounts';

  Future<void> createBankAccount(String userEmail, String userName) async {
    final response = await http.post(
      Uri.parse('$baseUrl/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'user_email': userEmail,
        'name': userName,
      }),
    );

    if (response.statusCode == 201) {
      print('Cuenta bancaria creada exitosamente.');
    } else {
      throw Exception('Error al crear la cuenta bancaria');
    }
  }

  Future<void> deleteBankAccount(String accountId) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/delete/$accountId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print('Cuenta bancaria eliminada exitosamente.');
    } else {
      throw Exception('Error al eliminar la cuenta bancaria');
    }
  }

  Future<void> editBankAccount(String accountId, String nip) async {
    final response = await http.put(
      Uri.parse('$baseUrl/edit/$accountId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'nip': nip,
      }),
    );

    if (response.statusCode == 200) {
      print('Cuenta bancaria editada exitosamente.');
    } else {
      throw Exception('Error al editar la cuenta bancaria');
    }
  }

  Future<List<Map<String, dynamic>>> getExpenses(String accountId) async {
    final response = await http.get(
      Uri.parse('http://3.22.52.255/api/expenses/list/$accountId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final List<dynamic> expensesData = responseData['expenses'];
      final List<Map<String, dynamic>> expenses = expensesData
          .map((expense) => Map<String, dynamic>.from(expense))
          .toList();
      return expenses;
    } else {
      print(
          'Error al obtener los gastos. Código de estado: ${response.statusCode}');
      print('Respuesta del servidor: ${response.body}');
      throw Exception('Error al obtener los gastos');
    }
  }


 Future<List<Map<String, dynamic>>> getIncomes(String accountId) async {
    final response = await http.get(
      Uri.parse('http://3.22.52.255/api/income/list/$accountId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final List<dynamic> incomesData = responseData['incomes'];
      final List<Map<String, dynamic>> incomes = incomesData
          .map((expense) => Map<String, dynamic>.from(expense))
          .toList();
      return incomes;
    } else {
      print(
          'Error al obtener los gastos. Código de estado: ${response.statusCode}');
      print('Respuesta del servidor: ${response.body}');
      throw Exception('Error al obtener los gastos');
    }
  }
}
