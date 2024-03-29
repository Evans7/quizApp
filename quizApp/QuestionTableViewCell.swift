//
//  QuestionTableViewCell.swift
//  quizApp
//
//  Created by user235857 on 3/28/24.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {

    
    @IBOutlet weak var incorrect3: UILabel!
    @IBOutlet weak var incorrect2: UILabel!
    
    @IBOutlet weak var incorrect1: UILabel!
    @IBOutlet weak var answer: UILabel!
    @IBOutlet weak var question: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
