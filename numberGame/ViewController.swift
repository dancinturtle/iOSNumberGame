//
//  ViewController.swift
//  numberGame
//
//  Created by Amy Giver on 9/8/16.
//  Copyright © 2016 Amy Giver Squid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var randomNumber = Int(0)
    
    @IBOutlet weak var guessTextField: UITextField!
    
    @IBAction func submitGuessButton(sender: UIButton) {
        
        if let submittedGuess = guessTextField.text {
            if submittedGuess != "" {
                print("Guess submitted!",   submittedGuess, randomNumber)
                if Int(submittedGuess) < 101 && Int(submittedGuess) > 0 {
                    if Int(submittedGuess) < randomNumber {
                        responseAlert("\(submittedGuess) is too low.", title: "Incorrect",dismissMessage: "Guess again.", status: 2)
                    }
                    else if Int(submittedGuess) > randomNumber {
                        responseAlert("\(submittedGuess) is too high.", title: "Incorrect",dismissMessage: "Guess again.", status: 2)
                    }
                    else {
                        responseAlert("You're right!! The number was \(randomNumber).", title: "Correct!", dismissMessage: "Play again", status: 1)
                        generateRandomNumber()
                        
                    }
                }
                else {
                    responseAlert("Your guess must be a number between 1 and 100, inclusive.", title: "Doofus", dismissMessage: "Oops, try again", status: 2)
                }
            }
            else {
                responseAlert("Type your guess into the input field.", title: "Doofus",dismissMessage: "Oops, try again", status: 2)
            }
        }
        else {
         print("Can't unwrap")
        }
        guessTextField.text = ""
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomNumber()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func responseAlert(message: String, title: String, dismissMessage: String, status: Int){
        let alertMessage = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alertMessage.addAction(UIAlertAction(title: dismissMessage, style: .Cancel, handler: nil))
//        alertMessage.view.tintColor = UIColor.greenColor()
        let subview = alertMessage.view.subviews.first! as UIView
//        let alertContentView = subview.subviews.first! as UIView
        if status == 1 {
            subview.backgroundColor = UIColor.greenColor()
        }
        else if status == 2 {
            subview.backgroundColor = UIColor.redColor()
        }
        self.presentViewController(alertMessage, animated: true, completion: nil)
    }
    func generateRandomNumber(){
        randomNumber = Int(arc4random_uniform(101))
    }


}

