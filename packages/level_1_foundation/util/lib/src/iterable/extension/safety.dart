extension IterableSafety<E> on Iterable<E> {
  E? safeReduce(E Function(E value, E element) combine) {
    try {
      return reduce(combine);
    } catch (e) {
      return null;
    }
  }


}