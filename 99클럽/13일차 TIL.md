![기본형1_java](https://github.com/user-attachments/assets/6ac5189b-a4bd-44ae-a4d4-306d6e777973)

## 숫자 카드

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

        int n2 = Integer.parseInt(sc.readLine());
        String s2 = sc.readLine();

        LinkedList<Integer> array = new LinkedList<>();
        LinkedList<Integer> array2 = new LinkedList<>();

        for (int i = 0; i < n; i++) {
            array.add(Integer.valueOf(s.split(" ")[i]));
        }

        for (int i = 0; i < n2; i++) {
            array2.add(Integer.valueOf(s2.split(" ")[i]));
        }

        StringBuilder answer = new StringBuilder();
        for (int i = 0; i < array2.size(); i++) {
            if (array.contains(array2.get(i))) {
                answer.append("1");
            } else {
                answer.append("0");
            }

            if (i < array2.size() - 1) {
                answer.append(" ");
            }
        }

        System.out.println(answer);

    }
}
```
오랜만에 백준에서 문제를 풀어서 그런지 쉬운 문제임에도 시간 초과 에러가 발생했다. <br>
프로그래머스에서는 상대적으로 시간에 관련해서 덜 신경써도 됐던 것 같은데 백준이 이런 부분에서는 조금 더 엄격한 듯하다. 왜 시간 초과 에러가 발생하는지 모르겠어서 chatGPT에게 도움을 요청했다.

	코드를 제출했을 때 시간 초과(TLE) 오류가 발생하는 주된 이유는 array2의 각 요소에 대해 array에서 contains()를 호출하기 때문입니다. contains() 메서드는 평균적으로 O(n)의 시간 복잡도를 가지며, 이를 array2의 모든 요소에 대해 반복하면 전체 복잡도가 O(n \times m)이 됩니다. 여기서 n은 array의 크기, m은 array2의 크기입니다. 이는 큰 입력 크기에 대해 비효율적일 수 있습니다.

	해결 방법

	이 문제를 해결하기 위해 HashSet을 사용하여 첫 번째 리스트의 요소들을 저장하고, 두 번째 리스트의 각 요소가 HashSet에 포함되어 있는지 확인하는 방식으로 시간 복잡도를 줄일 수 있습니다. HashSet은 contains() 메서드에 대해 평균적으로 O(1)의 시간 복잡도를 제공하므로 훨씬 빠르게 확인할 수 있습니다.

따라서 `HashSet`으로 변경하였지만 여전히 시간 초과 오류가 발생했다.
추가 힌트를 요청했을 때 chatGPT가 다음과 같이 힌트를 알려주었고 문제가 통과되었다.

	1.	입력 최적화: 입력을 처리할 때, 매번 split()을 호출하는 것은 비효율적일 수 있습니다. 입력 문자열을 한 번만 split()해서 배열에 저장한 후, 이를 순회하면서 HashSet과 LinkedList에 추가해 보세요.

	2.	출력 최적화: StringBuilder에 append()할 때마다 조건문으로 공백을 추가하고 있습니다. 조건문을 제거하고 마지막에 한 번에 출력하는 방식으로 개선할 수 있습니다.

	3.	리스트 사용 최소화: array2를 LinkedList로 사용하고 있는데, 그냥 int 배열로 처리해도 무방합니다. LinkedList의 불필요한 오버헤드를 피할 수 있습니다.


```java
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashSet;

public class Main {

    public static void main(String[] args) throws IOException {
        BufferedReader sc = new BufferedReader(new InputStreamReader(System.in));
        
        // 첫 번째 입력 처리
        int n = Integer.parseInt(sc.readLine());
        String[] inputArray = sc.readLine().split(" ");
        
        // HashSet에 첫 번째 배열의 요소 저장
        HashSet<Integer> set = new HashSet<>();
        for (int i = 0; i < n; i++) {
            set.add(Integer.parseInt(inputArray[i]));
        }

        // 두 번째 입력 처리
        int n2 = Integer.parseInt(sc.readLine());
        String[] inputArray2 = sc.readLine().split(" ");
        
        // 결과를 저장할 StringBuilder
        StringBuilder answer = new StringBuilder();
        
        // 두 번째 배열의 각 요소가 첫 번째 배열에 있는지 확인
        for (int i = 0; i < n2; i++) {
            if (set.contains(Integer.parseInt(inputArray2[i]))) {
                answer.append("1 ");
            } else {
                answer.append("0 ");
            }
        }

        // 마지막 공백을 제거하고 결과 출력
        System.out.println(answer.toString().trim());
    }
}
```


#### #99클럽 #코딩테스트준비 #개발자취업 #항해99 #TIL
