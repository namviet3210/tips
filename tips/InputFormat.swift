//
//  InputFormat.swift
//  tips
//
//  Created by K-Laboratory on 6/24/16.
//  Copyright © 2016 K-Laboratory. All rights reserved.
//

import UIKit


// 1
class InputFormat: UITextField, UITextFieldDelegate {
    
    // 2
    @IBInspectable var allowedChars: String = ""
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // 3
        delegate = self
        // 4
        autocorrectionType = .No
    }
    
    // 5
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        // 6
        guard string.characters.count > 0 else {
            return true
        }
        
        // 7
        let currentText = textField.text ?? ""
        let prospectiveText = (currentText as NSString).stringByReplacingCharactersInRange(range, withString: string)
        return prospectiveText.containsOnlyCharactersIn(allowedChars)
    }
    
}


// 8
extension String {
    
    // Returns true if the string contains only characters found in matchCharacters.
    func containsOnlyCharactersIn(matchCharacters: String) -> Bool {
        let disallowedCharacterSet = NSCharacterSet(charactersInString: matchCharacters).invertedSet
        return self.rangeOfCharacterFromSet(disallowedCharacterSet) == nil
    }
    
}


//************ MAX LENGTHS FOR INPUT **************
private var maxLengths = [UITextField: Int]()

// 2
extension UITextField {
    
    // 3
    @IBInspectable var maxLength: Int {
        get {
            // 4
            guard let length = maxLengths[self] else {
                return Int.max
            }
            return length
        }
        set {
            maxLengths[self] = newValue
            // 5
            addTarget(
                self,
                action: #selector(limitLength),
                forControlEvents: UIControlEvents.EditingChanged
            )
        }
    }
    
    func limitLength(textField: UITextField) {
        // 6
        guard let prospectiveText = textField.text
            where prospectiveText.characters.count > maxLength else {
                return
        }
        
        let selection = selectedTextRange
        // 7
        text = prospectiveText.substringWithRange(
            Range<String.Index>(prospectiveText.startIndex ..< prospectiveText.startIndex.advancedBy(maxLength))
        )
        selectedTextRange = selection
    }
    
}
