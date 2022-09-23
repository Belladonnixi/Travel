//
//  TravelPlanningTableViewController.swift
//  Travel
//
//  Created by Jessica Ernst on 09.09.22.
//

import UIKit

class AddTravelPlanningTableViewController: UITableViewController, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var countryTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var startTripTF: UITextField!
    @IBOutlet weak var endTripTF: UITextField!
    @IBOutlet weak var travelTypeTF: UITextField!
    @IBOutlet weak var notesTV: UITextView!
    
    let datePicker: UIDatePicker = UIDatePicker()
    
    var travelPlanning: TravelPlanning!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingBackground()
        
        titleTF.delegate = self
        countryTF.delegate = self
        cityTF.delegate = self
        startTripTF.delegate = self
        endTripTF.delegate = self
        travelTypeTF.delegate = self
        notesTV.delegate = self
        notesTV.inputAccessoryView = createToolbar()
        
        createDatePicker()
        
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
    
    @IBAction func savingTrip(_ sender: Any) {
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
    
    @objc func donePressed() {
        
        if notesTV.isFocused {
            notesTV.endEditing(true)
        } else {
            if startTripTF.isFocused {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy MMM dd."
                self.startTripTF.text = dateFormatter.string(from: datePicker.date)
            } else {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy MMM dd."
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
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 9
    }
    
}
