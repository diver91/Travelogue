//
//  TestView.swift
//  TestView
//
//  Created by Patrick Goudeau on 8/24/21.
//

import SwiftUI

struct TestView: View {
    @State var showingAddTripScreen: Bool = false
    @StateObject private var tripVM = TripListViewModel()
    
    var body: some View {
        NavigationView {
            
            
            VStack {
                List {
                    ForEach(tripVM.trips, id: \.id) { trip in
                        TripCardView(trip: trip)
                            .listRowSeparator(.hidden)
                            //.padding(.horizontal)
                        
                            .swipeActions(allowsFullSwipe: false) {
                                        Button {
                                            showingAddTripScreen = true
                                        } label: {
                                            
                                            Label("Edit", systemImage: "pencil")
                                        }
                                        .tint(.green)
                             
                                        Button {
                                            
                                        } label: {
                                            Label("Delete", systemImage: "trash")
                                        }
                                        .tint(.red)
                                    }


                    }
                }.listStyle(PlainListStyle())
            }.navigationBarTitle("Travelogue", displayMode: .large)
                .toolbar(content: {
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingAddTripScreen = true
                        } label: {
                            Image(systemName: "gear")
                                .resizable()
                               // .frame(width: 45, height: 45)
                               // .padding(10)
                                .foregroundColor(.black)
                               // .background(.black)
                                //.clipShape(Circle())
                        }
                        
                        //.padding(.bottom)
                        .sheet(isPresented: $showingAddTripScreen, onDismiss: {
                            tripVM.getAllTrips()
                        }, content: {
                            AddTripScreen()
                        })

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
                        
                        //.padding(.bottom)
                        .sheet(isPresented: $showingAddTripScreen, onDismiss: {
                            tripVM.getAllTrips()
                        }, content: {
                            AddTripScreen()
                        })

                    }
                })
        }
        
        .onAppear {
            tripVM.getAllTrips()
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
