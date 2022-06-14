//
//  ContentView.swift
//  Simon's Weather App
//
//  Created by Simon K Moyana on 13/06/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationHandler = LocationHandler()
    var weatherHandler = WeatherHandler()
    @State var  weather: ResponseHandler?
        
    var body: some View {
        VStack{
            
            if let location = locationHandler.location{
                if let weather = weather {
                    WeatherInfoScreen()
                }
                else {
                    LoadingScreen().task {
                        do{
                            weather = try await weatherHandler.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                        }catch{
                            print("Error getting Weather: \(error)")
                        }
                    }
                }
            }
            else {
                if locationHandler.isLoading {
                    LoadingScreen()
                } else{
                    StartScreen().environmentObject(locationHandler)
                }
            }
            
        }.background(Color(hue: 0.519, saturation: 0.992, brightness: 0.204)).preferredColorScheme(.dark)
        
    }
}

struct TabbedView: View{
    var body: some View{
        TabView(){
            TabWindowOne()
            TabWindowTwo()
            ContentView()
        }.frame(maxHeight: .infinity).tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always)).background(Color(hue: 0.519, saturation: 0.992, brightness: 0.204)).preferredColorScheme(.dark)
    }
}

struct TabWindowOne: View{
    var body: some View{
        VStack{
            Text("Welcome to Simon's Weather App").font(.system(size: 20).bold()).padding(20.0)
            Text("Please Swipe to Continue ->").padding()
        }
    }
}

struct TabWindowTwo: View{
    var body: some View{
        VStack{
            Text("This Application is intended for test purposes & examination only ").font(.system(size: 20).bold()).multilineTextAlignment(.center).padding(20.0)
            
            Text("Proceed by Swiping ->").font(.system(size: 20).bold()).padding(20.0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        TabbedView()
        TabWindowTwo()
    }
}
