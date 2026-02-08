import 'package:zker/features/azkar_feature/domain/repo/azkar_repo.dart';

class GetNameOfLlahUseCase {
  final AzkarRepo azkarRepo;
  GetNameOfLlahUseCase({required this.azkarRepo});
  Future call() async {
    return await azkarRepo.getNameAllah();
  }
}