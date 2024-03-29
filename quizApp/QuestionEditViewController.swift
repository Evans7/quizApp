//
//  QuestionEditViewController.swift
//  quizApp
//
//  Created by user235857 on 3/24/24.
//

import UIKit


protocol EditingQuizDelegate {
    func editingQuizDidFinished(updatedQuiz : Quiz,indexForQuiz : Int)
    func editingQuizDidCanceled()
}
class QuestionEditViewController: UIViewController,UINavigationControllerDelegate {
    
    
    var quizzes = (UIApplication.shared.delegate as? AppDelegate)!.quizLet
    var data:Int? = -1
    
    var delegate : EditingQuizDelegate?
    @IBOutlet weak var question: UITextField!
    
    @IBOutlet weak var fourthOption: UITextField!
    @IBOutlet weak var thirdOption: UITextField!
    @IBOutlet weak var secondOption: UITextField!
    @IBOutlet weak var firstOption: UITextField!
    @IBOutlet weak var correctOption: UITextField!
    var updatedQuiz = Quiz()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Question Builder"
        // Do any additional setup after loading the view.
        
        if let recievedIndex = data {
            if(recievedIndex != -1){
                question.text = quizzes[recievedIndex].question
                firstOption.text = String(quizzes[recievedIndex].option1)
                secondOption.text = String(quizzes[recievedIndex].option2)
                thirdOption.text = String(quizzes[recievedIndex].option3)
                fourthOption.text =
                String(quizzes[recievedIndex].option4)
                correctOption.text = String(quizzes[recievedIndex].correctOption)
            }
        }
        
    }
    

    @IBAction func questionBuildingCancelled(_ sender: Any) {
        
        delegate?.editingQuizDidCanceled()

                dismiss(animated: true)
        
    }
    
    
    @IBAction func questionBuildingCompleted(_ sender: Any) {
        
        updatedQuiz.question =  question.text!
        updatedQuiz.option1 = firstOption.text!
        updatedQuiz.option2 = secondOption.text!
        updatedQuiz.option3 = thirdOption.text!
        updatedQuiz.option4 = fourthOption.text!
        updatedQuiz.correctOption = Int(correctOption.text!)!
               
        delegate?.editingQuizDidFinished(updatedQuiz: updatedQuiz, indexForQuiz:data!)
                   
        dismiss(animated: true)
        
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
