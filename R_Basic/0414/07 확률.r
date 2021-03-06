
## 확률
# 확률 : 생각할 수 있는 모든 경우의 수 중에서 우리가 관심을 갖는 경우의 수가 차지하는 비율

## 용어
# 시행 : 다양한 결과가 나올 수 있는 어떤 행위를 실제로 하는 것 (ex. 주사위 던지기, 복권 긁기, ...)
# 표본공간 : 가능한 모든 경우의 수 (ex. 동전 2번 던지기 - 2 x 2 => 모두 4개의 경우의 수)
# 사건 : 가능한 경우의 수 중 어떠한 요구사항을 만족하는 경우 (ex. 로또에서 연속된 6개의 숫자가 나온 경우 등 ...)
        # 단, 사건이 단 하나의 결과를 의미하지는 않는다(1~6, 10~15 등등의 다른 경우가 존재)
# 배반사건 : 동시에 일어날 수 없는 두 사건 (모두 짝수일 경우 vs 모두 홀수일 경우)
# 여사건 : 어떤 사건이 일어나지 않는 경우 (사건 : 모두 짝수일 경우 <- 여사건 : 하나라도 홀수일 경우)
# 수학적으로는 이들을 모두 집합으로 표현할 수 있음
# 사건은 표본공간의 부분집합으로 정의 -> 공집합도 표본공간의 부분집합이기 때문에 사건으로 정의할 수 있다

## 수학적 확률
# 수학적 확률 : 어떤 가능한 모든 결과를 숫자로 표현 가능
# 예시) 주사위를 두 번 던졌을 때 두 수가 홀수인 경우의 수 : 3 x 3 = 9
#       수학적 확률 => 9/36 = 0.25
# 다만, 표본공간의 크기는 같아야한다 !

## 통계적 확률 - 수학적 확률에 비해 더 구체적으로 접근
# 통계적 확률 : 전체 시행 횟수(n) 중 특정 사건이 일어나는 횟수(r)의 비율

## 통계적 확률이 수학적 확률에 한없이 가까워진다 = 시행 횟수가 무한정 늘어나는 "극한"을 가정
# 1) 시행횟수를 무한히 늘렸을 때 수학적 확률과 통계적 확률은 근접하고, 시행횟수가 적다면 우연에 의해서 수학적 확률에 벗어나는 경우가 발생
#    => 통계학에서는 이를 표집오차(Sampling Error)라고 함 -> 시행횟수가 늘어날수록 표집오차는 점점 줄어들어 0에 가까워짐
# 2) 수학적 확률과 통계적 확률간의 차이가 0에 가까워지지만, 절대로 0이 되지는 않음

### 큰 수의 법칙 (라플라스의 정리) - 큰 모집단에서 무작위로 뽑은 표본의 평균이 전체 모집단의 평균과 가까울 가능성이 높음
# 실제 자료의 값으로 계산한 평균 (표본평균) >> 모집단이 클수록 특정 값(기댓값 = 수학적 확률)에 가까워진다
# 통계적 확률은 비율 자체가 일종의 표본평균이기 때문에, 큰 수의 법칙의 특수한 경우에 해당한다.
# (요구사항을 만족하는 사건의 횟수 / 시행횟수) = 통계적 확률 = 기록된 값의 평균
# ** 평균은 자료의 총합을 자료의 개수로 나눈 것이기 때문에, 자료가 많을수록 통계적 확률은 기댓값에 가까워짐

### [예시] 동전을 던질 경우 앞면이 나올 확률은 0.5
# - 동전을 5회 던졌을 경우, 앞면이 나올 확률
# 시행결과 : 1 0 0 0 1
# 시행횟수 : 5
# 사건의 횟수 : 2
# 평균 : 2/5 = 0.4 !

# - 동전을 20회 던졌을 경우, 앞면이 나올 확률
# 시행결과 : 1 1 1 0 0 1 0 1 0 0 1 0 1 1 1 1 0 0 0 1
# 시행횟수 : 5
# 사건의 횟수 : 11
# 평균 : 11/20 = 0.55 ! => 시행 횟수가 클수록 기대값에 가까워진다

