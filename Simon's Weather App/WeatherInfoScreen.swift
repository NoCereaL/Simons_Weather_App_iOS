//
//  WeatherInfoScreen.swift
//  Simon's Weather App
//
//  Created by Simon K Moyana on 13/06/2022.
//

import SwiftUI

struct WeatherInfoScreen: View {
    var body: some View {
        TabView{
            DayOneView(weather: previewWeather)
            DayTwoView(weather: previewWeather)
            DayThreeView(weather: previewWeather)
        }.frame(maxHeight: .infinity).tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
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
                        Text(weather.DailyForecasts[0].Temperature.Maximum.Value.roundedNum() + "˚").font(.system(size: 35).bold())
                    }
                    
                    HStack{
                        Text("Minimum Temperature:").fontWeight(.semibold).padding()
                        Text(weather.DailyForecasts[0].Temperature.Minimum.Value.roundedNum() + "˚").font(.system(size: 35).bold())
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
                    
                }
                                
                VStack{
                    Spacer()
                    Text("Day 1").font(.title.bold()).padding()
                    
                    Text("London")
                        .fontWeight(.medium)
                    
                    Text("Swipe for Next Day ->").fontWeight(.semibold).padding(50.0).font(.system(size: 20))
                }
                                
                Spacer()
                                                
            }.padding().frame(maxWidth: .infinity, alignment: .leading)
            
        }.edgesIgnoringSafeArea(.bottom).background(Color(hue: 0.519, saturation: 0.992, brightness: 0.204)).preferredColorScheme(.dark)
    }
}

struct DayTwoView: View{
    var weather: ResponseHandler

    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 10){
                    Text(weather.Headline.Text).font(.title.bold())
                    
                    Text("Today, \(AddDate(day:1)!.formatted())")
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                
                VStack(alignment: .leading, spacing: 20){
                    
                    HStack{
                        Text("Maximum Temperature:").fontWeight(.semibold).padding()
                        Text(weather.DailyForecasts[1].Temperature.Maximum.Value.roundedNum() + "˚").font(.system(size: 35).bold())
                    }
                    
                    HStack{
                        Text("Minimum Temperature:").fontWeight(.semibold).padding()
                        Text(weather.DailyForecasts[1].Temperature.Minimum.Value.roundedNum() + "˚").font(.system(size: 35).bold())
                    }
                    
                }.frame(maxWidth: .infinity)
                
                Text("Conditions").font(.title.bold()).padding()
                
                VStack(alignment: .leading, spacing: 20){
                    
                    HStack{
                        Text("Day: ").fontWeight(.semibold).padding(20.0)
                        Text(weather.DailyForecasts[1].Day.IconPhrase).font(.system(size: 25).bold()).padding()
                    }
                    
                    HStack{
                        Text("Night: ").fontWeight(.semibold).padding(20.0)
                        Text(weather.DailyForecasts[1].Night.IconPhrase).font(.system(size: 25).bold()).padding()
                    }
                    
                }
                
                VStack{
                    Spacer()
                    Text("Day 2").font(.title.bold()).padding()
                    
                    Text("London")
                        .fontWeight(.medium)
                    
                    Text("Swipe for Next Day ->").fontWeight(.semibold).padding(50.0).font(.system(size: 20))
                }
                
                Spacer()
                                
            }.padding().frame(maxWidth: .infinity, alignment: .leading)
            
        }.edgesIgnoringSafeArea(.bottom).background(Color(hue: 0.519, saturation: 0.992, brightness: 0.204)).preferredColorScheme(.dark)
    }
}

struct DayThreeView: View{
    var weather: ResponseHandler

    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                VStack(alignment: .leading, spacing: 10){
                    Text(weather.Headline.Text).font(.title.bold())
                    
                    Text("Today, \(AddDate(day: 2)!.formatted())")
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                
                VStack(alignment: .leading, spacing: 20){
                    
                    HStack{
                        Text("Maximum Temperature:").fontWeight(.semibold).padding()
                        Text(weather.DailyForecasts[2].Temperature.Maximum.Value.roundedNum() + "˚").font(.system(size: 35).bold())
                    }
                    
                    HStack{
                        Text("Minimum Temperature:").fontWeight(.semibold).padding()
                        Text(weather.DailyForecasts[2].Temperature.Minimum.Value.roundedNum() + "˚").font(.system(size: 35).bold())
                    }
                    
                }.frame(maxWidth: .infinity)
                
                Text("Conditions").font(.title.bold()).padding()
                
                VStack(alignment: .leading, spacing: 20){
                    
                    HStack{
                        Text("Day: ").fontWeight(.semibold).padding(20.0)
                        Text(weather.DailyForecasts[2].Day.IconPhrase).font(.system(size: 25).bold()).padding()
                    }
                    
                    HStack{
                        Text("Night: ").fontWeight(.semibold).padding(20.0)
                        Text(weather.DailyForecasts[2].Night.IconPhrase).font(.system(size: 25).bold()).padding()
                    }
                    
                }
                
                VStack{
                    Spacer()
                    Text("Day 3").font(.title.bold()).padding()
                    
                    Text("London")
                        .fontWeight(.medium)
                    
                    Text("<- Swipe for Next Day ").fontWeight(.semibold).padding(50.0).font(.system(size: 20))
                }
                
                Spacer()
                                
            }.padding().frame(maxWidth: .infinity, alignment: .leading)
            
        }.edgesIgnoringSafeArea(.bottom).background(Color(hue: 0.519, saturation: 0.992, brightness: 0.204)).preferredColorScheme(.dark)
    }
}


struct WeatherInfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInfoScreen()
        DayThreeView(weather: previewWeather)
    }
}

//Add # of Days to current day function
func AddDate(day: Int) -> Date?{
    var dateComp = DateComponents()
    dateComp.day = day

    let futureDay = Calendar.current.date(byAdding: dateComp, to: Date())
    return futureDay
}
