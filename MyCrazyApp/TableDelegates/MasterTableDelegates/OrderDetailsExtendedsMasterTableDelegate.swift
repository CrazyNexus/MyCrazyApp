//
// OrderDetailsExtendedsMasterTableDelegate.swift
// MyCrazyApp
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 05/05/17
//
import Foundation
import SAPFoundation
import SAPOData
import SAPCommon

class OrderDetailsExtendedsMasterTableDelegate: NSObject, MasterTableDelegate {
    private let dataAccess: NorthwindEntitiesDataAccess!
    weak var notifier: Notifier?
    private let logger: Logger = Logger.shared(named: "MasterTableDelegateLogger")
    private var _entities: [OrderDetailsExtended] = [OrderDetailsExtended]()
    var entities: [EntityValue] {
        get { return _entities }
        set { self._entities = newValue as! [OrderDetailsExtended]
        }
    }

    init(dataAccess: NorthwindEntitiesDataAccess) {
        self.dataAccess = dataAccess
    }

    func requestEntities(completionHandler: @escaping(Error?) -> Void) {
        self.dataAccess.loadOrderDetailsExtendeds { (orderdetailsextendeds, error) in
            guard let orderdetailsextendeds = orderdetailsextendeds else {
                completionHandler(error!)
                return
            }
            self.entities = orderdetailsextendeds
            completionHandler(nil)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self._entities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let orderdetailsextended = self.entities[indexPath.row] as! OrderDetailsExtended
        let cell = cellWithNonEditableContent(tableView: tableView, indexPath: indexPath, key: "Discount", value: "\(orderdetailsextended.discount)")
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
