//: ## 오류 처리
//:
//: 어떤 유형이든 `Error` 프로토콜을 채택하여 오류를 나타낼 수 있습니다.
//:
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

//: 오류를 발생시키기 위해 `throw`를 사용하고 오류를 발생시킬 수 있는 함수를 표시하기 위해 `throws`를 사용합니다. 만약 함수에 오류가 발생하면 함수는 즉시 반환되고 함수를 호출한 코드는 오류를 처리하게 됩니다.
//:
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "토너가 절대 없음" {
        throw PrinterError.noToner
    }
    return "작업 전달됨"
}

//: 오류를 처리하는 데에는 여러 방법이 있습니다. 그 중 하나는 `do`-`catch`를 사용하는 것입니다. `do` 블록 안에서는 `try`를 앞에 붙여서 오류를 발생시킬 수 있는 코드를 표시합니다. `catch` 블록 안에선 이름을 따로 붙이지 않는 이상 오류에 `error`라는 이름이 자동적으로 주어집니다.
//:
do {
    let printerResponse = try send(job: 1040, toPrinter: "필승")
    print(printerResponse)
} catch {
    print(error)
}

//: - Experiment:
//: `send(job:toPrinter:)` 함수가 오류를 발생시키도록 프린터 이름을  `"토너가 절대 없음"`으로 변경해보십시오.
//:
//: 특정 오류를 처리하는 여러 `catch` 블럭을 제공할 수도 있습니다. 스위치의 `case`에 했던것 처럼 `catch` 다음에 패턴을 작성하면 됩니다.
//:
do {
    let printerResponse = try send(job: 1440, toPrinter: "구텐베르크")
    print(printerResponse)
} catch PrinterError.onFire {
    print("이건 그냥 여기 불 옆에 둬야겠어.")
} catch let printerError as PrinterError {
    print("프린터 오류: \(printerError).")
} catch {
    print(error)
}

//: - Experiment:
//: `do` 블록 안에 오류를 발생시키기 위한 코드를 추가하십시오. 오류가 첫번째 `catch` 블럭에 의해 처리되도록 하려면 어떤 종류의 오류가 발생해야 합니까? 또한 두번째 및 세번째 블럭은 어떻습니까?
//:
//: 오류를 처리하는 또 다른 방법은 `try?`를 사용하여 결과를 옵셔널로 변환하는 것입니다. 함수가 오류를 발생시키면, 그 오류는 무시되고 `nil`이 결과가 됩니다. 그 반대라면 함수가 반환한 값을 포함하는 옵셔널 값이 결과가 됩니다.
//:
let printerSuccess = try? send(job: 1884, toPrinter: "메르겐탈러")
let printerFailure = try? send(job: 1885, toPrinter: "토너가 절대 없음")

//: `defer`를 사용하여 모든 다른 코드의 끝에, 즉 함수가 반환되기 전에 실행되는 코드 블럭을 작성합니다. 함수의 오류 발생 여부와 관계 없이 코드가 실행됩니다. `defer`를 사용하면 설정 코드와 정리 코드가 서로 다른 시간에 실행되야하더라도 바로 근처에 쓸 수 있습니다.
//:
var fridgeIsOpen = false
let fridgeContent = ["우유", "계란", "남은 음식"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }

    let result = fridgeContent.contains(food)
    return result
}
fridgeContains("바나나")
print(fridgeIsOpen)



//: [Previous](@previous) | [Next](@next)
