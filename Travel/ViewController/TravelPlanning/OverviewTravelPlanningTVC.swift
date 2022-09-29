//
//  OverviewTravelPlanningTVC.swift
//  Travel
//
//  Created by Jessica Ernst on 16.09.22.
//

import UIKit

protocol TravelPlansDelegate: AnyObject {
    func update(plannedTravel: TravelPlanning, index: Int)
}

class OverviewTravelPlanningTVC: UITableViewController {
    
    var plannedTravels: [TravelPlanning]?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(addNewTravelPlanning(_ :)), name: NSNotification.Name.init("de.Travel.addTravelPlanning"), object: nil)
        
        settingBackground()
        configureItems()
        fetchTravels()
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
    
    func fetchTravels() {
        // Fetching Data
        do {
            self.plannedTravels = try context.fetch(TravelPlanning.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            print("Error by trying fetch request")
        }
    }
    
    @objc func addNewTravelPlanning(_ notification: NSNotification) {
        self.fetchTravels()
    }
    
    @objc func addTravelPlanning() {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let addTravelVC = storyboard.instantiateViewController(withIdentifier: "AddTravelPlanning") as! AddTravelPlanningTableViewController
        self.navigationController?.pushViewController(addTravelVC, animated: true)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlannedTravel", for: indexPath)
        let travel = self.plannedTravels![indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = travel.title
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.plannedTravels?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            // Zu löschenden Kontakt bestimmen
            let travelToDelete = self.plannedTravels![indexPath.row]
            
            // Kontakt löschen
            self.context.delete(travelToDelete)
            
            // Context speichern
            do {
                try self.context.save()
            } catch {
                print("Saving context failed")
            }
            
            // Re-fetch Data / Reload
            self.fetchTravels()
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    //MARK: - prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TravelDetailsSegue" {
            
            guard let destinationVC = segue.destination as? TravelDetailsTVC else { return }
            
            guard let travelPlanningTuple = sender as? (Int, TravelPlanning) else { return }
            
            destinationVC.travelPlanningIndex = travelPlanningTuple.0
            destinationVC.plannedTravel = travelPlanningTuple.1
            
            destinationVC.delegate = self
            
        }
    }
    
    // MARK: - Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedTravel = plannedTravels![indexPath.row]
        
        let travelPlanningTuple = (indexPath.row, selectedTravel)
        
        performSegue(withIdentifier: "TravelDetailsSegue", sender: travelPlanningTuple)
    }
    
}

// MARK: - Extension TravelPlansDelegate
extension OverviewTravelPlanningTVC: TravelPlansDelegate {
    func update(plannedTravel: TravelPlanning, index: Int) {
        
        plannedTravels![index] = plannedTravel
        tableView.reloadData()
    }
    
    
}
