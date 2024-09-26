import 'package:chat_app/domain/entities/message.dart';
import 'package:chat_app/infrastructure/models/yes_no_models.dart';
import 'package:dio/dio.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNOModel = YesNoModel.fromJsonMap(response.data);

    return yesNOModel.toMessageEntity();
  }
}
