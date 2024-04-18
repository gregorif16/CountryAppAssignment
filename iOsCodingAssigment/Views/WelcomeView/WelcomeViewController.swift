//
//  WelcomeViewController.swift
//  iOsCodingAssigment
//
//  Created by Gregori farias  on 15/4/24.
//


import UIKit

class WelcomeViewController: UIViewController {
    
    
    @IBOutlet weak var welcomeActivityIndicator: UIActivityIndicatorView!
    private var viewModel: WelcomeViewModel
    
    init(viewModel: WelcomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setObservers()
        viewModel.loadData()   }
    
    private func setObservers() {
        viewModel.modelStatusLoad = { [weak self] status in
            switch status {
            case .loading:
                self?.showLoading(show: true)
            case .loaded:
                self?.showLoading(show: false)
                self?.navigateToCountryList()
            case .error:
                print("Error in Splash")
            case .none:
                print("None in Splash")
            }
        }
    }
    
    //Private Methods
    private func showLoading(show: Bool) {
        switch show {
        case true where !welcomeActivityIndicator.isAnimating:
            welcomeActivityIndicator.startAnimating()
        case false where welcomeActivityIndicator.isAnimating:
            welcomeActivityIndicator.stopAnimating()
        default: break
        }
    }
    
    private func navigateToCountryList() {
        let countryListVC = CountryListViewController(viewModel: CountryListViewModel())
        navigationController?.pushViewController(countryListVC, animated: true)
    }
}

    
    
    
    
