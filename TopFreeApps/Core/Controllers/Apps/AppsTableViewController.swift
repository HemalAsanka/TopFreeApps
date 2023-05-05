//
//  AppResultTblViewController.swift
//  TopFreeApps
//
//  Created by Hemal Swarnasiri on 2023-01-16.
//

import UIKit
import Combine

class AppsTableViewController: UITableViewController {
    
    private var apps:[App]? = nil
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "USA Top Free Apps"
        self.getApps()
    }

    // MARK: - Private methods
    
    private func getApps() {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.hidesWhenStopped = true
            spinner.startAnimating()
            tableView.backgroundView = spinner
        
        let appURL = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/50/apps.json"
    
        WebServiceManager.shared.getData(endpoint: appURL, type: AppResponse.self)
            .sink { completion in
                spinner.stopAnimating()
            switch completion {
            case .failure(let err):
                print("Error is \(err.localizedDescription)")
            case .finished:
                print("Finished")
            }
        } receiveValue: { [weak self] appsResponse in
            self?.apps = appsResponse.feed.results
            self?.tableView.reloadData()
        } .store(in: &cancellables)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apps?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let app = self.apps![indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "AppCell") as? AppCell {
                cell.lblAppName.text = app.name
                cell.lblReleaseDate.text = app.releaseDate
                return cell
            }
            return UITableViewCell()
    }

}
