![기본형1_java](https://github.com/user-attachments/assets/6ac5189b-a4bd-44ae-a4d4-306d6e777973)

## 모음사전

### 문제풀이

가면 갈수록 어려워지는 문제.. 오늘 문제는 감은 오지만 어떻게 해결해야 할지 모르겠어서 chatGPT한테 힌트를 요청했는데 힌트를 봐도 이해가 가지 않았다.

```java
class Solution {
    public int solution(String word) {
        // 모음 배열
        char[] vowels = {'A', 'E', 'I', 'O', 'U'};
        // 각 자리의 기여도 (자리별로 가능한 단어 수)
        int[] contribution = {781, 156, 31, 6, 1};
        int position = 0;

        for (int i = 0; i < word.length(); i++) {
            // 현재 자리의 문자
            char c = word.charAt(i);
            // 현재 자리의 문자 인덱스 (A = 0, E = 1, I = 2, O = 3, U = 4)
            int index = Arrays.binarySearch(vowels, c);
            // 각 자리의 기여도를 계산하여 더함
            position += contribution[i] * index;
        }

        // 사전에서의 실제 위치 계산 (0-based 인덱스에 1을 더해 1-based 인덱스로 변환)
        return position + word.length();
    }
}
```


### 모음사전 문제 해결 방법(chatGPT)

#### 문제 개요

주어진 문제는 주어진 단어가 사전에서 몇 번째에 위치하는지를 찾는 것입니다. 사전에는 'A', 'E', 'I', 'O', 'U'로만 구성된 단어들이 존재하며, 이들은 특정 규칙에 따라 사전에 정렬되어 있습니다. 예를 들어, 단어 "A", "AA", "AAA", "AAAA", "AAAAA", "AAAAE", "AAAAI" 등과 같은 방식으로 구성됩니다.

#### 문제 해결 방법
이 문제를 해결하기 위해서는 주어진 단어가 사전에서 몇 번째 위치에 있는지를 계산해야 합니다. 이를 위해 각 자리의 문자에 대한 기여도를 사용합니다. 기여도는 각 자리에서 가능한 단어의 수를 나타냅니다.

1. 모음 배열 및 기여도 배열

	- 모음 배열 vowels은 사전에 있는 모든 모음을 저장합니다.

	- 기여도 배열 contribution은 각 자리에서 가능한 단어의 수를 저장합니다.

	- 예를 들어, 첫 번째 자리에서는 5^4 + 5^3 + 5^2 + 5^1 + 5^0 = 781개의 단어가 가능합니다.

2. 문자 위치 계산:

	- 각 문자는 모음 배열에서의 인덱스로 표현할 수 있습니다. 예를 들어, 'A'는 0, 'E'는 1, 'I'는 2, 'O'는 3, 'U'는 4입니다. Arrays.binarySearch(vowels, c)를 사용하여 인덱스를 구합니다.

	- 각 문자의 기여도를 계산하여 총 위치에 더합니다. 각 자리의 기여도는 해당 자리에서 가능한 모든 조합의 수입니다.

	- 이 계산을 위해 contribution 배열과 모음의 인덱스를 곱하여 현재 자리의 기여도를 구합니다.

3. 사전의 실제 위치 계산:

	- 각 자리의 기여도를 합산한 후, 주어진 단어의 길이를 더하여 1-based 인덱스로 변환합니다. 이는 사전에서의 실제 위치를 구하는 방법입니다. 주어진 단어의 길이는 해당 자리수만큼 앞선 모든 가능한 단어의 수를 포함합니다.

결국 이 문제를 풀기 위해서는 비슷한 문제를 많이 풀어 익숙해져야 한다는 생각이 들었다. <br>
엄청 어려운 문제는 아닌 것 같은데 생소해서 접근하는 방법이 어려웠다.

### 새로 알게된 내용

1. `Arrays.binarySearch(vowels, c);`

	이 메소드는 배열에서 특정 값의 인덱스를 찾는다. 배열이 정렬되어 있어야 하며, 찾고자 하는 값이 배열에 없으면 음수 값을 반환한다. 이 문제에서는 주어진 모음 배열에서 특정 문자의 위치를 찾기 위해 사용했다.


#### #99클럽 #코딩테스트준비 #개발자취업 #항해99 #TIL
