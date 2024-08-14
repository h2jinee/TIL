![기본형1_java](https://github.com/user-attachments/assets/6ac5189b-a4bd-44ae-a4d4-306d6e777973)

## 마법의 엘리베이터

### 문제풀이

```java
class Solution {
    public int solution(int storey) {
        int answer = 0;
        
        while (storey > 0) {
            int currentDigit = storey % 10;
            int nextDigit = (storey / 10) % 10;

            if (currentDigit > 5 || (currentDigit == 5 && nextDigit >= 5)) {
                answer += 10 - currentDigit;
                storey += 10;  // carry over to the next digit
            } else {
                answer += currentDigit;
            }
            
            storey /= 10;
        }
        
        return answer;
    }
}
```



### 문제 해결 방법

1. 자리수 별로 처리

	- 숫자의 마지막 자리수부터 하나씩 처리하여 최소 이동 횟수를 계산한다.

    - 현재 자리수가 5를 초과하거나, 5이면서 다음 자리수가 5 이상일 경우, 반올림을 진행하여 다음 자리수에 올림 처리한다.

2. 반올림 처리

	- 올림이 필요한 경우 storey에 10을 더하여 다음 자리수로 넘겨주고, 반대로 필요한 경우 그냥 해당 자리수의 값을 더한다.

    - 이를 통해 최적의 이동 횟수를 구할 수 있다.

3. 반복문 활용

	- 반복문을 통해 자리수별로 접근하여, 필요한 이동 횟수를 answer에 누적했다.

    - 자리수를 나누어가며 문제를 해결했기에, 간결하면서도 효율적인 코드 작성이 가능했다.

#### #99클럽 #코딩테스트준비 #개발자취업 #항해99 #TIL
