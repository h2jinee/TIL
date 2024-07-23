![기본형1_java](https://github.com/user-attachments/assets/6ac5189b-a4bd-44ae-a4d4-306d6e777973)

## n^2 배열 자르기
```java
class Solution {
    public List<Long> solution(int n, long left, long right) {
        List<Long> answer;
        Long[][] array = new Long[n][n];
        ArrayList<Long> list = new ArrayList<>();

        for (int i=0; i < n; i++) {
            for(int j=0; j < n; j++) {
                array[i][j] = (long) Math.max(i + 1, j + 1);
            }
        }

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                list.add(array[i][j]);
            }
        }

        answer = list.subList((int) left, (int) right+1);
        return answer;
    }
}
```
### 문제풀이
처음 문제를 읽었을 때 입출력 예시를 보고 그대로 구현하면 되겠다고 생각했다. <br>
패턴을 먼저 읽는 것이 우선이라 생각하여
```3X3의 경우
1행 1열 = 1
1행 2열, 2행 1열, 2행 2열 = 2
1행 3열, 2행 3열, 3행 1열, 3행 2열, 3행 3열 = 3
```
`i`또는 `j`에 `n`과 같은 숫자가 있을 경우 `i`의 값을 담아 전체 행렬 데이터가 순서대로 담긴 `list`를 만든 후 <br>
`list`에서 `substring`처럼 `left`, `right` 사이의 값을 가지고 오면 되겠다고 생각했다.

<br>

![image](https://github.com/user-attachments/assets/b61338d7-bb7a-4a89-afed-a2c612b761ea)

하지만 테스트 케이스에서 `메모리 초과`로 실패하였다. <br>
long타입인 left, right를 int로 강제 캐스팅 해서 사용하는 것도 풀면서도 ~~이게 아닌데..~~ 라는 생각이 들었지만 <br>
오랜만에 푸는 문제라 그런지 마땅한 방법이 떠오르지 않았다.

### 문제해결
```java
class Solution {
    public List<Long> solution(int n, long left, long right) {
        List<Long> answer = new ArrayList<>();

        for (long idx = left; idx <= right; idx++) {
            long row = idx / n;
            long col = idx % n;
            answer.add(Math.max(row + 1, col + 1));
        }
        return answer;
    }
}
```

검색을 해보니 메모리 초과 해결을 위해서 `전체 N x N 배열을 만들지 않고 직접 계산`하는 방법을 사용해야 한다. <br>

해결하려는 문제는 특정 범위[left, right]에 해당하는 `1차원 배열`의 값을 구하는 것이다. <br>
이 범위는 2차원 배열의 값에서 유도되는데, 배열의 값은 다음과 같다.
```java
array[i][j] = max(i+1, j+1);
```
이 규칙을 이해하기 위해 몇 가지 예를 들어보자면
```java
array[0][0] = max(1, 1) = 1
array[0][1] = max(1, 2) = 2
array[0][2] = max(1, 3) = 3

array[1][0] = max(2, 1) = 2
array[1][1] = max(2, 2) = 2
array[1][2] = max(2, 3) = 3

array[2][0] = max(3, 1) = 3
array[2][1] = max(3, 2) = 3
array[2][2] = max(3, 3) = 3
```

위의 2차원 배열은 다음과 같다.

```java
1 2 3
2 2 3
3 3 3
```

이제 이 2차원 배열을 1차원 배열로 펼쳐보면
```java
1, 2, 3, 2, 2, 3, 3, 3, 3
```
이 되는 것을 알 수 있다.

이제 특정 범위의 값을 구해야 하는데 예를 들어 `[left, right] = [2,5]` 라고 한다면 <br>
이 경우 1차원 배열에서 2번째부터 5번째까지의 값은

```java
1차원 배열: 1, 2, 3, 2, 2, 3, 3, 3, 3
인덱스:     0, 1, 2, 3, 4, 5, 6, 7, 8
결과:       3, 2, 2, 3
```
이 된다.

마지막으로 최적화된 접근 방식을 위해서는 2차원 배열을 실제로 만들지 않고 필요한 값만 계산하는 것인데, <br>
먼저 `left`와 `right` 사이의 각 인덱스에서 해당하는 값을 계산한다.

1. left부터 right까지의 각 인덱스를 반복한다.
2. 각 인덱스를 2차원 배열의 인덱스로 변환한다.
    - 행(row) = `인덱스 / n`
    - 열(column) = `인덱스 % n`
3. 해당 위치의 값을 계산한다.
    - 값 = `max(row + 1, column + 1)`

### 왜 /을 하면 row가 되고 %를 하면 col가 될까?

### 행(row) 인덱스 계산
1차원 배열에서의 인덱스를 n으로 나누면, 그 값은 해당 인덱스가 몇 번째 행에 있는지를 나타낸다. <br>

예를 들어 `n = 3`인 경우
- 인덱스 0, 1, 2은 첫 번째 열 (0번째 열)에 속한다.
- 인덱스 3, 4, 5은 두 번째 열 (1번째 열)에 속한다.
- 인덱스 6, 7, 8은 세 번째 열 (2번째 열)에 속한다.

**즉, 인덱스를 n으로 나누면 몇 번째 행에 있는지 알 수 있다.**

### 열(column) 인덱스 계산
1차원 배열에서의 인덱스를 n으로 나눈 나머지는, 해당 인덱스가 행에서 몇 번째 열에 있는지를 나타낸다. <br>

예를 들어 `n = 3`인 경우
- 인덱스 0, 3, 6은 첫 번째 열 (0번째 열)에 속한다.
- 인덱스 1, 4, 7은 두 번째 열 (1번째 열)에 속한다.
- 인덱스 2, 5, 8은 세 번째 열 (2번째 열)에 속한다.

**즉, 인덱스를 n으로 나눈 나머지는 몇 번째 열에 있는지 알 수 있다.**



#### #99클럽 #코딩테스트준비 #개발자취업 #항해99 #TIL
