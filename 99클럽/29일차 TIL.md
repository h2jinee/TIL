![기본형1_java](https://github.com/user-attachments/assets/6ac5189b-a4bd-44ae-a4d4-306d6e777973)

## 300. Longest Increasing Subsequence

### 문제풀이

```java
class Solution {
    public int lengthOfLIS(int[] nums) {
        if (nums == null || nums.length == 0) {
            return 0;
        }

        int n = nums.length;
        int[] dp = new int[n];
        int maxLength = 1;

        // 모든 dp 요소를 1로 초기화 (모든 숫자는 자신만으로 LIS가 될 수 있기 때문에 최소 길이는 1)
        for (int i = 0; i < n; i++) {
            dp[i] = 1;
        }

        // dp 테이블 채우기
        for (int i = 1; i < n; i++) {
            for (int j = 0; j < i; j++) {
                if (nums[i] > nums[j]) {
                    dp[i] = Math.max(dp[i], dp[j] + 1);
                }
            }
            // 최장 길이 갱신
            maxLength = Math.max(maxLength, dp[i]);
        }

        return maxLength;
    }
}
```

### 문제 해결 방법(chatGPT)

1. **동적 계획법(DP)을 활용한 LIS 길이 계산**:
   - 주어진 배열에서 각 숫자를 끝으로 하는 가장 긴 증가하는 부분 수열의 길이를 저장하는 `dp` 배열을 사용했습니다.

   - 각 숫자에 대해 이전 숫자들과 비교하며, 더 작은 숫자들 중 가장 긴 LIS에 현재 숫자를 포함시켜 `dp` 값을 갱신했습니다.

2. **이중 반복문을 사용한 비교**:
   - 첫 번째 반복문(`i`)으로 배열을 순회하며, 두 번째 반복문(`j`)으로 `i`보다 앞에 있는 숫자들을 순회하면서 `nums[i] > nums[j]`일 경우 `dp[i]` 값을 갱신했습니다.
     
   - 갱신된 `dp[i]` 값은 `nums[i]`를 포함한 LIS의 길이를 나타내며, 최종적으로 `maxLength`를 통해 가장 긴 LIS의 길이를 구했습니다.

3. **시간 복잡도**:
   - 이 접근법의 시간 복잡도는 `O(n^2)`입니다. 이 방법은 구현이 직관적이고 이해하기 쉬우나, 더 효율적인 `O(n log n)` 방법도 존재합니다.

#### #99클럽 #코딩테스트준비 #개발자취업 #항해99 #TIL
