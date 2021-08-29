//
//  SettingsScreen.swift
//  SettingsScreen
//
//  Created by Patrick Goudeau on 8/29/21.
//

import Foundation
import SwiftUI

struct SettingsTripScreen: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var tripVM = TripListViewModel()
    
    
    @State private var people: String = ""
    @State private var selectedColor: String = TripColor.blue.rawValue
    
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Do you want to delete all data?")){
                    Button {
                        tripVM.deleteAllData()
                    } label: {
                        Label {
                            Text("Delete all data")
                        } icon: {
                            Image(systemName: "trash")
                        }

                    }

                }
                
                
                
                
                    
                
            }
            .navigationBarTitle("Settings", displayMode: .inline)
            .navigationBarItems(leading:
                                    Button(action: {
                                            dismiss()
                                        }, label: {
                                            Text("Cancel")
                                    })
                                , trailing:
                                    Button(action: {
                                            dismiss()
                                        }, label: {
                                            Text("Done")
                                    })
            )
            
            
            
        }
         
        
    }

}

struct SettingsTripScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTripScreen()
    }
}
