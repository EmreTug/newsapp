import 'package:get_it/get_it.dart';
import 'package:newsapp/core/services/auth_service.dart';
import 'package:newsapp/core/services/API.dart';
import 'package:newsapp/core/services/newsservices.dart';
import 'package:newsapp/ui/view/authenticate/forgotpassword/viewmodel/forgotpassword_viewmodel.dart';
import 'package:newsapp/ui/view/authenticate/login/viewmodel/login_viewmodel.dart';
import 'package:newsapp/ui/view/authenticate/onboard/viewmodel/onboardviewmodel.dart';
import 'package:newsapp/ui/view/authenticate/register/viewmodel/register_viewmodel.dart';
import 'package:newsapp/ui/view/home/addnews/viewmodel/addnews_viewmodel.dart';
import 'package:newsapp/ui/view/home/authorprofile/viewmodel/authorprofile_viewmodel.dart';
import 'package:newsapp/ui/view/home/bookmark/viewmodel/bookmark_viewmodel.dart';
import 'package:newsapp/ui/view/home/detail/viewmodel/detail_viewmodel.dart';
import 'package:newsapp/ui/view/home/explore/viewmodel/explore_viewmodel.dart';
import 'package:newsapp/ui/view/home/home/viewmodel/home_viewmodel.dart';
import 'package:newsapp/ui/view/home/profile/editprofile/viewmodel/editprofile_viewmodel.dart';
import 'package:newsapp/ui/view/home/profile/fillprofile/viewmodel/fillprofileviewmodel.dart';
import 'package:newsapp/ui/view/home/profile/selectnewssource/viewmodel/selectnewssourceviewmodel.dart';
import 'package:newsapp/ui/view/home/profile/selecttopics/viewmodel/selecttopicsviewmodel.dart';
import 'package:newsapp/ui/view/home/profile/viewmodel/profile_viewmodel.dart';
import 'package:newsapp/ui/view/home/trending/viewmodel/trending_viewmodel.dart';

import 'core/services/UserService.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => NewsService());
  locator.registerLazySingleton(() => UserService());

  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => RegisterModel());
  locator.registerFactory(() => ForgotPasswordModel());
  locator.registerFactory(() => OnBoardViewModel());
  locator.registerFactory(() => SelectTopicsModel());
  locator.registerFactory(() => SelectNewsSourceModel());
  locator.registerFactory(() => FillProfileModel());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => BookMarkModel());
  locator.registerFactory(() => AddNewsModel());
  locator.registerFactory(() => AuthorProfileModel());
  locator.registerFactory(() => ProfileModel());
  // locator.registerFactory(() => CommentModel());
  locator.registerFactory(() => DetailModel());
  locator.registerFactory(() => ExploreModel());
  // locator.registerFactory(() => NotificationModel());
  locator.registerFactory(() => EditProfileModel());
  // locator.registerFactory(() => SettingsModel());
  locator.registerFactory(() => TrendingModel());





}
