//
//  Pickers.swift
//  Abhay Shankar
//
//  Created by Abhay Shankar on 19/07/18.
//  Copyright © 2018 Abhay Shankar. All rights reserved.
//

import Foundation
import UIKit

struct Pickers {
    /// Create Date Picker and use as input view on textfield.
    ///
    /// - Parameters:
    ///   - controller: Controller object on which doneAction & cancelAction is called
    ///   - txtFld: Textfield on which date picker is shown
    ///   - doneAction: Selector called when Done button is selected.
    ///   - cancelAction: Selector called when Cancel button is selected.
    /// - Returns: DatePicker object for customization.
    static func getDatePicker(controller:Any?,txtFld:UITextField,doneAction:Selector,cancelAction:Selector) -> UIDatePicker {
        let datePicker = UIDatePicker.init()
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = UIColor.white
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: Int(UIScreen.main.bounds.width), height:40))
        toolbar.isTranslucent = false
        toolbar.barTintColor = UIColor.white
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: controller, action: doneAction)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: controller, action: cancelAction)
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        doneButton.tintColor = UIColor.black
        cancelButton.tintColor = UIColor.black
        toolbar.setItems([cancelButton,flexibleSpace,doneButton], animated: true)
        txtFld.inputView = datePicker
        txtFld.inputAccessoryView = toolbar
        return datePicker
    }
    
}
