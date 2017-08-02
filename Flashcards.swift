//
//  Flashcards.swift
//  SaltyFlashCard
//
//  Created by iD Student on 8/2/17.
//  Copyright © 2017 SaltLabs. All rights reserved.
//

import Foundation

class Flashcard {

    var question : String
    
    var options : [String]
    var correctAnswer : String
    
    init (question : String, options : [String]){
    
    self.question = question
    self.options = options
        
    self.correctAnswer = options[0]
    
    
    }
    
    
}//class Flashcard

class CardCollection  {
    
    public static var instance : CardCollection = CardCollection ()
    
    public private (set) var cards : [Flashcard]
    public private (set) var currentIndex : Int
    
    public var currentCard : Flashcard {
        
            get { return cards [currentIndex] }//get
    
    
    }//public var currentCard : Flashcard
    
    
    private init () {
    
        cards = [ Flashcard (question: "Test Question", options: ["True", "False"]),
                   Flashcard (question: "What's the capitol of Iceland?", options: ["Reykjavik", "Akureyri", "Selfoss", "Grindavik", "Höfn"]),
                    Flashcard (question: "Is this a stupid question?", options: ["Circle the rigt answer", "Yes", "No", "Draw a house"]),
        
        
        
                ]//cards
     
        
        currentIndex = 0;

    }//private init
    
    public func nextQuestion () {
    
            currentIndex += 1
        if (currentIndex >= cards.count) {
        
            currentIndex = 0
        
        }//if
    
    
    }//public func
    
    public func checkAnswer(_ selectedAnswer : Int) -> Bool {
    
        return currentCard.options[selectedAnswer] == currentCard.correctAnswer
    
    }//public func
    
    
    
    
}//class CardCollection
