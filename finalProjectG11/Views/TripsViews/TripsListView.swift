//
//  TripsListView.swift
//  finalProjectG11
//
//  Created by Om Chevli on 2023-03-26.
//

import SwiftUI

struct TripsListView: View {
    @State private var tripDetailSelection: Int? = nil
    @State private var tripsList:[Trip] = []
    @State private var selectedTrip:Trip = Trip()
    var body: some View {
        NavigationLink(destination: TripDetailView(trip: selectedTrip), tag: 1, selection: self.$tripDetailSelection ){}.hidden()
        NavigationView{
            VStack{
                List{
                    ForEach(self.$tripsList) { trip in
                        TripItemView(trip: trip.wrappedValue,
                                     onTap: {
                            navigateToDetail(trip: trip.wrappedValue)
                        })
                    }
                    
                }
                .padding(.vertical, -16)
                .padding(.horizontal,-10)
                Spacer()
            }
            .onAppear(perform: {
                
                let carForTrip:Car = Car(id: UUID().uuidString, modelName: "Model X", companyName: "Tesla", yearOfManufacture: 2019, totalSeats: 6, maxLuggage: 3)
                
                let user:RideShareUser = RideShareUser(userName: "Om C.", profilePhotoUrl: "ProfilePhoto", email: "omchevli@gmail.com", car: [carForTrip])
                
                self.tripsList = [
                    Trip(id: UUID().uuidString, user: user, origin: "Toronto, ON", availableSeats: 3, destination:"Drampton", distance:4.3, fare: 29.2, travelTime: 2.4, availableLuggae: 2, selectedCarIndex: 0),
                    Trip(id: UUID().uuidString, user: user, origin: "Toronto, ON", availableSeats: 3, destination:"Drampton", distance:4.3, fare: 29.2, travelTime: 2.4, availableLuggae: 2, selectedCarIndex: 0),
                    Trip(id: UUID().uuidString, user: user, origin: "Toronto, ON", availableSeats: 3, destination:"Drampton", distance:4.3, fare: 29.2, travelTime: 2.4, availableLuggae: 2, selectedCarIndex: 0),
                    Trip(id: UUID().uuidString, user: user, origin: "Toronto, ON", availableSeats: 3, destination:"Drampton", distance:4.3, fare: 29.2, travelTime: 2.4, availableLuggae: 2, selectedCarIndex: 0),

                    
                ]
            })
        }
        .navigationTitle("Trips")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func navigateToDetail(trip: Trip) {
        selectedTrip = trip
        self.tripDetailSelection = 1
    }
}

struct TripsListView_Previews: PreviewProvider {
    static var previews: some View {
        TripsListView()
    }
}
