//
//  WeatherInfoScreen.swift
//  Simon's Weather App
//
//  Created by Simon K Moyana on 13/06/2022.
//

import SwiftUI

struct WeatherInfoScreen: View {
    var weather: ResponseHandler

    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 10){
                    Text(weather.Headline.Text).font(.title.bold())
                    
                    Text("Today, \(Date().formatted())")
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                
                VStack(alignment: .leading, spacing: 20){
                    
                    HStack{
                        Text("Maximum Temperature:").fontWeight(.semibold).padding()
                        Text(weather.DailyForecasts[0].Temperature.Maximum.Value.roundedDouble() + "˚").font(.system(size: 35).bold())
                    }
                    
                    HStack{
                        Text("Minimum Temperature:").fontWeight(.semibold).padding()
                        Text(weather.DailyForecasts[0].Temperature.Minimum.Value.roundedDouble() + "˚").font(.system(size: 35).bold())
                    }
                    
                }.frame(maxWidth: .infinity)
                
                Text("Conditions").font(.title.bold()).padding()
                
                VStack(alignment: .leading, spacing: 20){
                    
                    HStack{
                        Text("Day: ").fontWeight(.semibold).padding(20.0)
                        Text(weather.DailyForecasts[0].Day.IconPhrase).font(.system(size: 25).bold()).padding()
                    }
                    
                    HStack{
                        Text("Night: ").fontWeight(.semibold).padding(20.0)
                        Text(weather.DailyForecasts[0].Night.IconPhrase).font(.system(size: 25).bold()).padding()
                    }
                    
                }.padding()
                
                Spacer()
                                
            }.padding().frame(maxWidth: .infinity, alignment: .leading)
            
        }.edgesIgnoringSafeArea(.bottom).background(Color(hue: 0.519, saturation: 0.992, brightness: 0.204)).preferredColorScheme(.dark)
    }
}

struct DayOneView: View{
    var weather: ResponseHandler

    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 10){
                    Text(weather.Headline.Text).font(.title.bold())
                    
                    Text("Today, \(Date().formatted())")
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                
                VStack(alignment: .leading, spacing: 20){
                    
                    HStack{
                        Text("Maximum Temperature:").fontWeight(.semibold).padding()
                        Text(weather.DailyForecasts[0].Temperature.Maximum.Value.roundedDouble() + "˚").font(.system(size: 35).bold())
                    }
                    
                    HStack{
                        Text("Minimum Temperature:").fontWeight(.semibold).padding()
                        Text(weather.DailyForecasts[0].Temperature.Minimum.Value.roundedDouble() + "˚").font(.system(size: 35).bold())
                    }
                    
                }.frame(maxWidth: .infinity)
                
                Text("Conditions").font(.title.bold()).padding()
                
                VStack(alignment: .leading, spacing: 20){
                    
                    HStack{
                        Text("Day: ").fontWeight(.semibold).padding(20.0)
                        Text(weather.DailyForecasts[0].Day.IconPhrase).font(.system(size: 25).bold()).padding()
                    }
                    
                    HStack{
                        Text("Night: ").fontWeight(.semibold).padding(20.0)
                        Text(weather.DailyForecasts[0].Night.IconPhrase).font(.system(size: 25).bold()).padding()
                    }
                    
                }.padding()
                
                Spacer()
                                
            }.padding().frame(maxWidth: .infinity, alignment: .leading)
            
        }.edgesIgnoringSafeArea(.bottom).background(Color(hue: 0.519, saturation: 0.992, brightness: 0.204)).preferredColorScheme(.dark)
    }
}

struct WeatherInfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInfoScreen(weather: previewWeather)
    }
}
