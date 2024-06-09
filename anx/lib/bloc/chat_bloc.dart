import 'package:bloc/bloc.dart';
import 'chat_event.dart';
import 'chat_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial());

  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is SendMessage) {
      yield ChatLoading();
      try {
        final response = await http.post(
          Uri.parse('http://127.0.0.1:5000/chat'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({'message': event.message}),
        );

        if (response.statusCode == 200) {
          yield ChatLoaded(json.decode(response.body)['response']);
        } else {
          yield ChatError('Failed to load response');
        }
      } catch (e) {
        yield ChatError(e.toString());
      }
    }
  }
}
