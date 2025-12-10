import 'package:zker/features/spaha_feature/domain/repo/spha_repo.dart';

class DeletSphaUseCase {
  final SphaRepo sphaRepo;
  DeletSphaUseCase({required this.sphaRepo});

  Future<void> call( {required int id}) => sphaRepo.deletSpha(id: id);
}