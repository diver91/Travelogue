//
//  AddTripScreen.swift
//  AddTripScreen
//
//  Created by Patrick Goudeau on 8/21/21.
//

import SwiftUI

struct AddTripScreen: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var tripVM = TripEntryViewModel()
    
    
    @State private var people: String = ""
    @State private var selectedColor: String = TripColor.blue.rawValue
    
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Trip information")){
                    TextField("Trip Name", text: $tripVM.tripName)
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
                }
                
                    
                
            }
            .navigationBarTitle("Add Trip", displayMode: .inline)
            .navigationBarItems(leading: Button(action: { dismiss() }){
                Text("Cancel")
                
            },
            trailing: Button(action: {
                tripVM.selectedColor = selectedColor
                tripVM.save()
                dismiss() }){
                Text("Add")
            }
            
            )
        }
         
        
    }

}

struct AddTripScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddTripScreen()
    }
}


