//
//  OverviewTravelPlanningTVC.swift
//  Travel
//
//  Created by Jessica Ernst on 16.09.22.
//

import UIKit

//protocol TravelPlansDelegate: AnyObject {
//    func update(
//}

class OverviewTravelPlanningTVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(addNewTravelPlanning(_ :)), name: NSNotification.Name.init("de.Travel.addTravelPlanning"), object: nil)
        
        settingBackground()
        configureItems()
    }
    
    private func configureItems() {
        navigationItem.leftBarButtonItem =
        editButtonItem
        
        navigationItem.rightBarButtonItem =
        UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTravelPlanning))
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
    
    @objc func addNewTravelPlanning(_ notification: NSNotification) {
        
    }
    
    @objc func addTravelPlanning() {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let addTravelVC = storyboard.instantiateViewController(withIdentifier: "AddTravelPlanning") as! AddTravelPlanningTableViewController
        self.navigationController?.pushViewController(addTravelVC, animated: true)
    }
    
    // MARK: - Table view data source
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 0
    //    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plannedTravels.count
    }
    
//    //MARK: prepare for segue
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ShowDetailsSegue" {
//            
//            guard let destinationVC = segue.destination as? TravelDetailsTVC else { return }
//            //guard let contact = sender as? ContactModel else { return }
//            guard let travelPlanningTuple = sender as? (Int, Contact) else { return }
//            //destinationVC.contact = contact
//            
//            destinationVC.contactIndex = contactTuple.0
//            destinationVC.contact = contactTuple.1
//            
//            destinationVC.delegate = self
//            
//        }
//    }
    
}
