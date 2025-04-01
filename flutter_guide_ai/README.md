# Hướng Dẫn Setup Base Project Flutter

# Tạo Package Rest Client

## 1. Tạo thư mục `packages/rest_client`

## 2. Tạo file `pubspec.yaml` lấy version theo Flutter version của project:

```yaml
name: rest_client
description: A package containing API clients and models
version: 0.0.1

environment:
  sdk: ">=3.0.0 <4.0.0"

dependencies:
  dio: ^5.4.0
  retrofit: ^4.1.0
  json_annotation: ^4.8.1
  equatable: ^2.0.5

dev_dependencies:
  build_runner: ^2.4.8
  json_serializable: ^6.7.1
  retrofit_generator: ^8.0.6
```

## 3. Tạo cấu trúc thư mục:

```
lib/
├── apis/
│   ├── auth/
│   │   └── auth_api.dart
│   └── apis.dart
├── models/
│   ├── auth/
│   │   └── auth_model.dart
│   └── models.dart
└── rest_client.dart
```

## 4. Tạo các file trong package:

### 4.1. Auth Model

```dart
// packages/rest_client/lib/models/auth/auth_model.dart
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'auth_model.g.dart';

@JsonSerializable()
class AuthModel extends Equatable {
  final String token;
  final UserModel user;

  const AuthModel({
    required this.token,
    required this.user,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthModelToJson(this);

  @override
  List<Object?> get props => [token, user];
}

@JsonSerializable()
class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;

  const UserModel({
    required this.id,
    required this.email,
    required this.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props => [id, email, name];
}
```

### 4.2. Auth API

```dart
// packages/rest_client/lib/apis/auth/auth_api.dart
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../models/auth/auth_model.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio) = _AuthApi;

  @POST('/auth/login')
  Future<AuthModel> login(@Body() Map<String, dynamic> body);

  @POST('/auth/register')
  Future<AuthModel> register(@Body() Map<String, dynamic> body);

  @POST('/auth/logout')
  Future<void> logout();
}
```

### 4.3. Barrel Files

```dart
// packages/rest_client/lib/models/models.dart
export 'auth/auth_model.dart';

// packages/rest_client/lib/apis/apis.dart
export 'auth/auth_api.dart';

// packages/rest_client/lib/rest_client.dart
export 'apis/apis.dart';
export 'models/models.dart';
```

## Cấu Trúc Thư Mục

```
lib/
├── configs/             # Cấu hình ứng dụng (ENV, API keys)
│   ├── app_config/      # Chứa thông tin môi trường (env)
│
├── core/                # Chứa logic cốt lõi dùng chung
│   ├── bloc/            # Base Bloc classes
│   ├── theme/           # Chủ đề ứng dụng (Theme)
│   ├── constants/       # Hằng số dùng chung
│   ├── errors/          # Xử lý lỗi chung
│   └── extensions/      # Các extension method hỗ trợ
│
├── features/            # Chia tính năng theo module
│   ├── auth/            # Tính năng xác thực người dùng
│   │   ├── bloc/        # Quản lý state với Bloc
│   │   │   ├── auth_cubit.dart # Sử dụng cubit
│   │   │   └── auth_state.dart # Sử dụng @freezed
│   │   ├── widgets/     # Các widget riêng của auth
│   │   └── views/       # Giao diện màn hình auth
│   ├── home/            # Màn hình trang chủ
│
├── services/            # Các service hỗ trợ
│   ├── auth_service/    # Xử lý xác thực
│   ├── storage_service/ # Lưu trữ dữ liệu cục bộ
│   └── analytics_service/ # Theo dõi sự kiện người dùng
│
├── repositories/        # Tầng repository quản lý dữ liệu
│   ├── auth/            # Repository xác thực
│   │   ├── auth_repository.dart       # Interface
│   │   └── auth_repository_impl.dart  # Triển khai interface
│
├── utils/               # Chứa các hàm tiện ích
├── widgets/             # Các widget dùng chung
├── injector/            # Dependency Injection (DI)
│   ├── modules/         # Các module của DI
│   │   ├── bloc_module.dart          # Đăng ký Bloc/Cubit
│   │   ├── dio_module.dart           # Cấu hình Dio
│   │   ├── database_module.dart      # Khởi tạo DB
│   │   ├── repository_module.dart    # Đăng ký Repository
│   │   ├── rest_client_module.dart   # Đăng ký RestClient
│   │   └── service_module.dart       # Đăng ký Service
│   └── injector.dart   # Tập hợp các module DI
│
└── router/              # Quản lý điều hướng trong app
    ├── app_router.dart  # Định nghĩa router chính
    └── routes.dart      # Danh sách các route
```

