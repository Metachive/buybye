import 'package:flutter/material.dart';

class ProductRegister extends StatelessWidget {
  const ProductRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("상품 등록")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 제목
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                '상품 등록',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),

            // 이미지 등록 더미
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey, width: 0.5),
                ),
                child: const Center(
                  child: Text(
                    '이미지를 선택하세요',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // 상품명 입력
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 80,
                    child: Text(
                      '상품명',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: '상품명을 입력하세요',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        isDense: true,
                      ),
                      style: const TextStyle(fontSize: 16),
                      maxLines: 1,
                      maxLength: 20,
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        // 상품명 입력 시 처리할 로직
                      },
                      onSubmitted: (value) {
                        // 상품명 입력 완료 시 처리할 로직
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 가격 입력
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 80,
                    child: Text(
                      '가격',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: '가격을 입력하세요',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        isDense: true,
                      ),
                      style: const TextStyle(fontSize: 16),
                      maxLines: 1,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      onChanged: (value) {
                        // 가격 입력 시 처리할 로직
                      },
                      onSubmitted: (value) {
                        // 가격 입력 완료 시 처리할 로직
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 등록 버튼
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // 등록 버튼 클릭 시 처리할 로직
                  },
                  child: const Text('등록하기', style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
