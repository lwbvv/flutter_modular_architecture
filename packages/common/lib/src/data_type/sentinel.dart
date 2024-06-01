/// 값을 방출을 할 때 값이 나왔는지 여부만 판단하면 되는 경우에 사용
/*
   ex [Result] 클래스에서 실패할 경우 failure로 방출이 되고 성공한 경우
  success로 방출이 되는데 success에서 방출 됐는지의 여부만 알면 되기 때문에
  Sentinel을 사용하여 방출 됐는지 여부만 체크
  Result.success(Sentinel())
 */
class Sentinel {}