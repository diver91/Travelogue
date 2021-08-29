//
//  TripViewModel.swift
//  TripViewModel
//
//  Created by Patrick Goudeau on 8/22/21.
//

import Foundation
import CoreData

class TripListViewModel: ObservableObject {
    @Published var trips = [TripViewModel]()
    
    func getAllTrips() {
        let trips = CoreDataManager.shared.getAllTrips()
        DispatchQueue.main.async {
            self.trips = trips.map(TripViewModel.init)
        }
    }
    
    func deleteTrip(trip: TripViewModel) {
        let trip = CoreDataManager.shared.getTripById(id: trip.id)
        if let trip = trip {
            CoreDataManager.shared.deleteTrip(trip)
        }
    }
    
    func deleteAllData() {
        
            CoreDataManager.shared.removeAllData()
    }
    
    func updateTrip() {
        CoreDataManager.shared.updateTrip()
    }
    
    
}

struct TripViewModel {
    let trip: Trip
    
    var tripName: String {
        return trip.tripName ?? ""
    }
    
    var beginningDate: Date? {
        return trip.beginningDate
    }
    
    var endingDate: Date? {
        return trip.endingDate
    }
    
    var selectedColor: String {
        return trip.selectedColor ?? ""
    }
    
    // Vehicle ID
    var id: NSManagedObjectID {
        return trip.objectID
    }
    
    var delta: (Int, String) {
        let calendar = Calendar.current
        let dateComponent = calendar.dateComponents([.year, .month,.day,.hour,.minute], from: Date(), to: beginningDate ?? Date())
        let deltaYear = dateComponent.year!
        let deltaMonth = dateComponent.month!
        let deltaDay = dateComponent.day!
        let deltaHour = dateComponent.hour!
        let deltaMinute = dateComponent.minute!
        
        if deltaYear > 0{
            return (deltaYear, "Years")
        }
        
        if deltaMonth > 0 {
            return (deltaMonth, "Months")
        }
        
        if deltaDay > 0 {
            return (deltaDay, "Days")
        }
        
        if deltaHour > 0 {
            return (deltaHour, "Hours")
        }
        
        return (deltaMinute, "Minutes")
    }
    
    
    
}
