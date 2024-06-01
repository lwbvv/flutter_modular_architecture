extension TupleWaitFuture<T> on Future<T> {
  static Future<(T1, T2)> wait2<T1, T2>(
      Future<T1> future1,
      Future<T2> future2,
      ) {
    return Future.wait([future1, future2]).then((value) => (
        value[0] as T1,
        value[1] as T2,
    ));
  }

  static Future<(T1, T2, T3)> wait3<T1, T2, T3>(
      Future<T1> future1,
      Future<T2> future2,
      Future<T3> future3,
      ) {
    return Future.wait([future1, future2, future3]).then((value) => (
        value[0] as T1,
        value[1] as T2,
        value[2] as T3,
    ));
  }

  static Future<(T1, T2, T3, T4)> wait4<T1, T2, T3, T4>(
      Future<T1> future1,
      Future<T2> future2,
      Future<T3> future3,
      Future<T4> future4,
      ) {
    return Future.wait([future1, future2, future3, future4]).then((value) => (
        value[0] as T1,
        value[1] as T2,
        value[2] as T3,
        value[3] as T4,
    ));
  }

  static Future<(T1, T2, T3, T4, T5)> wait5<T1, T2, T3, T4, T5>(
      Future<T1> future1,
      Future<T2> future2,
      Future<T3> future3,
      Future<T4> future4,
      Future<T4> future5,
      ) {
    return Future.wait([future1, future2, future3, future4, future5]).then((value) => (
        value[0] as T1,
        value[1] as T2,
        value[2] as T3,
        value[3] as T4,
        value[4] as T5,
    ));
  }

  static Future<(T1, T2, T3, T4, T5, T6)> wait6<T1, T2, T3, T4, T5, T6>(
      Future<T1> future1,
      Future<T2> future2,
      Future<T3> future3,
      Future<T4> future4,
      Future<T4> future5,
      Future<T4> future6,
      ) {
    return Future.wait([future1, future2, future3, future4, future5, future6]).then((value) => (
        value[0] as T1,
        value[1] as T2,
        value[2] as T3,
        value[3] as T4,
        value[4] as T5,
        value[5] as T6,
    ));
  }

  static Future<(T1, T2, T3, T4, T5, T6, T7)> wait7<T1, T2, T3, T4, T5, T6, T7>(
      Future<T1> future1,
      Future<T2> future2,
      Future<T3> future3,
      Future<T4> future4,
      Future<T4> future5,
      Future<T4> future6,
      Future<T4> future7,
      ) {
    return Future.wait([future1, future2, future3, future4, future5, future6, future7]).then((value) => (
        value[0] as T1,
        value[1] as T2,
        value[2] as T3,
        value[3] as T4,
        value[4] as T5,
        value[5] as T6,
        value[6] as T7,
    ));
  }
}
