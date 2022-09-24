//
//  TravelDetailsTVC.swift
//  Travel
//
//  Created by Jessica Ernst on 16.09.22.
//

import UIKit

class TravelDetailsTVC: UITableViewController {
    
    var plannedTravel: TravelPlanning!
    var travelPlanningIndex: Int!
    
    weak var delegate: TravelPlansDelegate?
    
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
        
        titleTF.text = plannedTravel.title
        countryTF.text = plannedTravel.country
        cityTF.text = plannedTravel.city
        startTripTF.text = plannedTravel.startDate
        endTripTF.text = plannedTravel.endDate
        travelTypeTF.text = plannedTravel.travelType
        notesTV.text = plannedTravel.travelNotes
        
//        self.navigationItem.rightBarButtonItem = self.editButtonItem
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
