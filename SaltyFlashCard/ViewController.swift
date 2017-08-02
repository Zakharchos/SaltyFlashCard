//
//  ViewController.swift
//  SaltyFlashCard
//
//  Created by iD Student on 8/2/17.
//  Copyright © 2017 SaltLabs. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var questionTextView: UITextView!

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerPickerView: UIPickerView!
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
        answerPickerView.dataSource = self;
        answerPickerView.delegate = self;
        
        
        
        
        setupCardUI ()
        
        
        
        
 }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func  setupCardUI (){
    
    questionLabel.text = CardCollection.instance.currentCard.question
        
    questionLabel.text = "Question \(CardCollection.instance.currentIndex + 1)/\(CardCollection.instance.cards.count)"
        
        
    }//func  setupCardUI
    
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
    
        return 1;
        
    }//public func
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    
    return CardCollection.instance.currentCard.options.count
    
    }//public func
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        return CardCollection.instance.currentCard.options[row];
    }//public func
    
    
    
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        
        var alert : UIAlertController
        
        if CardCollection.instance.checkAnswer(answerPickerView.selectedRow(inComponent: 0)){
          
            alert = UIAlertController(title: "Correct", message: "Correct Answer!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Well done", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true)
        
        
        }//if
        
        else {
        
            alert = UIAlertController(title: "Incorrect", message: "Incorrect Answer.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Damn", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true)
        
        
        
        }
        
        
        
        
        
    }

}//class ViewController

