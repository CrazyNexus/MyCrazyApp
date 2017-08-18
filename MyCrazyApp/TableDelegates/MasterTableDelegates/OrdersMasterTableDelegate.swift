//
// OrdersMasterTableDelegate.swift
// MyCrazyApp
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 05/05/17
//
import Foundation
import SAPFoundation
import SAPOData
import SAPCommon

class OrdersMasterTableDelegate: NSObject, MasterTableDelegate {
    private let dataAccess: NorthwindEntitiesDataAccess!
    weak var notifier: Notifier?
    private let logger: Logger = Logger.shared(named: "MasterTableDelegateLogger")
    private var _entities: [Order] = [Order]()
    var entities: [EntityValue] {
        get { return _entities }
        set { self._entities = newValue as! [Order]
        }
    }

    init(dataAccess: NorthwindEntitiesDataAccess) {
        self.dataAccess = dataAccess
    }

    func requestEntities(completionHandler: @escaping(Error?) -> Void) {
        self.dataAccess.loadOrders { (orders, error) in
            guard let orders = orders else {
                completionHandler(error!)
                return
            }
            self.entities = orders
            completionHandler(nil)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self._entities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let order = self.entities[indexPath.row] as! Order
        let cell = cellWithNonEditableContent(tableView: tableView, indexPath: indexPath, key: "OrderID", value: "\(order.orderID)")
        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle != .delete {
            return
        }
        let currentEntity = self._entities[indexPath.row]
        self.dataAccess.service.deleteEntity(currentEntity) { error in
            if let error = error {

                self.logger.error("Delete entry failed.", error: error)
                self.notifier?.displayAlert(title: NSLocalizedString("keyErrorDeletingEntryTitle", value: "Delete entry failed", comment: "XTIT: Title of deleting entry error pop up."), message: NSLocalizedString("keyErrorDeletingEntryBody", value: error.localizedDescription, comment: "XMSG: Body of deleting entry error pop up."), buttonText: NSLocalizedString("keyOkButtonDeletingEntryError", value: "OK", comment: "XBUT: Title of OK button."))
                return
            }
            self._entities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
