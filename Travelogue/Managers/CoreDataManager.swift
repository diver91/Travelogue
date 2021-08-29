//
//  CoreDataManager.swift
//  CoreDataManager
//
//  Created by Patrick Goudeau on 8/22/21.
//

import CoreData

class CoreDataManager {
    let persistentContainer: NSPersistentContainer
    
    static let shared = CoreDataManager()
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "Travelogue")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Failed to initialize Core Data \(error)")
            }
        }
    }
   
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    

    
//    //MARK: - Get the selected vehicle id to pass to the FuelListViewModel
//        func getSelectedVehicleIdByName(name: String) -> NSManagedObjectID {
//            let selected = CoreDataManager.shared.getAllVehicles()
//            var vehicleID = NSManagedObjectID()
//
//            for items in selected {
//                if items.vehicleName == name {
//                     vehicleID = items.objectID
//
//                } else {
//                    print("Failed")
//                }
//
//            }
//
//            return vehicleID
//        }
    
//    func getVehicleByName(id: String) -> Vehicle? {
//        do {
//            return try persistentContainer.viewContext
//           // return try persistentContainer.viewContext.existingObject(with: id) as? Vehicle
//        } catch {
//            print(error)
//            return nil
//        }
//    }
    

    
    // Get all trips stores in Core Data
    func getAllTrips() -> [Trip] {
        let fetchRequest: NSFetchRequest<Trip> = Trip.fetchRequest()

        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }

    }
    
    func getTripById(id: NSManagedObjectID) -> Trip? {
        do {
            
            return try persistentContainer.viewContext.existingObject(with: id) as? Trip
        } catch  {
            print(error)
            return nil
        }
    }
    
    func deleteTrip(_ trip: Trip) {
        persistentContainer.viewContext.delete(trip)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to delete vehicle \(error)")
        }
    }

    
    func updateTrip() {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
        }
    }
    
    
    func save() {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            // if something bad happens, rollback
            persistentContainer.viewContext.rollback()
            print("Failed to save a vehicle \(error)")
        }
    }
    
    // Delete all core data for entity "Trip"
    func removeAllData() {
        let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Trip")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        
        do {
            try viewContext.execute(deleteRequest)
        } catch {
            print(error)
        }
    }
    
}

