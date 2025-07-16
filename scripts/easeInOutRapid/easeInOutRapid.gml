function easeInOutRapid(t) {
    if (t < 0.5) {
        return 2 * power(t, 3);
    } else {
        return 1 - 2 * power(1 - t, 3);
    }
}