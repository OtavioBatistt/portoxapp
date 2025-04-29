abstract class ITokenServiceAdapter {
  void startNewTimer();
  void stopTimer();
  Future<void> timedOut();
}
