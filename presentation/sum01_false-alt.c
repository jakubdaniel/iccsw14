extern unsigned int __VERIFIER_nondet_uint();

int main () {
  int i, n = __VERIFIER_nondet_uint(), sn = 0;

  for (i = 1; i <= n; ++i) {
    if (i < 10)
    sn = sn + 2;
  }

  if (!(sn == n * 2 || sn == 0)) {
      ERROR: goto ERROR;
  }

  return 0;
}
