import '../../providers/user.api.dart';
import '/data/data.dart';

class UserRepository {
  UserRepository._privateConstructor();

  static final UserRepository _instance = UserRepository._privateConstructor();

  static UserRepository get instance => _instance;

  final UserAPI _userAPI = UserAPI();
  RevenueComparisonModel? appUser;
  RevenueComparisonModel? get user {
    return appUser;
  }

  Future<RevenueModel> getRevenueData() async {
    try {
      final res = await _userAPI.getRevenue();
      return RevenueModel.fromMap(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<OpDetailModel> getRevenueDetailData(
      {required day, required month}) async {
    try {
      final res = await _userAPI.getrevenuedetail(day: day, month: month);
      return OpDetailModel.fromMap(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<MonthlyModel> getmonthlyData() async {
    try {
      final res = await _userAPI.getmonthly();
      return MonthlyModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<YearlyModel> getyearlyData() async {
    try {
      final res = await _userAPI.getyearly();
      return YearlyModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<LogoutModel> getlogout() async {
    try {
      final res = await _userAPI.getlogout();
      return LogoutModel.fromMap(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<BudgetModel> getBudgetData() async {
    try {
      final res = await _userAPI.getbudget();
      return BudgetModel.fromMap(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<BudgetSummaryModel> budgetCurrentData() async {
    try {
      final res = await _userAPI.getbudgetCurrent();
      return BudgetSummaryModel.fromMap(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<FinanicalBudgetModel> budgetFinancialData() async {
    try {
      final res = await _userAPI.getbudgetFinancial();
      return FinanicalBudgetModel.fromMap(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<RevenueComparisonModel> revenuecomparison({
    required dynamic body,
  }) async {
    try {
      var data = await _userAPI.revenuecomparison(body: body);
      appUser = RevenueComparisonModel.fromMap(data);

      return appUser!;
    } catch (e) {
      rethrow;
    }
  }

  Future<MonthlyComparisonModel> monthlycomparison({
    required dynamic body,
  }) async {
    try {
      var data = await _userAPI.monthlycomparison(body: body);
      return MonthlyComparisonModel.fromMap(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<YearlyComparisonModel> yearlycomparison({
    required dynamic body,
  }) async {
    try {
      var data = await _userAPI.yearlycomparison(body: body);
      return YearlyComparisonModel.fromMap(data);
    } catch (e) {
      rethrow;
    }
  }
}
