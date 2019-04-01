import Foundation

let equation = readLine();
var containsBodmas = false
var equationArray = equation!.components(separatedBy: " ")

func calculate(operator1: String, integer1: Int, integer2: Int) -> Int {
    var calculateAnswer: Int = 0
    
    if operator1 == "*" {
        let times:(Int, Int) -> Int = (*)
        calculateAnswer = times(integer1, integer2)
        
    }
    if operator1 == "%" {
        let modus:(Int, Int) -> Int = (%)
        calculateAnswer = modus(integer1, integer2)
    }
    else if operator1 == "+" {
        let product:(Int, Int) -> Int = (+)
        calculateAnswer = product(integer1, integer2)
        
    }
    else if operator1 == "-"{
        let minus:(Int, Int) -> Int = (-)
        calculateAnswer = minus(integer1, integer2)
        
    }
    else if operator1 == "/"{
        let divide:(Int, Int) -> Int = (/)
        calculateAnswer = divide(integer1, integer2)
    }
    
    return calculateAnswer
}

func rearrangeBodmas(){
    while containsBodmas == true {
        if let i = equationArray.firstIndex(of: "*"){
            equationArray[i] = String(calculate(operator1: equationArray[i], integer1: Int(equationArray[i-1])!, integer2: Int(equationArray[i+1])!))
            equationArray.remove(at: i-1)
            equationArray.remove(at: i)
            checkBodmas()
            break
        }
        if let i = equationArray.firstIndex(of: "/"){
            equationArray[i] = String(calculate(operator1: equationArray[i], integer1: Int(equationArray[i-1])!, integer2: Int(equationArray[i+1])!))
            equationArray.remove(at: i-1)
            equationArray.remove(at: i)
            checkBodmas()
            break
        }
        if let i = equationArray.firstIndex(of: "%"){
            equationArray[i] = String(calculate(operator1: equationArray[i], integer1: Int(equationArray[i-1])!, integer2: Int(equationArray[i+1])!))
            equationArray.remove(at: i-1)
            equationArray.remove(at: i)
            checkBodmas()
            break
        }
    }
}

func rearrange(){
    if let i = equationArray.firstIndex(of: "+"){
        equationArray[i] = String(calculate(operator1: equationArray[i], integer1: Int(equationArray[i-1])!, integer2: Int(equationArray[i+1])!))
        equationArray.remove(at: i-1)
        equationArray.remove(at: i)
        
    }
    if let i = equationArray.firstIndex(of: "-"){
        equationArray[i] = String(calculate(operator1: equationArray[i], integer1: Int(equationArray[i-1])!, integer2: Int(equationArray[i+1])!))
        equationArray.remove(at: i-1)
        equationArray.remove(at: i)
        
    }
}



func checkBodmas(){
    if equationArray.contains("*") {
        containsBodmas = true
    }
    if equationArray.contains("/") {
        containsBodmas = true
    }
    if equationArray.contains("%") {
        containsBodmas = true
    }
}

while equationArray.count > 2 {
    
    if equationArray.count == 3 {
        
        print(String(calculate(operator1: equationArray[1], integer1: Int(equationArray[0])!, integer2: Int(equationArray[2])!)))
        exit(1)
        
    }
        
    else if equationArray.count >= 3 {
        checkBodmas()
        if containsBodmas == false {
            rearrange()
        }
        else if containsBodmas == true {
            rearrangeBodmas()
            checkBodmas()
        }
        
    }
}
