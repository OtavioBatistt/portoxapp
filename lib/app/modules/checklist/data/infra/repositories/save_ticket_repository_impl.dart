import 'package:dartz/dartz.dart';
import 'package:portox_app/app/commons/default_errors.dart';
import 'package:portox_app/app/modules/checklist/data/infra/datasources/api_ticket_datasource.dart';
import 'package:portox_app/app/modules/checklist/domain/repositories/save_ticket_repository.dart';

class SaveTicketRepository implements ISaveTicketRepository {
  SaveTicketRepository({
    required ISaveTicketDataSource dataSource,
  }) : _dataSource = dataSource;

  final ISaveTicketDataSource _dataSource;

  @override
  Future<Either<Failure, String>> saveTicket({
    required String scheduleNumber,
    required String tag,
  }) async {
    try {
      final result = await _dataSource.saveTicket(
        scheduleNumber: scheduleNumber,
        tag: tag,
      );
      return right(result);
    } on Exception catch (e) {
      if (e is HttpDataSourceError && e.httpError?.statusCode == 500) {
        return left(NetworkError());
      }
      return left(ClientError());
    }
  }
}
