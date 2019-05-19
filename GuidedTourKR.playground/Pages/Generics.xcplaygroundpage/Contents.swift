//: ## 제네릭
//:
//: 제네릭 함수나 유형을 만들려면 꺽쇠 괄호(`<>`) 안에 이름을 작성하십시오.
//:
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
         result.append(item)
    }
    return result
}
makeArray(repeating: "똑", numberOfTimes: 4)

//: 클래스, 열거형 및 구조체 뿐만 아니라 함수 및 메소드도 제네릭 형태를 만들 수 있습니다.
//:
// Swift 표준 라이브러리의 옵셔널 유형을 재구현
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

//: 본문 바로 앞에 `where`를 사용하여 요구 사항들을 지정하십시오. 예를 들어, 유형이 프로토콜을 구현하도록 요구하거나, 두 가지 유형을 동일하게 요구하거나, 클래스가 특정 부모 클래스를 갖도록 요구할 수 있습니다.
//:
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Element: Equatable, T.Element == U.Element
{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
   return false
}
anyCommonElements([1, 2, 3], [3])

//: - Experiment:
//: `anyCommonElements(_:_:)` 함수를 수정하여 두 시퀀스가 공통으로 가지고 있는 원소들의 배열을 반환하는 함수를 만드십시오.
//:
//: `<T: Equatable>`를 쓰는 것은 `<T> ... where T: Equatable`를 쓰는 것과 같습니다.
//:


//: [Previous](@previous) | [Next](@next)