## R을 이용한 시뮬레이션
# 동전 던지기 - 결과값의 경우의 수는 두 가지(앞면, 뒷면)
# 서로가 상호 배타적인 사건임을 이용하여 앞면이 하나라도 나올 확률을 구하면, 뒷면이 하나라도 나올 확률 계산 가능!

## 베르누이 시행(Bernoulli trial) : 임의의 결과가 '성공'/'실패' or '예'/'아니오' 의 두 가지 중 하나인 실험
#                               ex) 주사위 던지기 - 6이 나오면 '성공', 그 외의 결과는 모두 '실패'라고 정의
#   성공의 결과가 나타날 확률 p=P(S), 실패가 나타날 확률 q=P(F)=1-p => p + q = 1 !
#   각 시행은 독립적이며, 다음 시행의 결과에 영향을 주지 않는다

# R에서 사용하는 베르누이 시행 함수 rbinom()
# r = random -> R에서 확률적 난수를 생성하여 실행
# binom = binomial(이항) / 이항분포 : 연속된 n번의 독립적 시행에서 각 시행이 확률 p를 가질 때의 이산 확률 분포
# rbinom()으로 계산할 수 있다!

# rbinom() 함수 형식 : rbinom(난수의 개수 = 시행 결과의 개수(n), 시행횟수, 성공 확률(1미만))
x <- rbinom(10000, 1, 0.5)  # 동전 n번 던지기, 시행횟수, 성공확률 => 출력은 시행횟수에 따른 결과값의 누적으로 보여줌    #nolint
mean(x)     # 시행 횟수가 커질수록 0.5에 근접해진다 => 베르누이 시행 !!

## [예제] 수학적 확률로 문제 풀기
# 1~5까지 숫자 카드를 섞어서 세 장의 카드를 뽑아 세자리 숫자를 만들 때, 결과가 320보다 클 확률은?
# 2*4P2 + 1*3P1*3P1 / 5P3    24+9 = 33 / 60 = 0.55

## [예제] 통계적 확률로 문제 풀기 - 시뮬레이션
# 앞의 수학적 내용을 알지 못해도 풀 수 있는 방법 -> "시행횟수가 늘어남에 따라 통계적 확률은 수학적 확률에 한없이 가까워진다"
# 장점 : 모든 경우의 수를 다 검토하지 않아도 되고, 경우의 수를 계산하기 복잡한 문제에서 유용하게 사용
# 시뮬레이션을 충분히 진행하여 비율을 계산하면 통계적 확률이 되며, 수학적 확률에 근사하게 됨

# 몬테카를로 시뮬레이션 : 수학적인 공식을 사용하지 않고 확률을 계산하는 방법 - 따로 프로그래밍 할 필요 없음
# sample(추첨할 대상, 추첨할 개수, 복원 추출 여부)
sample(1:5, 3, replace = F) # => 1~5까지 숫자를 3개 뽑기, 비복원추출로
simul <- 1000
succ <- 0
for (a in 1:simul) {
    x <- sample(1:5, 3, replace = F)
    if (x[1] >= 4) succ <- succ + 1
    else if (x[1] == 3 & x[2] >= 2) succ <- succ + 1
}
print(succ / simul)     # 성공횟수 / 시행횟수 .

### 몬테카를로 방법을 사용하여 원주율 계산
# 시뮬레이션을 통해 원주율을 구하고, 실제 원주율(3.14....)과 비교
# 원의 넓이 = π * 반지름^2 => π = 원의 넓이 / 반지름^2
# 사분원의 넓이 = π/4 => π = 4 * 반지름이 1인 사분원의 넓이
# X축과 Y축을 중심으로 2차원 좌표 평면을 고려했을 때, 사분원은 길이가 1인 정사각형 안에 들어간 형태
# 길이가 1인 정사각형에 매우 작은 입자를 뿌렸을 때, 사분원의 안에 속한 입자의 비율과 밖에 속한 입자의 비율이 정해진다
#               ** 입자는 무작위로 뿌린다
# 사분원의 안에 속한 입자의 비율 = 사분원의 넓이 비율이라고 추측 가능 !!!!
# 오차가 생길 수는 있으나, 입자를 충분히 많은 양으로 뿌린다면 통계적 확률은 수학적 확률에 가깝게 됨