## 1. Cấu Trúc Thư Mục Chi Tiết

Dự án được tổ chức theo kiến trúc Feature-Based Architecture kết hợp với Clean Architecture, giúp dễ
mở rộng và bảo trì.

### 1.1. Thư mục configs/ – Cấu hình ứng dụng

Chứa các tệp cấu hình liên quan đến ứng dụng, bao gồm:

app_config/: Quản lý thông tin cấu hình như API endpoint, timeout, environment (dev, staging,
production).

Tệp app_config.dart: Định nghĩa các biến toàn cục sử dụng trong ứng dụng.

```dart - ví dụ:
class AppConfig {
  static const String baseUrl = 'https://api.example.com';
  static const int connectTimeout = 30;
  static const int receiveTimeout = 30;
}
```

### 1.2. Thư mục core/ – Chứa các thành phần lõi của ứng dụng

Bao gồm các module tái sử dụng trong nhiều phần khác nhau:

bloc/: Chứa các base class của Bloc (state management).

theme/: Xác định màu sắc, typography, styles chung.

constants/: Chứa các hằng số chung (tên API, thông báo lỗi, v.v.).

errors/: Xử lý và quản lý lỗi tập trung.

extensions/: Các phương thức mở rộng cho String, DateTime, List,...

```dart - ví dụ:
extension StringExtension on String {
  bool get isValidEmail => RegExp(r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-z]+').hasMatch(this);
}

```

### 1.3. Thư mục features/ – Chia nhỏ tính năng

Mỗi tính năng được tổ chức theo module riêng, giúp dễ quản lý và mở rộng.

```Ví dụ: Tính năng Authentication (auth/)
features/
├── auth/
│   ├── bloc/        # Quản lý state của Authentication
│   ├── widgets/     # Các thành phần UI tái sử dụng
│   └── views/       # Màn hình Authentication

```

#### bloc/:

auth_cubit.dart → Quản lý trạng thái, sử dụng cubit
auth_state.dart → Định nghĩa các trạng thái của Authentication.

```dart
@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default('') String error,
    UserModel? userModel,
  }) = _AuthState;
}

```

#### views/: Giao diện của màn hình như Login, Register, Home.

### 1.4. Thư mục services/ – Chứa các dịch vụ hỗ trợ

Dùng để tương tác với API, lưu trữ cục bộ, phân tích dữ liệu.

auth_service/ → Đăng nhập, đăng ký, lưu token

api_service/ → Xử lý HTTP requests (Dio)

storage_service/ → Lưu dữ liệu vào SharedPreferences hoặc SecureStorage

analytics_service/ → Theo dõi hành vi người dùng

```Ví dụ: Tầng Services của Authentication
services/
└── auth_service/
    ├── auth_service.dart         # Interface
    ├── auth_service_impl.dart    # Implement sử dụng
```

```dart - Interface (auth_service.dart):
abstract class AuthService {
  Future<void> saveToken(String token);

  Future<String?> getToken();

  Future<void> clearAuth();

  Future<bool> isAuthenticated();
}
```

```dart - Triển khai với (auth_service_impl.dart):
class AuthServiceImpl implements AuthService {
  final _storage = const FlutterSecureStorage();
  static const _tokenKey = 'auth_token';

  @override
  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  @override
  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  @override
  Future<void> clearAuth() async {
    await _storage.delete(key: _tokenKey);
  }

  @override
  Future<bool> isAuthenticated() async {
    final token = await getToken();
    return token != null;
  }
}
```

### 1.5. Thư mục repositories/ – Quản lý dữ liệu

Repository là tầng trung gian giúp tách biệt logic dữ liệu với UI.
Mỗi tính năng có repository riêng.

```Ví dụ: Tầng Repository của Authentication
repositories/
└── auth/
    ├── auth_repository.dart         # Interface
    ├── auth_repository_impl.dart    # Implement sử dụng API
```

```dart - Interface (auth_repository.dart):
  abstract class AuthRepository {
  Future<User> login(String email, String password);
}
```

```dart - Triển khai với API (auth_repository_impl.dart):
class AuthRepositoryImpl implements AuthRepository {
  final AuthApi _authApi;

  AuthRepositoryImpl(this._authApi);

  @override
  Future<AuthModel> login(String email, String password) async {
    return await _authApi.login({
      'email': email,
      'password': password,
    });
  }
} 
```

### 1.6. Thư mục injector/ – Dependency Injection (DI)

Sử dụng GetIt để quản lý dependency injection.

#### 1.6.1. Injector.dart

```dart
// lib/injector/injector.dart
class Injector {
  Injector._();

  static GetIt instance = GetIt.instance;

  static Future<void> init() async {
    await DatabaseModule.init();
    DioModule.init();
    RepositoryModule.init();
    RestClientModule.init();
    ServiceModule.init();
    BlocModule.init();
  }
}
```

