
import Foundation

enum Results
{
    case Loss
    case FourTwoOne
    case ThreeOfAKind
    case TwoOfAKindWithBacker
    case Suite
}

struct DiceRoll
{
    let rollCount = 3;
    var rolls = Dictionary<Int, Int>()
    mutating func Roll()
    {
        var newRolls: Dictionary<Int, Int> = [1:0, 2:0, 3:0, 4:0, 5:0, 6:0]
        for _ in 0 ..< rollCount
        {
            let roll = Int.random(in: 1...6)
            newRolls[roll]! += 1
        }
        rolls = newRolls
    }
    func CheckResults() -> Results
    {
        if(rolls[4] == 1 && rolls[2] == 1 && rolls[1] == 1){return Results.FourTwoOne}
        for i in 1...6
        {
            if rolls[i] == 3 { return Results.ThreeOfAKind }
            if rolls[i] == 2 && (rolls[i+1] == 1 || rolls[i-1] == 1) { return Results.TwoOfAKindWithBacker}
            if rolls[i] == 1 && rolls[i+1] == 1 && rolls[i+2] == 1 {return Results.Suite}
        }
        return Results.Loss
    }
}
var gameCompleted = false
var playerRoll = DiceRoll()
repeat{
    var inputValid = false
    repeat
    {
        print("Welcome to 4-2-1, type roll to roll the dice")
        if let input = readLine()
        {
            if input.lowercased() == "roll"
            {
                playerRoll.Roll()
                switch playerRoll.CheckResults() {
                case .Loss:
                    print("You Lose!")
                case .FourTwoOne:
                    print("You got a 4-2-1!")
                case .ThreeOfAKind:
                    print("You got a 3 of a kind!")
                case .TwoOfAKindWithBacker:
                    print("You got a 2 of a kind with a backer!")
                case .Suite:
                    print("You got a suite")
                }
                inputValid = true
            }else
            {
                print("Input invalid, please try again")
            }
        }
    } while !inputValid
    var repeatValid = false
    repeat
    {
        print("Would you like to play again? Type yes or no")
        if let input = readLine()
        {
            switch input
            {
            case "yes":
                repeatValid = true
            case "no":
                gameCompleted = true
                repeatValid = true
            default:
                print("Input invalid, please try again")
            }
        }
    } while !repeatValid
} while !gameCompleted
