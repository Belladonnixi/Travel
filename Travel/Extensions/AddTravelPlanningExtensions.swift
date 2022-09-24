//
//  OverviewTravelPlanningExtensions.swift
//  Travel
//
//  Created by Jessica Ernst on 23.09.22.
//

import Foundation
import UIKit

// MARK: - PickerView Extensions
extension AddTravelPlanningTableViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == travelType_picker {
            return travelType_array.count
        }
        return 0
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == travelType_picker {
            return travelType_array[row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == travelType_picker {
            travelTypeTF.text = travelType_array[row]
        }
        print("An Error occured")
    }
}