#### 1.6.2. Dio Module

```dart
// lib/injector/modules/dio_module.dart
class DioModule {
  static const String dioInstanceName = 'dio';

  static void init() {
    final injector = Injector.instance;
    final dio = Dio(BaseOptions(
      baseUrl: AppConfig.baseUrl,
      connectTimeout: Duration(seconds: AppConfig.connectTimeout),
      receiveTimeout: Duration(seconds: AppConfig.receiveTimeout),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        //Viết code lấy token từ flutter_secure_storage:

        return handler.next(options);
      },
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          final authService = injector<AuthService>();
          await authService.clearAuth();

          if (navigatorKey.currentContext != null) {
            navigatorKey.currentContext!.go('/login');
          }
        }
        return handler.next(e);
      },
    ));

    injector.registerSingleton<Dio>(dio, instanceName: dioInstanceName);
  }
}
```

#### 1.6.3. Database Module

```dart
// lib/injector/modules/database_module.dart
class DatabaseModule {
  static Future<void> init() async {
    final injector = Injector.instance;
    final prefs = await SharedPreferences.getInstance();
    injector.registerSingleton<SharedPreferences>(prefs);
  }
}
```

#### 1.6.4. Service Module

```dart
// lib/injector/modules/service_module.dart
class ServiceModule {
  static void init() {
    final injector = Injector.instance;

    injector.registerLazySingleton<AuthService>(
          () => AuthServiceImpl(injector<SharedPreferences>()),
    );
  }
}
```

#### 1.6.5. Repository Module

```dart
// lib/injector/modules/repository_module.dart
class RepositoryModule {
  static void init() {
    final injector = Injector.instance;
    
    injector.registerLazySingleton<AuthRepository>(
          () => AuthRepositoryImpl(injector<AuthApi>()),
    );
  }
}
```

#### 1.6.6. RestClient Module

```dart
// lib/injector/modules/repository_module.dart
class RestClientModule {
  RestClientModule._();

  static void init() {
    final injector = Injector.instance;

    injector.registerFactory<AuthApi>(
          () =>
          AuthApi(
            injector(instanceName: DioModule.dioInstanceName),
          ),
    );
  }
}
```

#### 1.6.7. Bloc Module

```dart
// lib/injector/modules/bloc_module.dart
class BlocModule {
  static void init() {
    final injector = Injector.instance;

    injector.registerFactory<AuthCubit>(
          () =>
          AuthCubit(
            injector<AuthRepository>(),
            injector<AuthService>(),
          ),
    );
  }
}
```

### 1.7. Setup Router

#### 1.7.1. Tạo file Routes:

```dart
// lib/router/routes.dart
class Routes {
  static const String home = '/';
  static const String login = '/login';
}
```

#### 1.7.2. Tạo App Router:

```dart
// lib/router/app_router.dart
class AppRouter {
  static final router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: Routes.home,
    redirect: (context, state) async {
      final authService = Injector.instance<AuthService>();
      final isAuthenticated = await authService.isAuthenticated();
      final isAuthRoute = state.matchedLocation == Routes.login ||
          state.matchedLocation == Routes.register;

      if (!isAuthenticated && !isAuthRoute) {
        return Routes.login;
      }

      if (isAuthenticated && isAuthRoute) {
        return Routes.home;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: Routes.login,
        builder: (context, state) => const LoginScreen(),
      ),
    ],
  );
}
```

### 1.8 Cập nhật `pubspec.yaml` lấy version theo Flutter version của project:

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  flutter_bloc: ^8.1.3
  dio: ^5.4.0
  shared_preferences: ^2.2.2
  flutter_secure_storage: ^9.2.4
  get_it: ^7.6.4
  go_router: ^13.0.1
  freezed_annotation: ^2.4.1
  json_annotation: ^4.8.1
  equatable: ^2.0.5
  rest_client:
    path: packages/rest_client

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0
  build_runner: ^2.4.8
  freezed: ^2.4.6
  json_serializable: ^6.7.1
```

## 3. Run lệnh sau:

cd packages/rest_client && flutter pub get && flutter pub run build_runner build && cd ../.. &&
flutter pub get && flutter pub run build_runner build

## 4. Lưu Ý

1. Kiểm tra lại xem đầy đủ các file theo mô tả chưa

2. Kiểm tra các dependencies trong `pubspec.yaml` đã đúng version

3. Đảm bảo đã import đúng các package trong các file

4. Kiểm tra cấu trúc thư mục đã đúng

5. Chạy code generation sau khi thay đổi các file có sử dụng freezed hoặc json_serializable

