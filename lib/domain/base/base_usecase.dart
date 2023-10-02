abstract class BaseUseCase<Output, Input> {
  Future<Output> execute({required Input input});
}
