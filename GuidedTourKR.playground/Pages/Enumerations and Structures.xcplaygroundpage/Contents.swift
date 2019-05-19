//: ## 열거형 및 구조체
//:
//: `enum`을 사용하여 열거형을 생성하세요. 클래스 및 이름을 가진 유형과 같이 열거형은 연관된 메소드를 가질 수 있습니다.
//:
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king

    func simpleDescription() -> String {
        switch self {
            case .ace:
                return "ace"
            case .jack:
                return "jack"
            case .queen:
                return "queen"
            case .king:
                return "king"
            default:
                return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue

//: - Experiment:
//: `Rank`의 원시 값을 사용해 두 개의 `Rank` 값을 비교하는 함수를 작성해 보십시오.
//:
//: 기본적으로 Swift는 원시 값을 0부터 시작하여 1씩 증가하도록 할당합니다. 하지만 값을 명시함으로서 이 동작을 변경할 수 있습니다. 위의 예시처럼, `Ace`에 명시적으로 1이란 원시 값이 주어지면 나머지 원시 값은 순서대로 지정됩니다. `rawValue` 속성을 사용하여 열거형 케이스의 원시 값에 접근합니다.
//:
//: `init?(rawValue:)` 이니셜라이저를 사용하여 열거형의 인스턴스를 원시 값으로부터 만들 수 있습니다. 이 작업은 원시 값과 일치하는 열거형을 반환하거나 일치하는 `Rank`가 없을 경우 `nil`을 반환합니다.
//:
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

//: 열거형의 케이스 값들은 단순히 원시 값을 쓰는 방법 중 하나가 아닌 실제 값입니다. 사실 의미있는 원시 값이 없는 경우라면, 원시 값을 제공할 필요가 없습니다.
//:
enum Suit {
    case spades, hearts, diamonds, clubs

    func simpleDescription() -> String {
        switch self {
            case .spades:
                return "스페이드"
            case .hearts:
                return "하트"
            case .diamonds:
                return "다이아몬드"
            case .clubs:
                return "클럽"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()

//: - Experiment:
//: 스페이드와 클럽에 대하여 "검정"을 반환하고, 하트와 다이아몬드에 대하여 "빨강"을 반환하는 `color()` 메소드를 추가해보십시오.
//:
//: 열거형의 `hearts` 케이스를 참조하는 두 가지 방법을 확인하십시오. `hearts` 상수에 값을 할당할 때에 유형에 대한 명시가 없기 때문에 `Suit.hearts`라는 전체 이름을 써야 했습니다. 그러나 스위치 문 안에서는 간결한 형태인 `.hearts`를 사용했습니다. 왜냐하면 `self`가 이미 슈트(Suit)라는 것을 알고 있기 때문입니다. 값의 유형이 알려졌다면 어디든 간결한 형태로 사용할 수 있습니다.
//:
//: 열거형에 원시 값이 있는 경우, 해당 값들은 선언의 일부로 분류됩니다. 즉, 특정 열거형 케이스로 만들어진 인스턴스는 전부 같은 원시 값을 가지고 있다는 의미입니다. 열거형의 케이스가 값을 가질 수 있도록 하는 다른 방법에는 관련 값(Associated Value)을 가지는 것입니다. 이 값은 인스턴스를 만들 때 결정되며 하나의 열거형 케이스로부터 만들어 졌더라도 다를 수 있습니다. 관련 값은 열거형 케이스 인스턴스의 속성처럼 작동된다고 생각할 수 있습니다. 예를 들어, 서버로부터 일출과 일몰 시간을 요청하는 경우를 생각해 보십시오. 서버는 요청된 정보로 응답하거나, 발생된 문제에 대한 설명으로 응답할 수 있습니다.
//:
enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("오전 6:00", "오후 8:09")
let failure = ServerResponse.failure("치즈가 다 떨어졌습니다.")

switch success {
    case let .result(sunrise, sunset):
        print("\(sunrise)에 일출이 있으며 \(sunset)에 일몰이 있습니다.")
    case let .failure(message):
        print("실패...  \(message)")
}

//: - Experiment:
//: `ServerResponse`에 세번째 케이스를 추가해보십시오.
//:
//: 스위치 케이스에서 일치된 `ServerResponse` 값으로부터 일출과 일몰 시간을 어떻게 추출하는지에 주목하십시오.
//:
//: `struct`를 사용하여 구조체를 생성하십시오. 구조체는 메소드 및 이니셜라이저 등을 포함해 대부분의 클래스 기능을 지원합니다. 구조체와 클래스 사이의 가장 큰 차이점 중 하나는 구조체는 전달될 때 값이 항상 복사되지만, 클래스는 참조로 전달된다는 것입니다.
//:
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

//: - Experiment:
//: 카드의 전체 덱을 가진 배열을 반환하는 함수를 작성하십시오. 카드는 랭크(Rank)와 슈트(Suit)의 조합으로 구성되어 있습니다.
//:


//: [Previous](@previous) | [Next](@next)
