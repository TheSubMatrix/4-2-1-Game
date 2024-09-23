//
//  ViewController.swift
//  421 Game
//
//  Created by user268937 on 9/20/24.
//

import UIKit

class ViewController: UIViewController {

    struct Roll
    {
        init()
        {
            numberRolled = Int.random(in: 1...6)
        }
        var numberRolled: Int
        var imageForRoll: UIImage?
        {
            return UIImage(named: "Dice " + String(numberRolled))
        }
    }

    @IBOutlet weak var resultText: UILabel!
    @IBOutlet var imagesForRolls: [UIImageView]!
    @IBAction func OnRollButtonPressed(_ sender: Any)
    {
        var rolledNumbers: [Int] = []
        for i in imagesForRolls
        {
            let newRoll = Roll()
            if(newRoll.imageForRoll != nil)
            {
                i.image = newRoll.imageForRoll
            }
            rolledNumbers.append(newRoll.numberRolled)
        }
        let result = CalculateScore(rolledNumbers)
        resultText.text = result
    }
    
    func CalculateScore(_ rolledNumers: [Int]) -> String
    {
        var sortedRolledNumbers = rolledNumers
        sortedRolledNumbers.sort()
        if(sortedRolledNumbers[0] == 1 && sortedRolledNumbers[1] == 2 && sortedRolledNumbers[2] == 4)
        {
            return "421"
        }
        if sortedRolledNumbers[0] == sortedRolledNumbers[2]
        {
            return "3 of a kind"
        }
        if (sortedRolledNumbers[0] == sortedRolledNumbers[1] && (sortedRolledNumbers[2] + 1 == sortedRolledNumbers[1] || sortedRolledNumbers[2] - 1 == sortedRolledNumbers[1])) || (sortedRolledNumbers[2] == sortedRolledNumbers[1] && (sortedRolledNumbers[0] + 1 == sortedRolledNumbers[1] || sortedRolledNumbers[0] - 1 == sortedRolledNumbers[1]))
        {
            return "2 of a kind with a backer"
        }
        if sortedRolledNumbers[0] + 2 == sortedRolledNumbers[1] + 1 && sortedRolledNumbers[1] + 1 == sortedRolledNumbers[2]
        {
            return "Suit"
        }
        return "Losing Hand"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
