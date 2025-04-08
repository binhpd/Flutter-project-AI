# Register Feature Implementation Guide

## A. Yêu Cầu Chức Năng

### 1. API Endpoint
- **URL**: `https://dummyjson.com/users/add`
- **Method**: POST
- **Request Body**:
```json
{
    "fullName": "emilys",
    "gender": "Male",
    "contactNumber": "0962906213",
    "email": "abc@gmail.com",
    "password": "123456aA@",
    "reason": "hehehe"
}
```
- **Response**:
```json
{
    "id": 1,
    "username": "emilys",
    "email": "emily.johnson@x.dummyjson.com",
    "firstName": "Emily",
    "lastName": "Johnson",
    "gender": "female",
    "image": "https://dummyjson.com/icon/emilys/128",
    "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

### 2. Form Fields & Validation Rules

#### fullName
- Bắt buộc nhập
- Max 255 ký tự, min 3 ký tự
- Chỉ chứa chữ, không số và ký tự đặc biệt

#### gender
- Không bắt buộc
- Dropdown (male/female/other)
- Default: other

#### contactNumber
- Bắt buộc nhập
- Chỉ nhập dạng number [10,12] số
- Format: +84/84/0 chỉ nhận các đầu số có dạng này

#### email
- Bắt buộc
- Validate email format

#### password
- Bắt buộc
- Min 6 ký tự
- Phải có: chữ hoa, chữ thường, số, ký tự đặc biệt
- Thêm icon ẩn hiện password

#### reason
- Không bắt buộc
- Max 500 ký tự

### 3. UI/UX Requirements

#### Layout
- Design theo ảnh mẫu
- Nhấn vào khoảng trắng màn hình ẩn keyboard

#### Validation UI
- Border đỏ khi lỗi
- Message lỗi hiển thị dưới input
- Clear error khi nhập lại

#### Register Button Flow
1. Validate Form Fields
2. Nếu hợp lệ:
   - Hiển thị loading indicator
   - Xử lý API call
   - Hiển thị Toast message (success/error)
   - Navigate to Login (nếu success)
3. Nếu không hợp lệ:
   - Hiển thị lỗi validation tương ứng

## B. Quy Trình Implement

### 0. Phân Tích Yêu Cầu
- Xác định chức năng cần implement
- Liệt kê API endpoints
- Xác định model fields
- Xác định validation rules
- Xác định luồng xử lý
- Xác định error cases

### 1. Tạo Model
- Tạo folder: `packages/rest_client/lib/models/register`
- Tạo file: `register_model.dart`
- Định nghĩa model với JsonSerializable
- Export trong `models.dart`
- Chạy code generation

### 2. Tạo API
- Tạo folder: `packages/rest_client/lib/apis/register`
- Tạo file: `register_api.dart`
- Định nghĩa endpoints với Retrofit
- Export trong `apis.dart`
- Chạy code generation

### 3. Đăng Ký API
- Đăng ký trong RestClientModule
- Kiểm tra đăng ký

### 4. Tạo Repository
- Tạo folder: `lib/repositories/register`
- Tạo interface: `register_repository.dart`
- Tạo implementation: `register_repository_impl.dart`
- Đăng ký trong RepositoryModule

### 5. Tạo Service
- Tạo folder: `lib/services/register`
- Tạo interface: `register_service.dart`
- Tạo implementation: `register_service_impl.dart`
- Đăng ký trong ServiceModule

### 6. Tạo Bloc
- Tạo folder: `lib/features/register/bloc`
- Tạo state với freezed
- Tạo cubit
- Đăng ký trong BlocModule
- Chạy code generation

### 7. Tạo UI
- Tạo folder: `lib/features/register/views`
- Tạo folder: `lib/features/register/widgets`
- Implement form validation
- Implement UI theo design
- Kiểm tra responsive

### 8. Cập Nhật Router
- Thêm routes trong `routes.dart`
- Cập nhật `app_router.dart`
- Kiểm tra navigation

### 9. Testing
- Test form validation
- Test API integration
- Test error handling
- Test UI/UX
- Test performance
- Test memory leaks

### 10. Documentation
- Cập nhật README
- Document API endpoints
- Document validation rules
- Document error handling
- Thêm code comments 