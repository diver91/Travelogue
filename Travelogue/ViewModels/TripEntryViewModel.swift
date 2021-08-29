//
//  TripEntryViewModel.swift
//  TripEntryViewModel
//
//  Created by Patrick Goudeau on 8/22/21.
//

import Foundation

class TripEntryViewModel: ObservableObject {
    var tripName: String = ""
    var beginningDate: Date = Date()
    var endingDate: Date = Date()
    var selectedColor: String = ""
    
    

    
    func  save() {
        let manager = CoreDataManager.shared
        let trip = Trip(context: manager.persistentContainer.viewContext)
        
        trip.tripName = tripName
        trip.beginningDate = beginningDate
        trip.endingDate = endingDate
        trip.selectedColor = selectedColor
        

        manager.save()
    }
}
