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
                
                Text("You will need to enable Locations").fontWeight(.semibold).padding()
                
                Text("This Application does not store or use your location for tracking purposes. \n\n Location is used strictly for weather forecasting!")
                    .fontWeight(.semibold)
            }.multilineTextAlignment(.center).padding(.all, 30.0)
            
            Spacer()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }.cornerRadius(20).foregroundColor(Color.white)
            
            Spacer()
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContinuePage: View{
    var body: some View{
        
        VStack{
            VStack{
                Text("Enjoy the demo!").font(.title.bold())
            }.multilineTextAlignment(.center).padding(.all, 30.0)
            
            Spacer()
            
            NavigationLink(destination: StartScreen(), label: {Text("Enter Application").fontWeight(.bold).padding(/*@START_MENU_TOKEN@*/.all, 20.0/*@END_MENU_TOKEN@*/).frame(width: 225.0, height: 50.0).background(Color.blue).foregroundColor(Color.white).cornerRadius(250)})
            
            Spacer()
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct EnableLocationPage: View{
    @EnvironmentObject var locationManager: LocationHandler
    var body: some View {
        VStack{
            VStack{
                Text("Simon's Weather App")
                    .padding(.all, 20.0).font(.title.bold())
                
                Text("We Require Location Services \n You will need to enable Locations")
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
        ContinuePage()
    }
}