## R에서 균일분포를 갖는 난수를 발생시키는 함수 runif(난수의 개수(n))
# -> 0에서 1 사이의 무작위 숫자 하나를 선택하여 좌표 x, y값으로 대입한다
# 대각선 길이 구하기 : 루트(x^2 + y^2)
sim <- 2000
x <- vector(length = sim)
y <- vector(length = sim)
res <- 0

for (i in 1:sim) {
    x[i] <- runif(1)
    y[i] <- runif(1)
    if (x[i]^2 + y[i]^2 < 1) res <- res + 1
}
print(res)      # 점의 개수
print(4 * res / sim)    # 큰 수의 법칙 적용 시 원주율 값인 3.14와 근사한 값들이 나옴

# 그래프로 그려보기
circle <- function(x) sqrt(1 - x^2) # 원 둘레 그리기 위한 함수
plot(x, y, xlab = "X", ylab = "Y")
curve(circle, from = 0, to = 1, add = T, col = "blue", lwd = 2)
# add = True (현재 그래프에 더하기) / lwd = 선 굵기
print(circle(x))

## 몬티홀 문제
# 선택을 바꾸지 않은 경우
sim <- 10000
doors <- 1:3
suc <- 0
for (i in 1:sim) {
    # 세 개의 문 중에 차의 위치 선택
    car <- sample(doors, 1)

    # 차가 없는 곳에 염소들을 배치
    if (car == 1) goat <- c(2, 3)
    else if (car == 2) goat <- c(1, 3)
    else goat <- c(1, 2)

    # 참가자가 문을 선택
    pick <- sample(doors, 1)

    # 참가자가 고르지 않은 문 중 염소가 있는 문 찾기
    fake <- goat[goat != pick]      # 참가자가 선택하지 않은 문 중 염소가 있는 문 선택

    # 참가자가 고르지 않은 문 중 염소가 있는 문 하나를 열어주기
    if (length(fake) > 1) open <- sample(fake, 1)
    else open <- fake

    # 바꾸지 않고 처음 고른 문이 차가 있는 문인 경우
    if (pick == car) suc <- suc + 1
}
print(suc / sim)

# 선택을 바꾸는 경우
succ <- 0
for (i in 1:sim) {
    # 세 개의 문 중에 차의 위치 선택
    car <- sample(doors, 1)

    # 차가 없는 곳에 염소들을 배치
    if (car == 1) goat <- c(2, 3)
    else if (car == 2) goat <- c(1, 3)
    else goat <- c(1, 2)

    # 참가자가 문을 선택
    pick <- sample(doors, 1)

    # 참가자가 고르지 않은 문 중 염소가 있는 문 찾기
    fake <- goat[goat != pick]      # 참가자가 선택하지 않은 문 중 염소가 있는 문 선택

    # 참가자가 고르지 않은 문 중 염소가 있는 문 하나를 열어주기
    if (length(fake) > 1) open <- sample(fake, 1)
    else open <- fake

    # 참가자가 바꾼 문 찾기
    pick <- doors[doors != open & doors != pick]

    # 바꾼 문이 차가 있는 문인 경우
    if (pick == car) succ <- succ + 1
}
print(succ / sim)

## 생일 역설 : 생일이 같은 사람이 있을 확률
        # => 왜 드물게 보이는 사건은 꼭 일어나는가?
res <- 1
bdprob <- function(x) {
    for (i in 1:(x - 1)) {
    res <- res * (365 - i) / 365    # 각각 생일이 다를 확률
    }
    return(1 - res)
}
print(bdprob(20))

## 심슨의 역설
# 데이터의 세부 그룹별로 일정한 추세나 경향성이 나타나지만, 전체적으로 보면 그 추세가 사라지거나 반대 방향의 경향성을 나타내는 현상