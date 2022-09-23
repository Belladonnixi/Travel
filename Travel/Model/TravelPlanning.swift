//
//  TravelPlanning.swift
//  Travel
//
//  Created by Jessica Ernst on 16.09.22.
//

import Foundation

struct TravelPlanning: Codable {
    var title: String
    var country: String
    var city: String
    var startDate: Date
    var endDate: Date
    var travelType: String
    var travelNotes: String
}

var plannedTravels: [TravelPlanning] = []
