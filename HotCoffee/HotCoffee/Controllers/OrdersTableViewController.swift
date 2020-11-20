//
//  OrdersTableViewController.swift
//  HotCoffee
//
//  Created by Mohammad Azam on 5/10/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class OrdersTableViewController: UITableViewController {
    var orderListViewModel : OrderListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateOrders()
    }
    
    private func populateOrders() {
        guard let url = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else {
            fatalError("URL is incorrect!")
        }
        Webservice.getApiData(requestUrl: url, decodingType: [Order].self) { [weak self] (result, error) in
            if error != nil {
                print(error)
                return;
            }
            if result != nil {
                print(result);
                self?.orderListViewModel = OrderListViewModel(orders: result)
                self?.tableView.reloadData()
            }
        }

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navC = segue.destination as? UINavigationController ,
              let addCoffeeOrderVC = navC.viewControllers.first as? AddOrderViewController else {
            return
        }
        addCoffeeOrderVC.delegate = self;
    }
}

extension OrdersTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orderListViewModel?.ordersViewModel?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vm = self.orderListViewModel?.getOrderViewModel(at: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderTableViewCell", for: indexPath)
        cell.textLabel?.text = vm?.type
        cell.detailTextLabel?.text = vm?.size
        return cell
    }
}

extension OrdersTableViewController : AddCoffeeOrderDelegate {
    func addCoffeeOrderViewControllerDidSave(order: Order, controller: UIViewController) {
        controller.dismiss(animated: true, completion: nil)
        let orderVM = OrderViewModel(order : order)
        self.orderListViewModel?.ordersViewModel?.append(orderVM);
        if let item = orderListViewModel?.ordersViewModel {
            self.tableView.insertRows(at: [IndexPath(row: item.count - 1, section: 0)], with: .automatic)
        }
        
    }
    
    func addCoffeeOrderViewControllerDidClose(controller: UIViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
