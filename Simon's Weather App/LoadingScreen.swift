//
//  LoadingScreen.swift
//  Simon's Weather App
//
//  Created by Simon K Moyana on 13/06/2022.
//

import SwiftUI

struct LoadingScreen: View {
    var body: some View {
        VStack{
            Spacer()
            Spacer()
            Text("Please Be Patient While We Fetch Weather Data!").fontWeight(.semibold).multilineTextAlignment(.center).padding(20.0)
            
            ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .red)).frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct LoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreen()
    }
}
