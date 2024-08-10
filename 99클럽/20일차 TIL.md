![기본형1_java](https://github.com/user-attachments/assets/6ac5189b-a4bd-44ae-a4d4-306d6e777973)

## 큰 수 만들기

### 문제풀이

오늘도 그리디 문제가 나왔는데 풀만한 문제인 것 같아서 시도했다가 도저히 모르겠어서 chatGPT에게 도움을 받았다. 코드가 복잡하거나 어려운 부분은 없는 것 같은데 문제 해결 접근 방법을 보면서 조금 더 익혀야 될 것 같다.

```java
public class Solution {
    public String solution(String number, int k) {
        StringBuilder answer = new StringBuilder();
        int len = number.length() - k;  // 최종 결과 문자열의 길이

        for (int i = 0; i < number.length(); i++) {
            char current = number.charAt(i);

            // 스택에 있는 숫자가 현재 숫자보다 작으면 제거하고, k만큼 제거가 가능할 때까지 반복
            while (k > 0 && answer.length() > 0 && answer.charAt(answer.length() - 1) < current) {
                answer.deleteCharAt(answer.length() - 1);
                k--;
            }

            // 스택에 현재 숫자를 추가
            answer.append(current);
        }

        // 최종 결과는 필요한 길이만큼만 잘라서 반환
        return answer.substring(0, len).toString();
    }
}
```



### 문제 해결 접근 방법(chatGPT)

1.	현재 숫자 선택의 중요성:
	-	가장 큰 수를 만들기 위해서는 앞자리 수가 가능한 한 커야 합니다. 따라서, 남겨야 할 숫자의 후보들 중에서 현재 숫자가 다음 숫자보다 작다면 현재 숫자를 제거하는 것이 유리합니다.

2.	스택을 이용한 숫자 선택:
	-	숫자를 왼쪽에서 오른쪽으로 한 자리씩 확인하면서, 스택에 숫자를 저장합니다.

	-	현재 숫자가 스택의 마지막 숫자보다 크면, 스택의 마지막 숫자를 제거합니다. 이 과정은 k번 반복할 수 있습니다.

	-	이 과정을 반복하면 스택에는 가장 큰 숫자가 남습니다.

3.	최종 결과 도출:
	-	모든 숫자를 다 확인한 후, 만약 제거할 숫자가 남아있다면 스택의 뒤에서부터 남은 개수만큼 제거합니다.
	-	스택에 남아있는 숫자들을 순서대로 이어붙이면 가장 큰 수를 얻을 수 있습니다.

#### #99클럽 #코딩테스트준비 #개발자취업 #항해99 #TIL
