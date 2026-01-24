#include <stdio.h>

int main(){
    int n = 44;
    int prev1 = 1;
    int prev2 = 0;
    int curr = 0;

    for (int i = 1; i < n; i++) {
        curr = prev1 + prev2;
        prev2 = prev1;
        prev1 = curr;
    }

    printf("%d", curr);
    return 0;
}