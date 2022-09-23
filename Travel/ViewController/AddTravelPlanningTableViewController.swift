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
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 9
    }
    
    // MARK: - keyboard, return hides keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return false
    }
    
}
