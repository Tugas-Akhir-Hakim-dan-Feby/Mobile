import 'package:api_mobile/page/auth/login_page.dart';
import 'package:api_mobile/page/auth/register_page.dart';
import 'package:api_mobile/page/auth/reset_password.dart';
import 'package:api_mobile/page/dashboard/dashboard.dart';
import 'package:api_mobile/page/member/job_vacancy/job_vacancy.dart';
import 'package:api_mobile/page/member/lsp/lsp.dart';
import 'package:api_mobile/page/member/skills_chart/skills_chart.dart';
import 'package:api_mobile/page/navigasi_bottom/navigasi.dart';
import 'package:api_mobile/page/profile/member/edit_profile_member_welder.dart/edit_profile_member_welder.dart';
import 'package:api_mobile/page/profile/member/form_member_company/form_member_company.dart';
import 'package:api_mobile/page/profile/member/form_member_welder/form_member_welder.dart';
import 'package:api_mobile/page/profile/member/payment_history/history_billing.dart';
import 'package:api_mobile/page/profile/profile.dart';
import 'package:api_mobile/page/profile/widget/certificate.dart';
import 'package:api_mobile/page/profile/widget/edit_profile.dart';
import 'package:api_mobile/page/profile/widget/follow_us.dart';
import 'package:api_mobile/page/profile/widget/help.dart';
import 'package:api_mobile/page/profile/member/member_profile.dart';
import 'package:api_mobile/page/profile/widget/profile_edit_password.dart';
import 'package:api_mobile/page/profile/widget/term_individu_member.dart';
import 'package:api_mobile/page/profile/widget/terms_page.dart';
import 'package:api_mobile/page/splash/splash.dart';
import 'package:api_mobile/page/welcome/welcome.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes {
  static const String loginPage = '/login_page';
  static const String registerPage = '/register_page';
  static const String splashPage = '/splash_page';
  static const String profilePage = '/profile_page';
  static const String dashboard = '/dashboard_page';
  static const String welcomePage = '/welcome_page';
  static const String navigasiPage = '/navigasi_page';
  static const String editProfile = '/edit_profile';
  static const String certificatePage = '/certificate_page';
  static const String memberProfilePage = '/member_profile_page';
  static const String  profileEditPassworPage = '/profile_edit_password_page';
  static const String  termsConditionPage = '/terms_condition_page';
  static const String  followUspage = '/follow_us_page';
  static const String  helpPage = '/help_page';
  static const String  resetPasswordPage = '/reset_password_page';
  static const String  termIndividualPage = '/term_individual_page';
  static const String  skillsChart = '/skills_chart';
  static const String  jobVacancy = '/job_vacancy';
  static const String  formMemberWelder = '/form_member_welder';
  static const String  formMemberCompany = '/form_member_company';
  static const String  paymentHistory = '/payment_history';
  static const String  editProfileMemberWelder = '/edit_profile_member_welder';
  static const String  institutionOfProfessionalCertification = '/lsp';
  

  static final routes = [
    GetPage(name: loginPage, page: () => LoginPage()),
    GetPage(name: registerPage, page: () => RegisterPage()),
    GetPage(name: splashPage, page: () => SplashPage()),
    GetPage(name: profilePage, page: () => ProfilePage()),
    GetPage(name: dashboard, page: () =>  Dashboard()),
    GetPage(name: welcomePage, page: () =>  WelcomePage()),
    GetPage(name: navigasiPage, page: () =>  NavigasiPage()),
    GetPage(name: editProfile, page: () =>  EditProfile()),
    GetPage(name: certificatePage, page: () =>  CertificateScreen()),
    GetPage(name: memberProfilePage, page: () =>  MemberProfilePage()),
    GetPage(name: profileEditPassworPage, page: () =>  ProfileEditPasswordPage()),
    GetPage(name: termsConditionPage, page: () =>  TermsConditionPage()),
    GetPage(name: followUspage, page: () =>  FollowUsPage()),
    GetPage(name: helpPage, page: () =>  HelpPage()),
    GetPage(name: resetPasswordPage, page: () =>  ResetPasswordPage()),
    GetPage(name: termIndividualPage, page: () =>  IndividualMemberRequirements()),
    GetPage(name: skillsChart, page: () =>  WelderSkillChart()),
    GetPage(name: jobVacancy, page: () =>  JobVacancy()),
    GetPage(name: formMemberWelder, page: () =>  FormMemberWelder()),
    GetPage(name: formMemberCompany, page: () =>  FormMemberCompany()),
    GetPage(name: paymentHistory, page: () =>  HistoryPayment()),
    GetPage(name: editProfileMemberWelder, page: () =>  EditProfileMemberWelder()),
    GetPage(name: institutionOfProfessionalCertification, page: () =>  InstitutionOfProfessionalCertification()),



  ];
}
