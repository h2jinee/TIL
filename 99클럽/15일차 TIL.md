<!-- ![기본형1_java](https://github.com/user-attachments/assets/6ac5189b-a4bd-44ae-a4d4-306d6e777973) -->

## 745. Prefix and Suffix Search

### 문제풀이

오늘은 처음으로 leetcode 문제를 풀었다. 결론부터 얘기하자면 문제를 해결하지는 못했다. <br>
어려운 문제는 아니였던 것 같은데 leetcode도 백준과 동일하게 시간 복잡도가 많이 중요한 것 같다. <br>

```java
class WordFilter {
    private String[] words;

    public WordFilter(String[] words) {
        // WordFilter(string[]words) 사전에 있는 단어로 개체를 초기화합니다.
        this.words = words;
    }

    public int f(String pref, String suff) {
        // f(string pref, string suff) 접두사 pref와 접미사 suff가 있는 사전에 있는 단어의 인덱스를 반환합니다.
        // 유효한 인덱스가 두 개 이상인 경우 가장 큰 인덱스를 반환합니다. 사전에 해당 단어가 없으면 -1을 반환합니다.
        int answer = -1;

        for (int i = 0; i < words.length; i++) {
            if (words[i].startsWith(pref) && words[i].endsWith(suff)) {
                answer = i;
            }
        }
        return answer;
    }
}
```
당연히 통과할 거라 예상했는데 `Time Limit Exceeded`이 발생해 고민하다 해결이 안 되어서 chatGPT에게 도움을 청했다.

```java
import java.util.HashMap;
import java.util.Map;

class WordFilter {
    private Map<String, Integer> map;

    public WordFilter(String[] words) {
        map = new HashMap<>();
        for (int index = 0; index < words.length; index++) {
            String word = words[index];
            int length = word.length();
            for (int prefixLength = 1; prefixLength <= length; prefixLength++) {
                for (int suffixLength = 1; suffixLength <= length; suffixLength++) {
                    String key = word.substring(0, prefixLength) + "#" + word.substring(length - suffixLength);
                    map.put(key, index);
                }
            }
        }
    }

    public int f(String pref, String suff) {
        String key = pref + "#" + suff;
        return map.getOrDefault(key, -1);
    }
}
```




#### #99클럽 #코딩테스트준비 #개발자취업 #항해99 #TIL
