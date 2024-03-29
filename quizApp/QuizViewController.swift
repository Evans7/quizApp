//
//  QuizViewController.swift
//  quizApp
//
//  Created by user235857 on 3/24/24.
//

import UIKit

class QuizViewController: UIViewController {

    var quizzes = (UIApplication.shared.delegate as? AppDelegate)!.quizLet
    var index = 0;
    var score = 0;
    var selectedOptions: [Int] = []
    
    @IBOutlet weak var btnoption1: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var btnoption3: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var btnoption2: UIButton!
    @IBOutlet weak var btnoption4: UIButton!
    
    @IBOutlet weak var option4: UILabel!
    @IBOutlet weak var option3: UILabel!
    @IBOutlet weak var option2: UILabel!
    @IBOutlet weak var option1: UILabel!
    @IBOutlet weak var quizQuestion: UILabel!
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
        progressBar.setProgress(0, animated: true)
        if(quizzes.count>0)
        {
            btnoption1.setImage(UIImage(systemName: "ring.circle"),for: .normal)
            btnoption1.setImage(UIImage(systemName: "ring.circle.fill"),for: .selected)
            btnoption2.setImage(UIImage(systemName: "ring.circle"),for: .normal)
            btnoption2.setImage(UIImage(systemName: "ring.circle.fill"),for: .selected)
            btnoption3.setImage(UIImage(systemName: "ring.circle"),for: .normal)
            btnoption3.setImage(UIImage(systemName: "ring.circle.fill"),for: .selected)
            btnoption4.setImage(UIImage(systemName: "ring.circle"),for: .normal)
            btnoption4.setImage(UIImage(systemName: "ring.circle.fill"),for: .selected)
            quizQuestion.text = quizzes[index].question;
            option1.text = quizzes[index].option1;
            option2.text = quizzes[index].option2;
            option3.text = quizzes[index].option3;
            option4.text = quizzes[index].option4;
            prevButton.isEnabled = false
            
        }
        else{
            
            var alert = UIAlertController();
            alert = UIAlertController(title: "Alert", message: "No Quizlet created", preferredStyle: .actionSheet)
                            alert.addAction(UIAlertAction(title: "Okay", style: .destructive, handler: { action in
                                self.navigationController?.popViewController(animated: true)                          }))
            present(alert, animated: true)
            
        }
        

        
    }
    
    @IBAction func changeQuiz(_ sender: UIButton) {
        prevButton.isEnabled = true;
        if(sender.tag == 3)
        {
            selectedOptions.popLast()
            index = index-1
            updateProgress()
            quizQuestion.text = quizzes[index].question;
            option1.text = quizzes[index].option1;
            option2.text = quizzes[index].option2;
            option3.text = quizzes[index].option3;
            option4.text = quizzes[index].option4;
            resetOptions()
            if(index==0){
                prevButton.isEnabled=false
            }
        }
        else{
            
            if(btnoption1.isSelected){
                selectedOptions.append(1)
            }
            else if(btnoption2.isSelected){
                selectedOptions.append(2)
            }
            else if(btnoption3.isSelected){
                selectedOptions.append(3)
            }
            else if(btnoption4.isSelected){
                selectedOptions.append(4)
            }
            
            else{
                var alert = UIAlertController();
                alert = UIAlertController(title: "Error", message: "No Selection made", preferredStyle: .actionSheet)
                                alert.addAction(UIAlertAction(title: "Okay", style: .destructive))
                present(alert, animated: true)
                return;
            }
            index = index+1
            updateProgress()
            if(index==quizzes.count){
                nextButton.isEnabled=false
                var i=0;
                for element in quizzes {
                    if(element.correctOption==selectedOptions[i]){
                        score=score+1
                    }
                    i=i+1
                }

                var alert = UIAlertController();
                alert = UIAlertController(title: "Completed", message: "Your total score is "+String(score), preferredStyle: .actionSheet)
                alert.addAction(UIAlertAction(title: "Great", style: .destructive, handler: { action in
                    
                    self.navigationController?.popViewController(animated: true)                                    }))
                present(alert, animated: true)
            }
            else{
                quizQuestion.text = quizzes[index].question;
                option1.text = quizzes[index].option1;
                option2.text = quizzes[index].option2;
                option3.text = quizzes[index].option3;
                option4.text = quizzes[index].option4;
                resetOptions()
            }
        }
        
    }
    
    func resetOptions()
    {
        btnoption4.isSelected=false
        btnoption3.isSelected=false
        btnoption2.isSelected=false
        btnoption1.isSelected=false
    }
    
    func updateProgress() {
            let totalItems = quizzes.count
            let progress = Float(index) / Float(totalItems)
            progressBar.setProgress(progress, animated: true)
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
