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
          final response = await http.get(
            Uri.parse('https://app.ecominnerix.com/api/v1/home'),
          );

          if (response.statusCode == 200) {
            final data = jsonDecode(response.body);
            print(response.body);
          } else {}
        } catch (e) {}
      },
    );
  }
}
