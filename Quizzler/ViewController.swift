//
//  ViewController.swift
//  Quizzler
//
//  Created by Malik Iscandari
//  Copyright (c) 2019 KilamDesignz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank(); // creating an object of the Question Bank
    var pickedAnswer : Bool = false;
    var qNum : Int = 0;
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQuestion = allQuestions.list[0];
        questionLabel.text = firstQuestion.questionText;
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if(sender.tag == 1){
            pickedAnswer = true;
        } else if(sender.tag == 2){
            pickedAnswer = false;
        }
        
        checkAnswer();

        nextQuestion();
        
        
    }
    
    
    func updateUI() {
      
    }
    

    func nextQuestion() {
        if(qNum < allQuestions.list.count - 1){
        questionLabel.text = allQuestions.list[qNum].questionText;
            qNum += 1;
            //print(qNum)
        } else {
            sendAlert();
            print("this is the last: " , qNum);
            //qNum = 0;
        }
        
    }
    
    
    func checkAnswer() {
        //let firstQuestion = allQuestions.list[0];
        
        let correctAnswer = allQuestions.list[qNum].answer;
        if(correctAnswer == pickedAnswer){
            print("You got it!")
        } else{
            print("wrong");
        }
    }
    
    
    func startOver() {
        qNum = 0;
        nextQuestion();
        
    }
    
    func sendAlert(){
        let endAlert = UIAlertController(title: "Awesome", message: "You've completed the Quiz, do you want to start over?", preferredStyle: .alert);
//        endAlert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: {_ in NSLog("The \"OK\" alert occured")}));
//        self.present(endAlert, animated: true, completion: nil);
        
        let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
            self.startOver();
        }
        endAlert.addAction(restartAction);
        present(endAlert, animated: true, completion: nil)
        
    }
    

    

    
}
