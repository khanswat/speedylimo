import '/core/core.dart';

class UserAPI {
  UserAPI();

  Future<dynamic> getRevenue() async {
    try {
      return await HTTP.instance.iGet(ApiRoutes.RevenueUrl);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getrevenuedetail({required day, required month}) async {
    try {
      return await HTTP.instance
          .iGet(ApiRoutes.revenue_detailUrl + '/$day/$month');
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getmonthly() async {
    try {
      return await HTTP.instance.iGet(ApiRoutes.monthly_Url);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getyearly() async {
    try {
      return await HTTP.instance.iGet(ApiRoutes.yearly_Url);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getlogout() async {
    try {
      return await HTTP.instance.iGet(ApiRoutes.logout_Url);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getbudget() async {
    try {
      return await HTTP.instance.iGet(ApiRoutes.budget_Url);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getbudgetCurrent() async {
    try {
      return await HTTP.instance.iGet(ApiRoutes.budget_Current_Url);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getbudgetFinancial() async {
    try {
      return await HTTP.instance.iGet(ApiRoutes.budget_financial_Url);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> revenuecomparison({required body}) async {
    try {
      return await HTTP.instance
          .iPost(ApiRoutes.revenue_comparison_Url, data: body);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> monthlycomparison({required body}) async {
    try {
      return await HTTP.instance
          .iPost(ApiRoutes.monthly_comparison_Url, data: body);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> yearlycomparison({required body}) async {
    try {
      return await HTTP.instance
          .iPost(ApiRoutes.yearly_comparison_Url, data: body);
    } catch (e) {
      rethrow;
    }
  }
}
