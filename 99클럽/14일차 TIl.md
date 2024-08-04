![기본형1_java](https://github.com/user-attachments/assets/6ac5189b-a4bd-44ae-a4d4-306d6e777973)

## 숫자 카드 2

### 문제풀이

```java
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

public class Main {

    public static void main(String[] args) throws IOException {
        BufferedReader sc = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(sc.readLine());
        String s = sc.readLine();
        int[] str = Arrays.stream(s.split(" ")).mapToInt(Integer::parseInt).toArray();

        int n2 = Integer.parseInt(sc.readLine());
        String s2 = sc.readLine();
        int[] str2 = Arrays.stream(s2.split(" ")).mapToInt(Integer::parseInt).toArray();

        HashMap<Integer, Integer> array = new HashMap<>();

        for (int i = 0; i < n; i++) {
            array.put(str[i], array.getOrDefault(str[i], 0) + 1);
        }


        StringBuilder answer = new StringBuilder();
        for (int i = 0; i < n2; i++) {
            if (array.containsKey(str2[i])) {
                answer.append(array.getOrDefault(str2[i], 0) + " ");
            } else {
                answer.append(0 + " ");
            }
        }
        
        // 마지막 공백을 제거하고 결과 출
        System.out.println(answer.toString().trim());

    }
}
```
전날 푼 문제와 비슷해서 금방 풀 수 있었던 문제. 숫자 카드는 `contains`를 이용해 값 비교를 해서 풀었지만 숫자 카드2는 `getOrDefault`를 이용해 쉽게 풀 수 있다.


### 새로 알게된 내용

1. `trim()`

	`trim()` 메서드는 문자열의 시작과 끝에 있는 공백을 제거한다. 여기서 “공백”은 일반적인 공백 문자뿐만 아니라 탭(\t), 줄바꿈(\n), 캐리지 리턴(\r) 같은 공백 문자를 포함한다. 중요한 점은 **문자열의 중간에 있는 공백은 제거되지 않는다**는 것이다.


#### #99클럽 #코딩테스트준비 #개발자취업 #항해99 #TIL
