//
//  ViewController.swift
//  ReloadlyAuthentication
//
//  Created by 4taras4 on 03/15/2021.
//  Copyright (c) 2021 4taras4. All rights reserved.
//

import UIKit
import ReloadlySDK

class ViewController: UITableViewController {
    
    var actions = ["Get balance", "Get country list", "Get discount list", "Get operators list", "Get promotion list", "Get transaction list"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func selectItemAt(index: Int) {
        switch index {
        case 0:
            ReloadlyAirtime.shared.getAccountBalance() { result in
                DispatchQueue.main.async {
                    self.process(result: result)
                }
            }
        case 1:
            ReloadlyAirtime.shared.getCountryList() { result in
                DispatchQueue.main.async {
                    self.process(result: result)
                }
            }
        case 2:
            ReloadlyAirtime.shared.getDiscountsList() { result in
                DispatchQueue.main.async {
                    self.process(result: result)
                }
            }
        case 3:
            ReloadlyAirtime.shared.getOperatorsList() { result in
                DispatchQueue.main.async {
                    self.process(result: result)
                }
            }
        case 4:
            ReloadlyAirtime.shared.getPromotionsList() { result in
                DispatchQueue.main.async {
                    self.process(result: result)
                }
            }
        case 5:
            ReloadlyAirtime.shared.getTransactionsList() { result in
                DispatchQueue.main.async {
                    self.process(result: result)
                }
            }
        default:
            break
        }
    }
}

extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell")!
        cell.textLabel?.text = actions[indexPath.row]
        return cell
    }
    
    func process<T>(result: Result<T, Error>) {
        switch result {
        case .success(let data):
            showAlert(title: "Success", message: "\(data)")
        case .failure(let error):
            showAlert(title: "Error", message: error.localizedDescription)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectItemAt(index: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Actions list"
    }
}

extension UIViewController {
    func showAlert(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

