abstract class BaseUseCase<Input, Output> {
  Future<Output> execute({required Input input});
}
