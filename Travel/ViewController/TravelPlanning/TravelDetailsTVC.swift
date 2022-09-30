//
//  TravelDetailsTVC.swift
//  Travel
//
//  Created by Jessica Ernst on 16.09.22.
//

import UIKit

class TravelDetailsTVC: UITableViewController, UITextFieldDelegate, UITextViewDelegate, TravelTypeViewProtocol {

    var plannedTravel: TravelPlanning!
    var travelPlanningIndex: Int!
    
    weak var delegate: TravelPlansDelegate?
    
    let datePicker: UIDatePicker = UIDatePicker()
    
    var travelTypePickerData: TravelTypePicker!
    let travelTypePickerView = UIPickerView()
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var countryTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var startTripTF: UITextField!
    @IBOutlet weak var endTripTF: UITextField!
    @IBOutlet weak var travelTypeTF: UITextField!
    @IBOutlet weak var notesTV: UITextView!
    @IBOutlet weak var saveBtn: UIButton!
    
    // MARK: - viewDidload
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notesTV.layer.cornerRadius = 5
        notesTV.layer.borderWidth = 1
        notesTV.layer.borderColor = UIColor.lightGray.cgColor
        
        settingBackground()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editButtonTapped(_ :)))
        
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
        
        travelTypePickerData = TravelTypePicker()
        travelTypePickerView.dataSource = travelTypePickerData
        travelTypePickerView.delegate = travelTypePickerData
        travelTypePickerData.propertyThatReferencesThisViewController = self
        
        pick_travelType()
        
        createDatePicker()
        
    }
    
    // MARK: - Action
    @IBAction func savingChanges(_ sender: Any) {
        plannedTravel.title = titleTF.text
        plannedTravel.country = countryTF.text
        plannedTravel.city = cityTF.text
        plannedTravel.startDate = startTripTF.text
        plannedTravel.endDate = endTripTF.text
        plannedTravel.travelType = travelTypeTF.text
        plannedTravel.travelNotes = notesTV.text
        
        delegate?.update(plannedTravel: plannedTravel, index: travelPlanningIndex)
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editButtonTapped(_:)))
        
        titleTF.text = plannedTravel.title
        countryTF.text = plannedTravel.country
        cityTF.text = plannedTravel.city
        startTripTF.text = plannedTravel.startDate
        endTripTF.text = plannedTravel.endDate
        travelTypeTF.text = plannedTravel.travelType
        notesTV.text = plannedTravel.travelNotes
        
        titleTF.isEnabled = false
        countryTF.isEnabled = false
        cityTF.isEnabled = false
        startTripTF.isEnabled = false
        endTripTF.isEnabled = false
        travelTypeTF.isEnabled = false
        notesTV.isEditable = false
        saveBtn.isHidden = true
        
        do {
            try self.context.save()
        } catch {
            print("Error")
        }
    }
    
    // background settings
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
        if titleTF.isEnabled == false {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(editButtonTapped(_:)))
            
            titleTF.isEnabled = true
            countryTF.isEnabled = true
            cityTF.isEnabled = true
            startTripTF.isEnabled = true
            endTripTF.isEnabled = true
            travelTypeTF.isEnabled = true
            notesTV.isEditable = true
            saveBtn.isHidden = false
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editButtonTapped(_:)))
            
            titleTF.isEnabled = false
            countryTF.isEnabled = false
            cityTF.isEnabled = false
            startTripTF.isEnabled = false
            endTripTF.isEnabled = false
            travelTypeTF.isEnabled = false
            notesTV.isEditable = false
            saveBtn.isHidden = true
        }
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return false
    }
    
    //MARK: - pick_travelType
    func pick_travelType(){
        travelTypeTF.inputAccessoryView = createToolbar()
        travelTypeTF.inputView = travelTypePickerView
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
    
    func travelTypePickerDidSelectRow(selectedRowValue: Int?) {
        travelTypeTF.text = travelTypePickerData!.travelTypeArray[selectedRowValue!]
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
