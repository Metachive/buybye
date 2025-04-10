# BuyBye - 쇼핑몰 앱

BuyBye는 Flutter로 개발된 모바일 쇼핑몰 애플리케이션입니다. 사용자가 상품을 둘러보고, 장바구니에 담고, 구매할 수 있는 기능을 제공합니다.

## 주요 기능

### 1. 상품 목록

- 홈 화면에서 다양한 상품을 그리드 형태로 확인할 수 있습니다.
- 각 상품은 이미지, 이름, 가격 정보를 포함합니다.
- 상품을 탭하면 상세 페이지로 이동합니다.

### 2. 상품 상세

- 상품의 상세 정보(이미지, 이름, 가격, 설명)를 확인할 수 있습니다.
- 수량을 조절할 수 있습니다.
- '장바구니에 담기' 또는 '구매하기' 버튼을 통해 구매 프로세스를 시작할 수 있습니다.

### 3. 장바구니

- 선택한 상품들을 장바구니에 담아 관리할 수 있습니다.
- 각 상품의 수량을 조절하거나 삭제할 수 있습니다.
- 총 금액이 자동으로 계산됩니다.
- '구매하기' 버튼을 통해 구매를 완료할 수 있습니다.

### 4. 구매 내역

- 구매한 상품들의 목록을 확인할 수 있습니다.
- 각 구매 항목에는 상품 이미지, 이름, 수량, 가격 정보가 표시됩니다.

### 5. 상품 등록

- 새로운 상품을 등록할 수 있습니다.
- 상품 이미지, 이름, 가격, 설명을 입력할 수 있습니다.

## 기술 스택

- **Flutter**: 크로스 플랫폼 UI 프레임워크
- **Provider**: 상태 관리
- **Image Picker**: 이미지 선택 기능
- **Intl**: 날짜 및 숫자 포맷팅

## 프로젝트 구조

```
lib/
├── main.dart                 # 앱의 진입점
├── homepage.dart             # 홈 화면 (상품 목록)
├── product_detail.dart       # 상품 상세 페이지
├── shopping_cart.dart        # 장바구니 페이지
├── purchase_history.dart     # 구매 내역 페이지
├── product_register.dart     # 상품 등록 페이지
├── models/                   # 데이터 모델
│   ├── product.dart          # 상품 모델
│   ├── product_list.dart     # 상품 목록 관리
│   ├── cart.dart             # 장바구니 항목 모델
│   ├── cart_list.dart        # 장바구니 관리
│   ├── purchase.dart         # 구매 항목 모델
│   └── purchase_list.dart    # 구매 내역 관리
└── widgets/                  # 공통 위젯
    └── common_app_bar.dart   # 공통 앱바
```

## 설치 및 실행 방법

1. Flutter 개발 환경 설정

   ```
   flutter pub get
   ```

2. 앱 실행
   ```
   flutter run
   ```

## 주요 화면

### 홈 화면

- 상품 목록을 그리드 형태로 표시
- 우측 하단의 + 버튼으로 상품 등록 페이지로 이동

### 상품 상세 화면

- 상품의 상세 정보 표시
- 수량 조절 및 장바구니 담기/구매 기능

### 장바구니 화면

- 담은 상품 목록 표시
- 수량 조절 및 삭제 기능
- 총 금액 표시 및 구매 기능

### 구매 내역 화면

- 구매한 상품 목록 표시
- 각 상품의 수량 및 가격 정보 표시

## 향후 개선 사항

- 사용자 인증 기능 추가
- 결제 시스템 연동
- 상품 검색 및 필터링 기능
- 상품 카테고리 기능
- 주문 상태 추적 기능
