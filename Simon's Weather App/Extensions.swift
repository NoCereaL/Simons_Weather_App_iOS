//
//  Extensions.swift
//  Simon's Weather App
//
//  Created by Simon K Moyana on 13/06/2022.
//

import Foundation

//Extension so we acn access it throughout project
extension Double{
    //Function Returns String by converting Integer to String rounded by 1dp
    func roundedNum() -> String{
        return String(format: "%.0f", self)
    }
}
