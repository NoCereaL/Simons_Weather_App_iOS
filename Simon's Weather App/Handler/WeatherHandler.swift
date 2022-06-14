//
//  WeatherHandler.swift
//  Simon's Weather App
//
//  Created by Simon K Moyana on 13/06/2022.
//

import Foundation
import CoreLocation

class WeatherHandler{
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseHandler{
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\("8fc9c0b0cd9535aed2b765e6d3f612d2")&units=metric")
        else{
            fatalError("URL is Missing")
        }
                
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard (response as? HTTPURLResponse)?.statusCode == 200
        else{
            fatalError("Error Getting Weather Data")
        }
        
       let decodedData = try JSONDecoder().decode(ResponseHandler.self, from: data)
        
        return decodedData
    }
}


struct ResponseHandler: Decodable{
    var Headline: HeadlineResponse
    var DailyForecasts: [DailyForecastResponse]
    
    struct HeadlineResponse: Decodable{
        var Text: String
    }
    
    
    struct DailyForecastResponse: Decodable{
        var Date: String
        var Temperature: TemperatureResponse
        var Day: DayResponse
        var Night: NightResponse
    }
    
    struct TemperatureResponse: Decodable{
        var Minimum: minimumResponse
        var Maximum: maximumResponse
        
        struct minimumResponse: Decodable{
            var Value: Double
            var Unit: String
        }
        
        struct maximumResponse: Decodable{
            var Value: Double
            var Unit: String
        }
    }
    
    struct DayResponse: Decodable{
        var Icon: Double
        var IconPhrase: String
        var HasPrecipitation: Bool
    }
    
    struct NightResponse: Decodable{
        var Icon: Double
        var IconPhrase: String
        var HasPrecipitation: Bool
    }
}
