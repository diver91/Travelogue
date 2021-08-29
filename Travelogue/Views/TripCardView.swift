//
//  TripCardView.swift
//  TripCardView
//
//  Created by Patrick Goudeau on 8/22/21.
//

import SwiftUI

struct TripCardView: View {
    let trip: TripViewModel
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill()
                .frame(width: .infinity, height: 100)
                //.foregroundColor(.blue)
                .foregroundColor(tripColor(color: trip.selectedColor))
                .cornerRadius(10)
            HStack {
                VStack(alignment: .leading) {
                    Text(trip.tripName)
                        .font(.title)
                        .bold()
                        .lineLimit(1)
                   
                        Text("\(trip.beginningDate?.asFormattedString() ?? "") - \(trip.endingDate?.asFormattedString() ?? "")")
                        .font(.callout)
                         
                }
                Spacer()
                ZStack {
                    Circle()
                        .fill()
                        .frame(width: 80, height: 80)
                        .foregroundColor(Color.black.opacity(0.5))
                    VStack(){
                        Text("14")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                        Text(trip.delta.1)
                            .font(.subheadline)
                            .foregroundColor(.white)
                        
                    }.multilineTextAlignment(.center)
                    
                    
                }
                
            }.padding(.horizontal)
            
            
        }
    }
}

//struct TripCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        TripCardView()
//    }
//}



