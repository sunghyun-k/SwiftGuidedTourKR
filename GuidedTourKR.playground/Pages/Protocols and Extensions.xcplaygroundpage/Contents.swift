//: ## 프로토콜 및 익스텐션
//:
//: `protocol`을 사용하여 프로토콜을 선언합니다.
//:
protocol ExampleProtocol {
     var simpleDescription: String { get }
     mutating func adjust()
}

//: 클래스, 열거형 및 구조체 모두 프로토콜을 채택할 수 있습니다.
//:
class SimpleClass: ExampleProtocol {
     var simpleDescription: String = "매우 단순한 클래스."
     var anotherProperty: Int = 69105
     func adjust() {
          simpleDescription += "  이제 100% 조정됨."
     }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
     var simpleDescription: String = "단순한 클래스"
     mutating func adjust() {
          simpleDescription += " (조정됨)"
     }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

//: - Experiment:
//: `ExampleProtocol`에 다른 요구사항을 추가하십시오. `SimpleClass` 및 `SimpleStructure`가 프로토콜을 준수하도록 유지하려면 어떤 변경이 필요합니까?
//:
//: 구조체를 수정하는 메소드임을 표기하기 위해 `SimpleStructure`의 선언에서 `mutating` 키워드가 사용된 것에 주목하십시오. 클래스의 메소드는 언제나 클래스를 수정할 수 있기 때문에 `SimpleClass`의 선언에선 `mutating`을 표기할 필요가 없습니다.
//:
//: 기존 유형에 새로운 메소드와 연산 속성과 같은 기능들을 추가하려면 `extension`을 사용하십시오. 익스텐션을 사용하여 다른 곳에서 선언된 유형 또는 불러온 라이브러리나 프레임워크의 유형에 프로토콜 준수를 추가할 수도 있습니다.
//:
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "숫자 \(self)"
    }
    mutating func adjust() {
        self += 42
    }
 }
print(7.simpleDescription)

//: - Experiment:
//: `absoluteValue`(절댓값) 속성을 추가하는 `Double` 유형의 익스텐션을 작성하십시오.
//:
//: 프로토콜을 이름이 있는 다른 유형들처럼 사용할 수 있습니다. 예를 들어, 서로 다른 유형이지만 하나의 프로토콜을 준수하는 유형들을 가질 수 있는 컬렉션 객체를 만들 수 있습니다. 유형이 프토토콜인 값으로 작업할 때에, 프로토콜 외부에서 정의된 메소드는 사용할 수 없습니다.
//:
let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)
// print(protocolValue.anotherProperty)  // 주석 처리를 해제하여 오류 보기

//: 런타임에 변수 `protocolValue`가 `SimpleClass`를 가지고 있어도, 컴파일러는 이 변수를 주어진 유형인 `ExampleProtocol`로 취급합니다. 즉, 프로토콜의 준수를 위한 구현 외에 클래스가 구현하는 메소드나 속성에 실수로 접근할 수 없습니다.
//:


//: [Previous](@previous) | [Next](@next)
