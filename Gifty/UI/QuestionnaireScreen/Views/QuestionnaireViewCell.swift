//
//  QuestionnaireViewCellViewCell.swift
//  Gifty
//
//  Created by Oleksii Vasyliev on 02.11.2021.
//

import UIKit

class QuestionnaireViewCell: UITableViewCell {

    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var answerIcon: UIImageView!

    // MARK: - Properties
    
    var checkedAnswerIcon = UIImage(named: "answerYes")
    var uncheckedAnswerIcon = UIImage(named: "answerNo")
    

    func configure(answer: String, isSelected: Bool?) {
        answerLabel.text = answer
        if let answerIsSelected = isSelected {
            answerIcon.image = answerIsSelected ? checkedAnswerIcon : uncheckedAnswerIcon
        } else {
            answerIcon.image = uncheckedAnswerIcon
        }

    }

}
