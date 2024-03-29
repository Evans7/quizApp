//
//  QuestionBankViewController.swift
//  quizApp
//
//  Created by user235857 on 3/24/24.
//

import UIKit

class QuestionBankViewController: UIViewController,UITableViewDataSource , UITableViewDelegate,EditingQuizDelegate{
    
    
    func editingQuizDidFinished(updatedQuiz: Quiz, indexForQuiz: Int) {
        if(indexForQuiz != -1){
            (UIApplication.shared.delegate as? AppDelegate)?.quizLet[indexForQuiz] = updatedQuiz
            quizzes[indexForQuiz] = updatedQuiz
        }
        else {
            quizzes.append(updatedQuiz)
            (UIApplication.shared.delegate as? AppDelegate)?.quizLet.append(updatedQuiz)
            
        }
        quizTable.reloadData()
    }
    
    
    func editingQuizDidCanceled() {
    
    }
    
    
    
    @IBOutlet weak var quizTable: UITableView!
    
    var quizzes = (UIApplication.shared.delegate as? AppDelegate)!.quizLet

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quizzes") as? QuestionTableViewCell
        let correctOption = quizzes[indexPath.row].correctOption
        cell?.question.text = quizzes[indexPath.row].question
        if(correctOption==1){
            cell?.answer.text=quizzes[indexPath.row].option1
            cell?.incorrect1.text=quizzes[indexPath.row].option2
            cell?.incorrect2.text=quizzes[indexPath.row].option3
            cell?.incorrect3.text=quizzes[indexPath.row].option4
        }
        else if(correctOption==2)
        {
            cell?.answer.text=quizzes[indexPath.row].option2
            cell?.incorrect1.text=quizzes[indexPath.row].option1
            cell?.incorrect2.text=quizzes[indexPath.row].option3
            cell?.incorrect3.text=quizzes[indexPath.row].option4        }
        else if(correctOption==3)
        {
            cell?.answer.text=quizzes[indexPath.row].option3
            cell?.incorrect1.text=quizzes[indexPath.row].option1
            cell?.incorrect2.text=quizzes[indexPath.row].option2
            cell?.incorrect3.text=quizzes[indexPath.row].option4        }
        else{
            cell?.answer.text=quizzes[indexPath.row].option4
            cell?.incorrect1.text=quizzes[indexPath.row].option1
            cell?.incorrect2.text=quizzes[indexPath.row].option3
            cell?.incorrect3.text=quizzes[indexPath.row].option2        }
                return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            // Return custom height for each row
            return 250 // Change this to your desired height
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "quizEdit" {
                    
                    if let indexPath = sender as? IndexPath {
                        let OHC = segue.destination as? QuestionEditViewController
                        OHC?.data = indexPath.row
                        OHC!.delegate = self
                        
                    }
                    else {
                        let AQC = segue.destination as? QuestionEditViewController
                        AQC!.delegate = self
                    }
                    
                }
            }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
        {
            performSegue(withIdentifier: "quizEdit", sender: indexPath)
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Question Bank"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func Addbuttonclicked(_ sender: Any) {
        performSegue(withIdentifier: "quizEdit", sender: -1)
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
