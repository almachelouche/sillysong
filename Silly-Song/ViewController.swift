//
//  ViewController.swift
//  Silly-Song
//
//  Created by Alma Chelouche on 10/22/17.
//  Copyright © 2017 Alma Chelouche. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    func shortNameFromName(name: String) -> String {
        let lowerCasedName = name.lowercased()
        let vowels = "aeiou"
        let allowedLetters = CharacterSet(charactersIn: vowels)
        let newString = lowerCasedName.folding(options: .diacriticInsensitive, locale: .current)
        if let range = newString.rangeOfCharacter(from: allowedLetters, options: String.CompareOptions.diacriticInsensitive) {
            let startIndex = range.lowerBound
            let subString = name.substring(from: startIndex)
             print (subString)
            return subString
            
        }
        else if newString.isEmpty{
            let empty = "mrrr"
            print(empty)
            return empty
        }
        return lowerCasedName
    }
    
    let bananaFanaTemplate = [
        "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
        "Banana Fana Fo F<SHORT_NAME>",
        "Me My Mo M<SHORT_NAME>",
        "<FULL_NAME>"].joined(separator: "\n")
    
    func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
        let shortName = shortNameFromName(name: fullName)
        let lyrics = bananaFanaTemplate
            .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
            .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
        return lyrics
    }
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }

    @IBAction func displayLyrics(_ sender: Any) {
        return lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
        
    }


}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}


