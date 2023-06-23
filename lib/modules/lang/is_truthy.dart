bool isTruthy(v) =>
    v != null &&
    v != false &&
    v != 0 &&
    v != "" &&
    (v is num ? !v.isNaN : true);
