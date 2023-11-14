class ApiRoutes {
  //static const String originUrlLive = 'https://fms.eshifa.org/';
  // static const String originUrlStage = 'https://fms-stg.eshifa.org/';
  static const String baseUrl = 'https://sihmgtapp.shifa.com.pk/';

  static const String loginUrl = '${baseUrl}auth/login';
  static const String logout_Url = '${baseUrl}auth/logout';
  static const String changePassword_Url = '${baseUrl}user/changePassword';
  static const String forgotPassword_Url = '${baseUrl}auth/forgotPassword';
  static const String RevenueUrl = '${baseUrl}revenue/day-wise-current-month';
  static const String revenue_detailUrl = '${baseUrl}revenue/day-service-wise';
  static const String monthly_Url = '${baseUrl}revenue/current-last-month';
  static const String yearly_Url = '${baseUrl}revenue/current-last-year';
  static const String budget_Url =
      '${baseUrl}revenue/current-month-dailywise-revenue';
  static const String budget_Current_Url =
      '${baseUrl}revenue/current-year-month-revenue';
  static const String budget_financial_Url =
      '${baseUrl}revenue/current-fiscal-revenue-budget';
  static const String revenue_comparison_Url =
      '${baseUrl}revenue/quarterwise-revenue';
  static const String monthly_comparison_Url =
      '${baseUrl}revenue/monthwise-revenue';
  static const String yearly_comparison_Url =
      '${baseUrl}revenue/yearwise-revenue';
}
