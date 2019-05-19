//: ## 함수 및 클로저
//:
//: `func`를 사용하여 함수를 선언할 수 있습니다. 함수 이름과 괄호 안의 인자 목록을 사용하여 함수를 호출하십시오. `->`를 사용하여 함수의 매개 변수의 이름과 반환 유형을 분리합니다.
//:
func greet(person: String, day: String) -> String {
    return "안녕하세요 \(person)님, 오늘은 \(day)입니다."
}
greet(person: "국진", day: "화요일")

//: - Experiment:
//: `day` 매개 변수를 제거하세요. 그리고 오늘의 특별 점심 메뉴를 인사말에 포함할 수 있도록 매개 변수를 추가하세요.
//:
//: 기본적으로 함수는 매개 변수의 이름을 인자 레이블로 사용합니다. 매개 변수의 이름 앞에 사용자 정의 인자 레이블을 쓰거나 인자 레이블을 사용하지 않으려면 `_`를 입력하십시오.
//:
func greet(_ person: String, on day: String) -> String {
    return "안녕하세요 \(person)님, 오늘은 \(day)입니다."
}
greet("진영", on: "수요일")

//: 튜플을 사용하여 다중 값을 만듭니다. 예를 들어, 함수에서 여러 값을 반환할 경우에 사용할 수 있습니다. 튜플의 원소는 이름 또는 숫자로 참조할 수 있습니다.
//:
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)

//: 함수는 내포될 수 있습니다. 내포된 함수는 바깥 함수에서 선언된 변수들에 접근할 수 있습니다. 내포된 함수를 사용하여 길고 복잡한 코드를 함수로 사용할 수 있습니다.
//:
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

//: 함수들은 일급 객체입니다. 이것은 함수가 다른 함수를 값으로 반환할 수 있음을 의미합니다.
//:
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

//: 함수는 다른 함수를 인자로 사용할 수도 있습니다.
//:
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

//: 사실 함수는 나중에 호출할 수 있는 코드 블록인 클로저의 특수한 경우입니다. 클로저의 코드는 실행된 곳이 다른 범위여도 클로저가 작성된 범위에서 사용 가능한 변수 및 함수와 같은 항목에 접근할 수 있습니다. 앞서 보았던 내포된 함수처럼 말이죠. 중괄호(`{}`)로 둘러싼 코드로 이름없는 클로저를 작성할 수 있습니다. `in`을 사용하여 인자들과 반환 유형을 본문으로부터 분리합니다.
//:
numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})

//: - Experiment:
//: 모든 홀수에 대해 0을 반환하도록 클로저를 다시 작성해보십시오.
//:
//: 클로저를 보다 간결하게 작성할 수 있는 몇가지 방법이 있습니다. 클로저의 유형이 이미 알려지면 매개 변수의 유형, 반환 유형, 또는 둘 다를 생략할 수 있습니다. 함수의 인자로 다른 함수가 들어간 경우처럼 말이죠. 단일 표현식의 클로저는 `return`을 적지 않아도 표현식의 유일한 값을 반환합니다.
//:
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

//: 매개 변수의 이름 대신 숫자로 매개 변수를 참조할 수도 있습니다. 이 방법은 매우 짧은 클로저에서 특히 유용합니다. 함수의 마지막 인자로 전달된 클로저는 괄호 뒤에 나타낼 수도 있습니다. 만약 클로저가 함수의 유일한 인자일 경우, 괄호를 완전히 생략할 수도 있습니다.
//:
let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)



//: [Previous](@previous) | [Next](@next)
