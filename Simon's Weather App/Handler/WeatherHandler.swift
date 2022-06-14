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

        //API Url string
        //You can replace the API Key in the Braces Bellow
        guard let url = URL(string: "https://dataservice.accuweather.com/forecasts/v1/daily/5day/328328?apikey=\("GoHEEUY25jZQnE8lnhRB7zGTAWJe2SBO")")
        else{
            fatalError("URL is Missing")
        }
                
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard (response as? HTTPURLResponse)?.statusCode == 200
        else{
            fatalError("Error Getting Weather Data")
        }
        
        //Decode Json File
       let decodedData = try JSONDecoder().decode(ResponseHandler.self, from: data)
        
        //Function Will Return Decoded Data from urlResponse
        return decodedData
    }
}

//Decode Json Objects from urlResponse
//Tested using weatherJson.json file and WeatherInfoScreen Preview
struct ResponseHandler: Decodable{
    var Headline: HeadlineResponse
    var DailyForecasts: [DailyForecastResponse]     //DailyForecasts is an Array containing forecasts objects for each day
    
    //Headline Objects
    struct HeadlineResponse: Decodable{
        var Text: String
    }
    
    //DailyForecasts Objects
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
