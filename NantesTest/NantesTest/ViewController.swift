//
//  ViewController.swift
//  NantesTest
//
//  Created by xuxiwen on 2019/2/28.
//  Copyright © 2019 xuxiwen. All rights reserved.
//

import UIKit
import Nantes

class ViewController: UIViewController {

    @IBOutlet weak var uiLabel: UILabel!
    @IBOutlet weak var natnesLabel: NantesLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
      
        
        let string = """
Fix #1 - Not respecting lineSpacing when set

There was an issue where if you set some custom attributes before
setting attributedText on the label, it wouldn't keep those properties
in the attributedString. Now when you set lineSpacing, and then set
attributedText on the label, it'll pull the properties already setup and
append them to the attributedString you're putting in.
"""
        let attributedString = NSAttributedString(string: string, attributes: textAttributes())

        uiLabel.attributedText = attributedString
        
        
        natnesLabel.font = UIFont.systemFont(ofSize: 14)
        natnesLabel.lineSpacing = 5
        natnesLabel.textColor = UIColor.white
        
        /// It seem that attributedString will lost attributes
        /// if you annotation top 3 line code
        natnesLabel.attributedText = attributedString
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let string = uiLabel.text ?? ""
        let caculate_height =  string.boundingRect(with: CGSize(width: 150,
                                                                height: CGFloat(MAXFLOAT)),
                                                   options: [.usesLineFragmentOrigin, .usesFontLeading],
                                                   attributes: textAttributes(),
                                                   context: nil).height
        
        debugPrint("uiLabel autolayout height --- \(uiLabel.frame.size.height)")
        debugPrint("natnesLabel autolayout height --- \(natnesLabel.frame.size.height)")
        debugPrint("caculate height --- \(ceil(caculate_height))")
        
        /// I want to caculate the caculate label's height by "boundingRect"
        /// The log will show the different height between NatnesLabel and UILabel
        /// also you can change different string to look at this change
        
        
    }

    fileprivate  func textAttributes() -> [NSAttributedString.Key : Any] {
        let paraph = NSMutableParagraphStyle()
        paraph.alignment = .natural
        paraph.lineSpacing = 5
        paraph.lineBreakMode = .byWordWrapping
        
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14),
                          NSAttributedString.Key.paragraphStyle: paraph,
                          NSAttributedString.Key.foregroundColor: UIColor.white]
        return attributes
    }
    
    
}

