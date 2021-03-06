//: # Swift 살펴보기
//:
//: 새로운 언어의 첫 프로그램은 "Hello, world!"를 출력하는 것이 전통이죠. Swift에선 한 줄로 완료할 수 있습니다.
//:
print("Hello, world!")

//: 만약 C나 Objective-C를 사용했었다면 이 구문이 익숙할 것입니다. Swift에선 이 한 줄의 코드는 완전한 프로그램입니다. 입/출력 및 문자열 처리와 같은 기능의 라이브러리를 불러올 필요가 없습니다. 전역 범위로 작성된 코드는 프로그램의 진입점으로 사용되므로 `main()` 함수가 필요하지 않습니다. 또한 모든 문장의 끝에 세미콜론을 쓸 필요가 없습니다.
//:
//: 이 자료에서는 다양한 프로그래밍 작업을 수행하는 방법을 보여줌으로써 Swift에서 코드를 작성하기에 충분한 정보를 제공합니다. 이해할 수 없어도 걱정하지 마십시오. 이 자료의 모든 내용은 전부 Swift.org - Documentation - Language Guide에 자세히 설명되어 있습니다.
//:
//: ## 단순 값
//:
//: `let`을 사용하여 상수를 만들고 `var`를 사용하여 변수를 만듭니다. 상수 값은 컴파일할 때 알 필요는 없지만 정확하게 값을 한번 지정해줘야 합니다. 즉, 상수를 사용하여 한번 결정하고 여러 위치에서 사용하는 값을 만들 수 있습니다.
//:
var myVariable = 42
myVariable = 50
let myConstant = 42

//: 상수 또는 변수는 할당하려는 값과 동일한 유형이어야 합니다. 그러나 유형을 명시하지 않아도 됩니다. 상수 또는 변수를 만들 때, 값을 제공하면 컴파일러에서 유형을 추론해줍니다. 위의 예제에서는 초기 값이 정수이기 때문에 컴파일러에서 `myVariable`이 정수임을 유추합니다.
//:
//: 만약 초기 값이 충분한 정보를 제공하지 않는다면 (또는 초기 값이 없다면) 변수 뒤에 콜론을 붙인 다음 자료형을 지정하십시오.
//:
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

//: - Experiment:
//: `Float` 유형이 명시되어 있고, 값이 `4`인 상수를 생성하십시오.
//:
//: 값은 절대로 명시 없이 다른 유형으로 바뀌지 않습니다. 만약 유형을 바꿔야 한다면 인스턴스에 대해 원하는 유형을 명시하십시오.
//:
let label = "너비는 "
let width = 94
let widthLabel = label + String(width)

//: - Experiment:
//: 마지막 줄에서 `String`으로의 변환을 제거해 보십시오. 어떤 오류가 발생합니까?
//:
//: 문자열에 값을 포함하는 더 간단한 방법도 있습니다. 괄호안에 값을 쓰고 괄호 앞에 역슬래시(`\`)를 씁니다. 아래의 예시를 참조하십시오.
//:
let apples = 3
let oranges = 5
let appleSummary = "나는 \(apples)개의 사과를 가지고 있습니다."
let fruitSummary = "나는 \(apples + oranges)개의 과일을 가지고 있습니다."

//: - Experiment:
//: 문자열에 부동 소수점 계산을 포함시키거나 인사말에 다른 사람의 이름을 포함하려면 `\()`를 사용하십시오.
//:
//: 여러 줄을 차지하는 문자열을 사용하고 싶다면 세 개의 큰따옴표(`"""`)를 사용하십시오. 닫는 부분의 큰따옴표가 가지고 있는 만큼의 들여쓰기는 모든 문자열의 줄에서 제거됩니다. 아래의 예시를 참조하십시오.
//:
let quotation = """
나는 "나는 \(apples)개의 사과를 가지고 있습니다."라고 말했습니다.
그리고 나는 "나는 \(apples + oranges)개의 과일을 가지고 있습니다."라고 말했습니다.
"""

//: 대괄호(`[]`)를 사용하여 배열과 딕셔너리를 만들고 인덱스 또는 키를 대괄호에 써서 그것들의 원소에 접근할 수 있습니다. 마지막 원소 뒤에 쉼표가 있어도 상관 없습니다.
//:
var shoppingList = ["고등어", "물", "튤립"]
shoppingList[1] = "물 한병"

var occupations = [
    "준영": "선장",
    "지은": "정비공",
 ]
occupations["민지"] = "홍보 담당자"

//: 배열은 원소를 추가할 때마다 자동적으로 커집니다.
//:
shoppingList.append("파란색 페인트")
print(shoppingList)

//: 새로운 배열이나 딕셔너리를 생성하고 싶다면, 이니셜라이저 구문을 사용하십시오.
//:
let emptyArray = [String]()
let emptyDictionary = [String: Float]()

//: 유형 정보를 추론할 수 있는 경우, 빈 배열은 `[]`로 쓰고, 빈 딕셔너리를 `[:]`로 쓸 수 있습니다. 예를 들어, 변수에 새 값을 설정하거나 함수에 인자를 전달할 때 사용할 수 있습니다.
//:
shoppingList = []
occupations = [:]



//: See [License](License) for this sample's licensing information.
//: 
//: [Next](@next)
