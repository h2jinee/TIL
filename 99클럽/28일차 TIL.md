![기본형1_java](https://github.com/user-attachments/assets/6ac5189b-a4bd-44ae-a4d4-306d6e777973)

## 괄호 회전하기

### 문제풀이

```java
import java.util.Stack;

class Solution {
    public int solution(String s) {
        int answer = 0;
        
        // 문자열을 한 글자씩 회전하며 올바른 괄호 문자열인지 체크
        for (int i = 0; i < s.length(); i++) {
            if (isValid(s)) {
                answer++;
            }
            // 문자열 회전
            s = s.substring(1) + s.charAt(0);
        }
        
        return answer;
    }
    
    // 올바른 괄호 문자열인지 확인하는 메소드
    private boolean isValid(String s) {
        Stack<Character> stack = new Stack<>();
        
        for (char c : s.toCharArray()) {
            if (c == '(' || c == '{' || c == '[') {
                stack.push(c);
            } else {
                if (stack.isEmpty()) return false;
                char top = stack.pop();
                if ((c == ')' && top != '(') || 
                    (c == '}' && top != '{') || 
                    (c == ']' && top != '[')) {
                    return false;
                }
            }
        }
        
        return stack.isEmpty();
    }
}
```

### 문제 해결 방법(chatGPT)

1. **문자열 회전**:
   - 주어진 문자열을 한 글자씩 왼쪽으로 회전시키며, 회전된 문자열이 올바른 괄호 문자열인지 확인했습니다.

   - 문자열을 회전시키기 위해 substring 메소드를 사용하여 첫 글자를 뒤로 이동시켰습니다.

2. **스택을 활용한 괄호 검증**:
   - 회전된 문자열이 올바른 괄호 문자열인지 확인하기 위해 스택을 사용했습니다.
     
   - 여는 괄호((, {, [)는 스택에 추가하고, 닫는 괄호(), }, ])는 스택의 최상단 값과 비교하여 짝이 맞는지 확인했습니다.

3. **올바른 괄호 문자열 개수 계산**:
   - 회전된 문자열이 올바른 괄호 문자열일 때마다 answer 값을 증가시켜, 최종적으로 가능한 올바른 괄호 문자열의 개수를 반환했습니다.

#### #99클럽 #코딩테스트준비 #개발자취업 #항해99 #TIL
