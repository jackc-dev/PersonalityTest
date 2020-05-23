//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Jack on 1/Aug/19.
//  Copyright © 2019 Jack. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var responses: [Answer]!
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    
    func calculatePersonalityResult() {
        var frequencyOfAnswers:[AnimalType: Int] = [:]
        let responseTypes = responses.map { $0.type }
        
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response]) ?? 0 + 1
        }
        
        let frequentAnswerSorted = frequencyOfAnswers.sorted(by: { (pair1,pair2) -> Bool in return pair1.value > pair2.value
        })
        let mostCommonAnswer = frequentAnswerSorted.first!.key
        
        // Display result
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinationLabel.text = mostCommonAnswer.defination
    }
    
}
