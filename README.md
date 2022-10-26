# 테스트케이스 자동 채점

## Prerequisites

- make
- g++, python3 ...

## Example

```
make [언어] PLATFORM=[플랫폼] PROBLEM=[문제 번호] SRC=[제출 파일]
```

### baekjoon
make cpp PLATFORM=baekjoon PROBLEM=1000 SRC=../baekjoon/1000-1999/1000.cpp

```bash
➜  testcase git:(master) ✗ make cpp PLATFORM=baekjoon PROBLEM=1000 SRC=../baekjoon/1000-1999/1000.cpp

Platform: baekjoon  Problem:  1000 

TestCase:  1 
Pass
TestCase:  2 
Pass
```

#### python
make python PLATFORM=baekjoon PROBLEM=1000 SRC=../baekjoon/1000-1999/1000.py

### algospot
make cpp PLATFORM=algospot PROBLEM=helloworld SRC=../algospot/h/helloworld.cpp

## 주의사항

대부분의 테스트케이스 결과값에는 개행문자가 붙습니다. 이에 따라 실패가 뜰 수 있습니다.
