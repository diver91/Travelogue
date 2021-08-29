//
//  EditTripScreen.swift
//  EditTripScreen
//
//  Created by Patrick Goudeau on 8/26/21.
//

import Foundation
import SwiftUI

struct EditTripScreen: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var tripVM = TripEntryViewModel()
    
    
    @State private var people: String = ""
    @State private var selectedColor: String = ""
    
   // let trip: TripViewModel
    let trip: Trip?
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Trip information")){
                    TextField(trip?.tripName ?? "ENTER" , text: $tripVM.tripName)
                    DatePicker("Start Date", selection: $tripVM.beginningDate, displayedComponents: .date)
                    DatePicker("End Date", selection: $tripVM.endingDate,  displayedComponents: .date)
                }
                
                
                Section(header: Text("Visual information")){
                    Picker("Color", selection: $selectedColor){
                        ForEach(TripColor.rawValueList(), id: \.self){color in
                            HStack{
                                Rectangle()
                                    .frame(width: 10, height: 10)
                                    .foregroundColor(TripColor(rawValue: color)?.color)
                                Text(color.capitalized)
                            }
                            
                        }
                    }
                }
                
                    
                
                Section(header: Text("People Traveling")) {
                    Picker("People", selection: $people){
                        ForEach(Persons.allCases, id: \.id){person in
                            HStack{
                                      
                                Text(person.rawValue.capitalized)
                                    
                            }
                            
                        }
                    }
                    
                    Text(tripVM.beginningDate.asFormattedString())
                }
                
                    
                
            }
            .onAppear {
                tripVM.tripName = trip?.tripName ?? ""
                self.tripVM.beginningDate = self.trip?.beginningDate ?? Date()
                tripVM.endingDate = trip?.endingDate ?? Date()
                self.tripVM.selectedColor = self.trip?.selectedColor ?? TripColor.blue.rawValue
                selectedColor = self.trip?.selectedColor ?? TripColor.blue.rawValue
            }
            .navigationBarTitle("Edit Trip", displayMode: .inline)
            .navigationBarItems(leading: Button(action: { dismiss() }){
                Text("Cancel")
                
            },
            trailing: Button(action: {
               // tripVM.selectedColor = selectedColor
               // tripVM.save()
                dismiss() }){
                Text("Save")
            }
            
            )
        }
         
        
    }

}

//struct EditTripScreen_Previews: PreviewProvider {
//    static var previews: some View {
//       
//        EditTripScreen( )
//    }
//}
