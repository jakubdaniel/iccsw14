int main() {
    unsigned int i, n = 10, s = 0;

    for (i = 1; i <= n; ++i) {
        if (i < 5) {
            s += 2;
        }
    }

    if (s != 2 * n) {
        ERROR: goto ERROR;
    }
}
