import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressedEvent>(
      (event, emit) async {
        try {
          final response = await http.post(
            Uri.parse('https://app.ecominnerix.com/api/login'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'email': event.email,
              'password': event.password,
            }),
          );

          if (response.statusCode == 200) {
            final data = jsonDecode(response.body);
            print('Login Successful: ${response.body}');
            emit(LoginSuccessState());
          } else {
            print('Login Failed: ${response.statusCode}');
          }
        } catch (e) {
          print('⚠️ Exception: $e');
        }
      },
    );
  }
}
