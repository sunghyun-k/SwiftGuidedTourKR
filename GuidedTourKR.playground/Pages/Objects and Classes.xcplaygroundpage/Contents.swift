//: ## 객체와 클래스
//:
//: 클래스를 생성하려면 `class` 뒤에 클래스의 이름을 작성하십시오. 클래스의 속성 선언은 클래스의 문맥 안에 있다는 점을 제외하고는 상수 또는 변수의 선언과 같은 방법으로 작성됩니다. 마찬가지로 메소드와 함수 선언도 같은 방식으로 작성하면 됩니다.
//:
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "면을 \(numberOfSides)개 가진 도형."
    }
}

//: - Experiment:
//: `let`을 사용하여 상수 속성을 추가하고 인자를 받는 메소드를 하나 더 추가해보십시오.
//:
//: 클래스의 이름 뒤에 괄호를 넣어 클래스의 인스턴스를 만듭니다. 점 표기법을 사용하여 인스턴스의 속성 및 메소드에 접근합니다.
//:
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

//: 이 버전의 `Shape` 클래스에는 인스턴스 생성 시에 클래스를 설정하는 이니셜라이저가 빠져있습니다. `init`을 사용하여 만들 수 있습니다.
//:
class NamedShape {
    var numberOfSides: Int = 0
    var name: String

    init(name: String) {
       self.name = name
    }

    func simpleDescription() -> String {
       return "면을 \(numberOfSides)개 가진 도형."
    }
}

//: 이니셜라이저에서 속성의 `name`과 인자의 `name`을 구분하기 위해 `self`가 어떻게 사용되었는지 주목하십시오. 클래스의 인스턴스를 생성할 때 이니셜라이저의 인자들은 함수 호출할 때 처럼 전달됩니다. 모든 속성은 속성의 선언 시점(`numberOfSides`와 같이) 또는 이니셜라이저에서(`name`과 같이) 값이 할당되어야 합니다.
//:
//: 객체의 할당을 해제하기 전에 정리하고 싶다면 `deinit`를 사용하여 디이니셜라이저를 만들 수 있습니다.
//:
//: 자식 클래스는 부모 클래스의 이름을 콜론으로 구분하여 클래스의 이름 뒤에 포함합니다. 클래스는 표준 루트 클래스를 상속받아야할 필요가 없습니다. 그러니 부모 클래스는 필요에 의해 포함해도 되고 생략해도 됩니다.
//:
//: 부모 클래스의 구현을 오버라이드하는 자식 클래스의 메소드는 `override`로 표기합니다. 실수로 `override` 없이 오버라이드를 하는 경우 컴파일러에 의해 오류로서 검출됩니다. 또한 컴파일러는 `override`로 표시되어 있지만 부모 클래스의 메소드를 오버라이드하지 않는 메소드도 감지합니다.
//:
class Square: NamedShape {
    var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }

    func area() -> Double {
        return sideLength * sideLength
    }

    override func simpleDescription() -> String {
        return "한 변의 길이가 \(sideLength)인 정사각형."
    }
}
let test = Square(sideLength: 5.2, name: "테스트 정사각형")
test.area()
test.simpleDescription()

//: - Experiment:
//: 반지름과 이름을 이니셜라이저의 인자로 가지는 `NamedShape`의 자식 클래스 `Circle`을 만듭니다. `area()`와 `simpleDescription()` 메소드를 `Circle` 클래스에 구현해 보십시오.
//:
//: 저장을 하는 단순한 속성 외에도 속성은 getter 및 setter를 가질 수 있습니다.
//:
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }

    var perimeter: Double {
        get {
             return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }

    override func simpleDescription() -> String {
        return "한 변의 길이가 \(sideLength)인 정삼각형."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "삼각형")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

//: `perimeter`에 대한 setter에서 새로운 값은 명시하지 않아도 `newValue`라는 이름을 가지고 있습니다. `set` 뒤에 괄호를 사용하여 이름을 명시할 수도 있습니다.
//:
//: `EquilateralTriangle`의 이니셜라이저에는 세 개의 다른 단계가 있는 점에 주목하십시오.
//:
//: 1. 자식 클래스가 선언한 속성에 대한 값을 설정합니다.
//:
//: 1. 부모 클래스의 이니셜라이저를 호출합니다.
//:
//: 1. 부모 클래스가 정의한 속성 값을 변경합니다. 이 시점부터 메소드, getter 또는 setter를 사용하는 추가 설정을 완료할 수 있습니다.
//:
//: 속성을 연산할 필요가 없지만 새로운 값을 설정하기 전과 후에 실행되는 코드를 제공해야 한다면 `willSet`과 `didSet`을 사용하십시오. 제공된 코드는 값이 이니셜라이저 밖에서 변경될 경우 실행됩니다. 예를 들어, 아래의 클래스는 삼각형의 한 변의 길이가 정사각형의 한 변의 길이와 항상 같도록 합니다.
//:
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "다른 테스트 도형")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "더 큰 정사각형")
print(triangleAndSquare.triangle.sideLength)

//: 옵셔널 값을 사용해 작업할 때, 메소드, 속성 및 서브스크립트 작업과 같은 연산을 하기 전에 `?`를 작성합니다. `?` 앞에 오는 값이 `nil`이라면, `?` 뒤의 모든 것은 무시되고 전체 표현식의 값은 `nil`이 됩니다. 반대로 옵셔널 값이 언랩되었다면, `?` 뒤의 모든 것들은 언랩된 것처럼 작동합니다. 두 경우 모두 전체 표현식은 옵셔널 값입니다.
//:
let optionalSquare: Square? = Square(sideLength: 2.5, name: "옵셔널 정사각형")
let sideLength = optionalSquare?.sideLength



//: [Previous](@previous) | [Next](@next)
