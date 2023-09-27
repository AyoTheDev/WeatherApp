abstract class BaseUseCase<Output, Input> {
  Future<Output> execute({Input? params});
}
