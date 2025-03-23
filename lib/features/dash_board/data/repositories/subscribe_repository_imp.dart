import 'package:dartz/dartz.dart';
import 'package:demo_golden_owl/features/dash_board/data/data_sources/subscribe_nodejs_service.dart';
import 'package:demo_golden_owl/features/dash_board/data/models/verify_payload.dart';
import 'package:demo_golden_owl/features/dash_board/domain/repositories/subscribe_repository.dart';
import 'package:demo_golden_owl/service_locator.dart';

class SubscribeRepositoryImp extends SubscribeRepository {
  @override
  Future<Either> sendCode(String email) async {
    return await sl<SubscribeNodejsService>().sendCode(email);
  }

  @override
  Future<Either> subscribe(VerifyPayload payload) async {
    return await sl<SubscribeNodejsService>().subscribe(payload);
  }

}