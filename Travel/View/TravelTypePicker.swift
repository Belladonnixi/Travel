//
//  TravelTypePicker.swift
//  Travel
//
//  Created by Jessica Ernst on 29.09.22.
//

import UIKit

protocol TravelTypeViewProtocol {
    func travelTypePickerDidSelectRow(selectedRowValue:Int?)
}

class TravelTypePicker: UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate {
    var propertyThatReferencesThisViewController: TravelTypeViewProtocol?
    let travelTypeArray = ["Private", "Business"]

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return travelTypeArray.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
        return travelTypeArray[row]
    }
    

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
            propertyThatReferencesThisViewController?.travelTypePickerDidSelectRow(selectedRowValue: row)
        }
}
