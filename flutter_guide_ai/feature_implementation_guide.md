# Hướng Dẫn Tạo Chức Năng Mới Trong Dự Án Flutter

## A. Quy Trình Tổng Quan

### 1. Phân Tích Yêu Cầu
- Xác định rõ chức năng cần implement
- Liệt kê các API endpoints cần thiết
- Xác định các trường dữ liệu cần thiết cho model
- Xác định các quy tắc validation cho từng trường
- Xác định luồng xử lý chính của feature
- Xác định các trường hợp lỗi cần xử lý

### 2. Tạo Model
- Tạo folder trong `packages/rest_client/lib/models/{feature_name}`
- Tạo file model với JsonSerializable
- Định nghĩa các trường dữ liệu
- Cập nhật file `models.dart` để export model
- Chạy code generation để tạo file `.g.dart`

### 3. Tạo API
- Tạo folder trong `packages/rest_client/lib/apis/{feature_name}`
- Tạo file API với Retrofit
- Định nghĩa các endpoints
- Xác định các trường hợp lỗi API cần xử lý
- Cập nhật file `apis.dart` để export API
- Chạy code generation để tạo file `.g.dart`

### 4. Đăng Ký API
- Đăng ký API trong RestClientModule
- Kiểm tra lại việc đăng ký

### 5. Tạo Repository
- Tạo folder trong `lib/repositories/{feature_name}`
- Tạo interface repository
- Tạo implementation repository
- Đăng ký trong RepositoryModule
- Kiểm tra lại việc đăng ký

### 6. Tạo Service
- Tạo folder trong `lib/services/{feature_name}`
- Tạo interface service
- Tạo implementation service
- Đăng ký trong ServiceModule
- Kiểm tra lại việc đăng ký

### 7. Tạo Cubit
- Tạo folder trong `lib/features/{feature_name}/cubit`
- Tạo state với freezed
- Tạo cubit để quản lý state
- Định nghĩa các trạng thái loading, error, success
- Xử lý các trường hợp lỗi từ API
- Đăng ký trong BlocModule
- Chạy code generation để tạo file `.freezed.dart`

### 8. Tạo UI
- Tạo folder trong `lib/features/{feature_name}/views`
- Tạo folder trong `lib/features/{feature_name}/widgets`
- Phân tích ảnh và implement các màn hình
- Implement các widget tái sử dụng
- Implement form validation
- Kiểm tra responsive và accessibility

### 9. Cập Nhật Router
- Thêm routes trong `lib/router/routes.dart`
- Khởi tạo BlocProvider với mỗi màn hình
- Cập nhật `lib/router/app_router.dart`
- Kiểm tra lại luồng điều hướng

## B. Cấu Trúc Thư Mục

```
lib/
├── features/           # Chứa feature mới
│   └── {feature_name}/
│       ├── cubit/     # Quản lý state
│       ├── views/     # Màn hình UI
│       └── widgets/   # Widget tái sử dụng
│
├── repositories/       # Repository cho feature
│   └── {feature_name}/
│       ├── {feature_name}_repository.dart
│       └── {feature_name}_repository_impl.dart
│
├── services/           # Service cho feature
│   └── {feature_name}/
│       ├── {feature_name}_service.dart
│       └── {feature_name}_service_impl.dart
```

```
packages/rest_client/
├── lib/
│   ├── models/         # Model cho feature
│   │   └── {feature_name}/
│   │       └── {feature_name}_model.dart
│   │
│   └── apis/           # API cho feature
│       └── {feature_name}/
│           └── {feature_name}_api.dart
```

## C. Lưu Ý Quan Trọng

1. **Tuân thủ cấu trúc thư mục**:
   - Mỗi feature nên được tổ chức trong thư mục riêng
   - Tách biệt rõ ràng giữa UI, logic và data

2. **Dependency Injection**:
   - Sử dụng GetIt để quản lý dependencies
   - Đăng ký đầy đủ các dependencies trong các module tương ứng

3. **State Management**:
   - Sử dụng BLoC pattern để quản lý state
   - Tách biệt UI và business logic

4. **Error Handling**:
   - Xử lý tất cả các trường hợp lỗi có thể xảy ra
   - Hiển thị thông báo lỗi rõ ràng cho người dùng

5. **Code Generation**:
   - Chạy code generation sau khi tạo model, API và bloc
   - Kiểm tra các file được generate

## D. Ví Dụ Cụ Thể

Xem file `register_feature.md` để biết chi tiết về cách implement một chức năng cụ thể (Đăng ký). 