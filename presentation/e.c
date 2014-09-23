int main() {
    unsigned int i, n = 10, sn = 0;

    for (i = 1; i <= n; ++i) {
        if (i < 5) {
            sn += 2;
        }
    }

    if (sn != 2 * n && n != 0) {
        ERROR: goto ERROR;
    }
}
