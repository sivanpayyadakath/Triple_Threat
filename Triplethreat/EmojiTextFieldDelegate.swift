//
//  EmojiTextFieldDelegate.swift
//  Triplethreat
//
//  Created by Sivan.Payyadakath on 2019/04/25.
//  Copyright © 2019 Sivan.Payyadakath. All rights reserved.
//

import Foundation
import UIKit


class EmojiTextFieldDelegate : NSObject, UITextFieldDelegate {


    var translations = [String : String]()
    
    override init() {
    
        super.init()
        
        translations["heart"] = "\u{0001F496}"
        translations["fish"] = "\u{E522}"
        translations["bird"] = "\u{E523}"
        translations["frog"] = "\u{E531}"
        translations["bear"] = "\u{E527}"
        translations["dog"] = "\u{E052}"
        translations["cat"] = "\u{E04F}"

    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var replaceAnEmoji = false
        var emojiStringRange: NSRange
        
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        // For each dictionary entry in translations, pull out a string to search for
        // and an emoji to replace it with
        
        for (emojiString, emoji) in translations {
            
            // Search for all occurances of key (ie. "dog"), and replace with emoji (ie. 🐶)
            repeat {
                emojiStringRange = newText.range(of: emojiString, options: .caseInsensitive)
                
                // found one
                if emojiStringRange.location != NSNotFound {
                    newText = newText.replacingCharacters(in: emojiStringRange, with: emoji) as NSString
                    replaceAnEmoji = true
                }
                
            } while emojiStringRange.location != NSNotFound
        }
        
        // If we have replaced an emoji, then we directly edit the text field
        // Otherwise we allow the proposed edit.
        if replaceAnEmoji {
            textField.text = newText as String
            return false
        } else {
            return true
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
}
