//
//  ContentView.swift
//  Travelogue
//
//  Created by Patrick Goudeau on 8/21/21.
//

import SwiftUI

struct ContentView: View {
    @State var showingAddTripScreen: Bool = false
    @State var showingEditTripScreen: Bool = false
    @State var showingSettingsScreen: Bool = false
    
    @StateObject private var tripVM = TripListViewModel()
         
    @State var editingTrip: Trip?
  
    var body: some View {
        
        NavigationView {
                        
            VStack {
                List {
                    ForEach(tripVM.trips, id: \.id) { trip in
                            TripCardView(trip: trip)
                                .listRowSeparator(.hidden)
                                //.padding(.horizontal)
                                
                                .swipeActions(allowsFullSwipe: false) {
                                    // Edit Trip
                                    Button {
                                        editingTrip = trip.trip
                                        showingEditTripScreen = true
                                    } label: {
                                        
                                        Label("Edit", systemImage: "pencil.circle.fill")
                                        
                                    }
                                    
                                    .tint(.green)
                                    
                                    // Delete Trip
                                    Button {
                                        tripVM.deleteTrip(trip: trip)
                                        tripVM.getAllTrips()
                                        
                                    } label: {
                                        Label("Delete", systemImage: "trash.circle.fill")
                                        
                                    }
                                    .tint(.red)
                                }
                       // Text(trip.tripName)
                       // Text(editingTrip?.tripName ?? "NO")
                        }
                    

                    
                    
                    .sheet(isPresented: $editingTrip, content: { editingTrip
                        EditTripScreen(trip: editingTrip)
                    })
                    
                }.listStyle(PlainListStyle())
            }.navigationBarTitle("Travelogue", displayMode: .large)
                .toolbar(content: {
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingSettingsScreen = true
                            
                        } label: {
                            Image(systemName: "gear")
                                .foregroundColor(.black)
                            
                        }
                    }
                    
                    
                    ToolbarItem(placement: .bottomBar) {
                        Button {
                            showingAddTripScreen = true
                        } label: {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 45, height: 45)
                                .padding(10)
                                .foregroundColor(.white)
                                .background(.black)
                                .clipShape(Circle())
                        }
                        
                        // Show AddTripScreen
                        .sheet(isPresented: $showingAddTripScreen, onDismiss: {
                            tripVM.getAllTrips()
                        }, content: {
                            AddTripScreen()
                        })
                        
//                        // Show EditTripScreen
//                        .sheet(isPresented: $showingEditTripScreen, onDismiss: {
//                            tripVM.updateTrip()
//                            tripVM.getAllTrips()
//                        }, content: {
//                          //  Text(editingTrip?.tripName ?? "NO")
//                            EditTripScreen(trip: editingTrip)
//                        })
                        
                        // Show SettingsTripScreen
                        .sheet(isPresented: $showingSettingsScreen) {
                            tripVM.getAllTrips()
                        } content: {
                            SettingsTripScreen()
                        }

                    }
                })
        }
        
        .onAppear {
            tripVM.getAllTrips()
        }
        
        
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView( )
    }
}

