//
//  QuizViewController.swift
//  quizApp
//
//  Created by user235857 on 3/24/24.
//

import UIKit

class QuizViewController: UIViewController {

    
    
    @IBOutlet weak var btnoption1: UIButton!
    
    @IBOutlet weak var btnoption3: UIButton!
    
    @IBOutlet weak var btnoption2: UIButton!
    @IBOutlet weak var btnoption4: UIButton!
    
    @IBAction func btnclicked(_ sender: UIButton) {
        if(sender == btnoption1){
            btnoption1.isSelected = true
            btnoption2.isSelected = false
            btnoption3.isSelected = false
            btnoption4.isSelected = false
        }
        else if(sender == btnoption2){
            btnoption1.isSelected = false
            btnoption2.isSelected = true
            btnoption3.isSelected = false
            btnoption4.isSelected = false
        }
        else if(sender == btnoption3){
            btnoption1.isSelected = false
            btnoption2.isSelected = false
            btnoption3.isSelected = true
            btnoption4.isSelected = false
        }
        else if(sender == btnoption4){
            btnoption1.isSelected = false
            btnoption2.isSelected = false
            btnoption3.isSelected = false
            btnoption4.isSelected = true
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        btnoption1.setImage(UIImage(systemName: "ring.circle"),for: .normal)
        btnoption1.setImage(UIImage(systemName: "ring.circle.fill"),for: .selected)
        btnoption2.setImage(UIImage(systemName: "ring.circle"),for: .normal)
        btnoption2.setImage(UIImage(systemName: "ring.circle.fill"),for: .selected)
        btnoption3.setImage(UIImage(systemName: "ring.circle"),for: .normal)
        btnoption3.setImage(UIImage(systemName: "ring.circle.fill"),for: .selected)
        btnoption4.setImage(UIImage(systemName: "ring.circle"),for: .normal)
        btnoption4.setImage(UIImage(systemName: "ring.circle.fill"),for: .selected)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
