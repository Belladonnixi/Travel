//
//  TravelDetailsTVC.swift
//  Travel
//
//  Created by Jessica Ernst on 16.09.22.
//

import UIKit

class TravelDetailsTVC: UITableViewController, UITextFieldDelegate, UITextViewDelegate {
    
    var plannedTravel: TravelPlanning!
    var travelPlanningIndex: Int!
    
    weak var delegate: TravelPlansDelegate?
    
    let datePicker: UIDatePicker = UIDatePicker()
    
    let travelType_array = ["Private", "Business"]
    let travelType_picker = UIPickerView()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var countryTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var startTripTF: UITextField!
    @IBOutlet weak var endTripTF: UITextField!
    @IBOutlet weak var travelTypeTF: UITextField!
    @IBOutlet weak var notesTV: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notesTV.layer.cornerRadius = 5
        notesTV.layer.borderWidth = 1
        notesTV.layer.borderColor = UIColor.lightGray.cgColor
        
        settingBackground()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editButtonTapped))
        
        titleTF.delegate = self
        countryTF.delegate = self
        cityTF.delegate = self
        startTripTF.delegate = self
        endTripTF.delegate = self
        travelTypeTF.delegate = self
        notesTV.delegate = self
        notesTV.inputAccessoryView = createToolbar()
        
        titleTF.text = plannedTravel.title
        countryTF.text = plannedTravel.country
        cityTF.text = plannedTravel.city
        startTripTF.text = plannedTravel.startDate
        endTripTF.text = plannedTravel.endDate
        travelTypeTF.text = plannedTravel.travelType
        notesTV.text = plannedTravel.travelNotes
        
        travelType_picker.dataSource = self
        travelType_picker.delegate = self
        pick_travelType()
        
    }
    
    private func settingBackground() {
        
        // Add a background view to the table view
        let backgroundImage = UIImage(named: "dariusz-sankowski-3OiYMgDKJ6k-unsplash")
        let imageView = UIImageView(image: backgroundImage)
        imageView.contentMode = .scaleAspectFill
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = imageView.bounds
        imageView.addSubview(blurView)
        self.tableView.backgroundView = imageView
    }
    
    //MARK: Edit-Button Tapped
    @objc func editButtonTapped(_ sender: UIBarButtonItem) {
        
    }
    
    //MARK: Toolbar, DatePicker und Keyboard
    
    func createToolbar() -> UIToolbar {
        // Toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // Done Button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        return toolbar
    }
    
    func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        startTripTF.inputView = datePicker
        startTripTF.inputAccessoryView = createToolbar()
        endTripTF.inputView = datePicker
        endTripTF.inputAccessoryView = createToolbar()
    }
    
    //MARK: - pick_travelType
    func pick_travelType(){
        travelTypeTF.inputAccessoryView = createToolbar()
        travelTypeTF.inputView = travelType_picker
    }
    
    @objc func donePressed() {
        
        if notesTV.isFocused {
            notesTV.endEditing(true)
        } else {
            if startTripTF.isEditing {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MMM dd. yyyy"
                self.startTripTF.text = dateFormatter.string(from: datePicker.date)
            } else {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MMM dd. yyyy"
                self.endTripTF.text = dateFormatter.string(from: datePicker.date)
            }
            self.view.endEditing(true)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return false
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 9
    }
    
}

// MARK: - PickerView Extensions
extension TravelDetailsTVC: UIPickerViewDataSource, UIPickerViewDelegate{
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
