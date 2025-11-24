class Env {
  static const apiUrl = String.fromEnvironment(
    'API_URL',
    defaultValue: 'https://example.com',
  );
}
