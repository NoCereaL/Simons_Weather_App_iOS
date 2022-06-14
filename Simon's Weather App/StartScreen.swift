//
//  StartScreen.swift
//  Simon's Weather App
//
//  Created by Simon K Moyana on 13/06/2022.
//

import SwiftUI
import CoreLocationUI

struct StartScreen: View {
    @EnvironmentObject var locationManager: LocationHandler
    var body: some View {
        VStack{
            VStack{
                Text("Simon's Weather App")
                    .padding(.all, 20.0).font(.title.bold())
                
                Text("You will need to enable Locations")
            }.multilineTextAlignment(.center).padding(.all, 30.0)
            
            Spacer()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }.cornerRadius(20).foregroundColor(Color.white)
            
            Spacer()
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct StartScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartScreen()
    }
}
