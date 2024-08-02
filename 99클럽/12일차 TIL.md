![기본형1_java](https://github.com/user-attachments/assets/6ac5189b-a4bd-44ae-a4d4-306d6e777973)

## H-Index

### 문제풀이

```java
class Solution {
    public int solution(int[] citations) {
        int answer = 0;
        ArrayList<Integer> citationList = new ArrayList<>();

        for (int i = 0; i < citations.length; i++) {
            citationList.add(citations[i]);
        }

        citationList.sort(Collections.reverseOrder());

        for (int i = 0; i < citationList.size(); i++) {
            if (citationList.get(i) >= i + 1) {
                answer++;
            }
        }
        return answer;
    }
}
```
H-Index는 2년 전에도 풀려고 시도 했었던 문제였지만 문제 자체가 어떻게 접근을 해야할지 모르겠어서 풀지 못했던 문제이다. <br>

이번에도 아무리 예시를 보아도
```
어떤 과학자가 발표한 논문 n편 중, h번 이상 인용된 논문이 h편 이상이고 나머지 논문이 h번 이하 인용되었다면 h의 최댓값이 이 과학자의 H-Index입니다.
```

공식이 떠오르지 않았고 우선 입출력 예시에 대한 답이 잘 나오는지 문제를 풀어보았다.

```java
class Solution {
    public int solution(int[] citations) {
        int answer = 0;
        int firstCitation = citations[0];
    
        Arrays.sort(citations);
        for (int i = 1; i < citations.length; i++) {
            if (firstCitation <= citations[i]) {
                answer++;
            }
        }
        return answer;
    }
}
```
| Citations   | Return |
|-------------|--------|
| [3, 0, 6, 1, 5] | 3      |

해당 코드는 리턴 값은 3이 나왔지만 아무래도 예시 입출력만 잘 동작하는지 확인한 터라 테스트 케이스에서 모두 실패하였다. <br>

아무래도 오늘 문제는 시간을 아무리 써도 문제를 풀기가 어렵다고 판단하여 다른 입출력 예시로 chatGPT에게 힌트를 달라고 요청했다.

## H-Index 계산 과정

주어진 배열 `[2, 1, 0, 0, 0, 2]`에 대해 H-Index를 계산하는 과정을 설명합니다.

### 1. 논문 인용 횟수 정렬

먼저 논문의 인용 횟수를 내림차순으로 정렬합니다.

- 초기 배열: `[2, 1, 0, 0, 0, 2]`
- 정렬된 배열: `[2, 2, 1, 0, 0, 0]`

### 2. H-Index 찾기

H-Index는 다음 조건을 만족하는 최대의 `h` 값입니다:
- `h`번 이상 인용된 논문이 `h`편 이상 존재하고, 나머지 논문은 `h`번 이하 인용됨.

논문의 인용 횟수가 내림차순으로 정렬된 상태에서, 각 논문을 순회하며 다음 조건을 확인합니다:
- `citations[i] >= i + 1`

여기서 `i`는 0부터 시작하는 인덱스입니다.

#### 조건 확인

- **i = 0**: `citations[0] = 2`, 조건 `2 >= 0 + 1` 만족
- **i = 1**: `citations[1] = 2`, 조건 `2 >= 1 + 1` 만족
- **i = 2**: `citations[2] = 1`, 조건 `1 < 2 + 1` 불만족

조건이 불만족하는 시점에서 멈추고, 그 이전까지의 `i` 값에서 `i + 1`을 H-Index로 취합니다. 

따라서 `i = 1`까지 조건이 만족되므로 H-Index는 `1 + 1 = 2`입니다.

### 결론

주어진 배열 `[2, 1, 0, 0, 0, 2]`의 H-Index는 **2**입니다.


이 힌트를 보고나서 문제를 어떻게 풀어야 할지 알게 되었고 그대로 문제를 풀어 통과하였다. <br>
하지만 아직도 왜 저 공식이 성립하는지는 이해가 되지 않는다. 🥹


#### #99클럽 #코딩테스트준비 #개발자취업 #항해99 #TIL
