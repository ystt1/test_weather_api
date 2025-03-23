import 'package:dartz/dartz.dart';
import 'package:demo_golden_owl/core/usecase.dart';
import 'package:demo_golden_owl/features/dash_board/data/models/verify_payload.dart';
import 'package:demo_golden_owl/features/dash_board/domain/repositories/subscribe_repository.dart';
import 'package:demo_golden_owl/service_locator.dart';

class SubscribeUseCase implements UseCase<Either, VerifyPayload> {
  @override
  Future<Either> call({VerifyPayload? params}) async {
    return await sl<SubscribeRepository>().subscribe(params!);
  }
}
