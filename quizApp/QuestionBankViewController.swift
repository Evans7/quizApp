//
//  QuestionBankViewController.swift
//  quizApp
//
//  Created by user235857 on 3/24/24.
//

import UIKit

class QuestionBankViewController: UIViewController,UITableViewDataSource , UITableViewDelegate{
    
    
    @IBOutlet weak var quizTable: UITableView!
    
    var quizzes = (UIApplication.shared.delegate as? AppDelegate)!.quizLet

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quizzes")
                
                cell?.textLabel?.text = quizzes[indexPath.row].question
    
                return cell!
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "quizEdit" {
                    
                    if let indexPath = sender as? IndexPath {
                        let OHC = segue.destination as? QuestionEditViewController
                        OHC?.data = indexPath.row
                    }
                    
                }
            }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
        {
            performSegue(withIdentifier: "quizEdit", sender: indexPath)
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
