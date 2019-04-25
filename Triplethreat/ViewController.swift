//
//  ViewController.swift
//  Triplethreat
//
//  Created by Sivan.Payyadakath on 2019/04/25.
//  Copyright © 2019 Sivan.Payyadakath. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var characterCountLabel: UILabel!
    
    let emojiDelegate = EmojiTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        characterCountLabel.isHidden = true
        
        textField1.delegate = emojiDelegate
        textField3.delegate = self
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //new text
        var newText = textField3.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        //hide label for empty string
        self.characterCountLabel.isHidden = (newText.length == 0)
        
        //write label with length of text in 3rd textfield
        self.characterCountLabel.text = String(newText.length)
        
        return true
    }

}

