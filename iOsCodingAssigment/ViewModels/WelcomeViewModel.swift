//
//  WelcomeViewModel.swift
//  iOsCodingAssigment
//
//  Created by Gregori Farias  on 19/23/24.
//

import Foundation

class WelcomeViewModel {
    var modelStatusLoad: ((StatusLoad) -> Void)?
    let countryListViewModel: CountryListViewModel
    
    init(countryListViewModel: CountryListViewModel = CountryListViewModel()) {
        self.countryListViewModel = countryListViewModel
    }
    
    func loadData() {
           countryListViewModel.loadCountries { [weak self] in
               // Inform the view controller that data loading is completed
               self?.modelStatusLoad?(.loaded)
           }
       }
   
}
