import 'package:dartz/dartz.dart';
import 'package:demo_golden_owl/features/dash_board/data/models/verify_payload.dart';

abstract class SubscribeRepository{
  Future<Either> sendCode(String email);
  Future<Either> subscribe(VerifyPayload payload);
}