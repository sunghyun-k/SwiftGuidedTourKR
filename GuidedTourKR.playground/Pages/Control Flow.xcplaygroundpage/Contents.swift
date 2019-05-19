//: ## 제어 흐름
//:
//: `if`와 `swift`를 사용하여 조건문을 만들고, `for`-`in`, `while`, `repeat`-`while`을 사용하여 반복문을 만듭니다. 조건과 루프 변수 주위에는 괄호를 입력하지 않아도 됩니다. 하지만 본문을 감싸는 중괄호는 생략할 수 없습니다.
//:
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

//: `if` 문에서 조건은 반드시 부울 표현식이어야 합니다. 이것은 `if score { ... }`와 같은 코드는 잘못됨을 의미하며 암시적으로 0과 비교하지 않습니다.
//:
//: `if`와 `let`을 같이 사용하여 값이 없을 수도 있는 상황을 처리할 수 있습니다. 이 값은 옵셔널이라고 표현합니다. 옵셔널 값에는 값을 포함할 수도 있고, 값이 없다는 의미인 `nil`을 포함할 수도 있습니다. 유형 뒤에 (`?`)를 붙여 그 값이 옵셔널 값이라는 것을 표시하십시오.
//:
var optionalString: String? = "안녕하세요"
print(optionalString == nil)

var optionalName: String? = "박준희"
var greeting = "안녕하세요!"
if let name = optionalName {
    greeting = "안녕하세요, \(name)님"
}

//: - Experiment:
//: `optionalName`을 `nil`로 변경하십시오. 어떤 인사말이 출력됩니까? `optionalName`이 `nil`인 경우 다른 인사말을 출력하도록 `else` 절을 추가하십시오.
//:
//: 만약 옵셔널 값이 `nil`일 경우 조건은 `false`가 되고 중괄호 안의 코드를 실행하지 않습니다. 반대로 옵셔널 값이 언랩되었고, `let` 뒤의 상수에 할당되었다면 코드 블럭에서 언랩된 값을 사용할 수 있게됩니다.
//:
//: 옵셔널 값을 처리하는 또 다른 방법은 `??` 연산자를 통해 기본 값을 제공하는 것입니다. 옵셔널 값에 값이 없다면, 기본 값이 대신 사용됩니다.
//:
let nickName: String? = nil
let fullName: String = "박준희"
let informalGreeting = "안녕 \(nickName ?? fullName)"

//: 스위치 문은 모든 종류의 데이터를 지원하며 다양한 비교 연산을 지원합니다. 정수나 비교 연산에 국한되지 않습니다.
//:
let vegetable = "빨간 고추"
switch vegetable {
    case "셀러리":
        print("통나무에 건포도를 올려놓고 개미들이 몰려오게 하세요.")
    case "오이", "미나리":
        print("맛있는 차 샌드위치가 되겠는걸요.")
    case let x where x.hasSuffix("고추"):
        print("그거 매운 \(x) 인가요?")
    default:
        print("스프에 넣으면 뭐든 맛있습니다.")
}

//: - Experiment:
//: 기본 케이스를 제거해 보십시오. 어떤 오류가 나타납니까?
//:
//: 패턴에 일치된 값을 상수에 할당하기 위해 패턴에서 `let`이 어떻게 쓰일 수 있는지에 주목하십시오.
//:
//: 일치하는 케이스를 찾으면 케이스 안의 코드를 실행한 뒤 스위치 문을 종료합니다. 다음 케이스로 계속 진행되지 않기 때문에, 각 케이스의 코드 끝에 스위치의 종료를 명시적으로 작성할 필요가 없습니다.
//:
//: `for`-`in`을 사용하여 딕셔너리의 각 키와 값에 사용할 이름을 제공한 뒤, 항목들을 반복합니다. 딕셔너리는 순서가 지정되지 않은 컬렌션이므로, 항목들은 임의의 순서로 반복됩니다.
//:
let interestingNumbers = [
    "소수": [2, 3, 5, 7, 11, 13],
    "피보나치": [1, 1, 2, 3, 5, 8],
    "제곱수": [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

//: - Experiment:
//: 변수를 하나 더 추가하여 어떤 종류(kind)가 가장 큰 숫자를 가지고 있는지와 그 숫자가 얼마인지 추적해 보십시오.
//:
//: `while`을 사용하여 조건이 변경될 때 까지 코드 블럭을 반복할 수 있습니다. 루프를 적어도 한번 이상 실행시키기 위해 루프의 조건을 마지막에 작성할 수도 있습니다.
//:
var n = 2
while n < 100 {
    n *= 2
}
print(n)

var m = 2
repeat {
    m *= 2
} while m < 100
print(m)

//: `..<`를 사용하여 인덱스 범위를 만든 후 그 인덱스에 접근할 수도 있습니다.
//:
var total = 0
for i in 0..<4 {
    total += i
}
print(total)

//: `..<`을 사용하여 하위 값 이상, 상위 값 미만의 범위를 만들고, `...`을 사용하여 하위 값 이상, 상위 값 이하의 범위를 만듭니다.
//:


//: [Previous](@previous) | [Next](@next)
