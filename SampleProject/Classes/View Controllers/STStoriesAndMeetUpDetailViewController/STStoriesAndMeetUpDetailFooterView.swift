//
//  STStoriesAndMeetUpDetailFooterView.swift
//  STREET
//
//  Created by Shuja on 11/11/2016.
//  Copyright © 2016 DevBatch. All rights reserved.
//

import UIKit
protocol textFieldDelegate {
    func textFieldDidBeginEditing()
}
class STStoriesAndMeetUpDetailFooterView: UITableViewHeaderFooterView , UITextFieldDelegate{

    @IBOutlet weak var txt_Comment: UITextField!
    @IBOutlet weak var btn_AddImages: UIButton!

    var delegate : textFieldDelegate?
    
    func textFieldDidBeginEditing(textField: UITextField) {
        self.delegate!.textFieldDidBeginEditing()
    }
}
