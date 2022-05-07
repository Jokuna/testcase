```
python index.py [문제 번호] [제출 코드]

```

## Example

### 성공

```
❯ python index.py 1644 ../Baekjoon/0506/1644.cpp
테스트케이스: 100
통과 100
실패 0
```

### 실패
```
❯ python index.py 1644 ../Baekjoon/0506/1644.pre.cpp
/bin/sh: line 1: 41088 Segmentation fault: 11  timeout -s 9 3s ./Main < .//1644/101.in
.//1644/101.in 실패
테스트케이스: 101
통과 100
실패 1
```