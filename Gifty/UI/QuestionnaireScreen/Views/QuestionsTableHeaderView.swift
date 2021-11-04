//
//  QuestionsTableHeaderView.swift
//  Sex Music
//
//  Created by Oleksii Vasyliev on 03.11.2021.
//
//

import UIKit

class QuestionsTableHeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet private weak var questionLabel: UILabel!
    
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func configure(questionTitle: String) {
        questionLabel.text = questionTitle
    }
}
