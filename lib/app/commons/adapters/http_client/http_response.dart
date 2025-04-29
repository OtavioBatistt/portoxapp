class HttpResponse<T> {
  HttpResponse({
    required this.statusCode,
    required this.headers,
    this.data,
  });

  final T? data;
  final Map<String, List<String>> headers;
  final int statusCode;
}
