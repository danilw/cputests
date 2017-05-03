#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

/*
 * 
 */

static long num_hex_digits(long n) {
    if (!n) return 1;

    long ret = 0;
    for (; n; n >>= 4) {
        ++ret;
    }
    return ret;
}

//sprintf %X very slow this why

void make_hex_string_learning(long n, char *s) {
    const char hex_lookup[] = "0123456789abcdef";
    long len = num_hex_digits(n);
    if (len & 1) {
        *s++ = '0';
    }
    s[len] = '\0';

    for (--len; len >= 0; n >>= 4, --len) {
        s[len] = hex_lookup[n & 0xf];
    }
}

int main(int argc, char** argv) {

    clock_t begin = clock();

    char str[50000];
    strcpy(str, "");
    for (long i = 0; i < 50000000L; i++) {
        sqrt((double) i);
        pow((double) i, 2.56);
        long j = i * 745L;
        char string[80];
        sprintf(&string, "%ld", i);
        strcat(&string, " kaka pipi"); // "Kaka pipi" is a kind of childly call in Dutch. 
        int ij = 0;
        while (string[ij]) {
            string[ij] = toupper(string[ij]);
            ij++;
        }
        if (i % 300 == 0) {
            strcpy(str, "");
        } else {
            char tmp[num_hex_digits(i) + 1];
            make_hex_string_learning(i, tmp);
            strcat(&str, tmp);

        }
    }

    clock_t end = clock();
    double timetocalc = ((double) (end - begin) / CLOCKS_PER_SEC)*1000;
    printf("timetocalc(msec): %f\n", timetocalc);
    return (EXIT_SUCCESS);
}

