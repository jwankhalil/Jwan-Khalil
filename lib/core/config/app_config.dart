class AppConfig {
  const AppConfig._();

  static const String supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: '',
  );

  static const String supabaseAnonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue: '',
  );

  static bool get isSupabaseConfigured =>
      supabaseUrl.isNotEmpty &&
      supabaseAnonKey.isNotEmpty &&
      !supabaseUrl.contains('YOUR_PROJECT_REF') &&
      !supabaseAnonKey.contains('YOUR_ANON');
}
