//
// ShipperDetailTableDelegate.swift
// MyCrazyApp
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 05/05/17
//
import Foundation
import UIKit
import SAPOData
import SAPCommon

class ShipperDetailTableDelegate: NSObject, DetailTableDelegate {
    private let dataAccess: NorthwindEntitiesDataAccess!
    private var _entity: Shipper?
    var entity: EntityValue {
        get {
            if _entity == nil {
                _entity = createEntityWithDefaultValues()
            }
            return _entity!
        }
        set {
            _entity = newValue as? Shipper
        }
    }
    var rightBarButton: UIBarButtonItem
    private var validity = Array(repeating: true, count: 3)

    init(dataAccess: NorthwindEntitiesDataAccess, rightBarButton: UIBarButtonItem) {
        self.dataAccess = dataAccess
        self.rightBarButton = rightBarButton
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let currentEntity = self.entity as? Shipper else {
            return cellForDefault(tableView: tableView, indexPath: indexPath)
        }
        switch indexPath.row {
        case 0:
            var value = ""
            if currentEntity.hasDataValue(for: Shipper.shipperID) {
                value = "\(currentEntity.shipperID)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Shipper.shipperID, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validInteger(from: newValue) {
                    currentEntity.shipperID = validValue
                    self.validity[0] = true
                } else {
                    self.validity[0] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[0]
            })
        case 1:
            var value = ""
            if currentEntity.hasDataValue(for: Shipper.companyName) {
                value = "\(currentEntity.companyName)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Shipper.companyName, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validString(from: newValue, for: Shipper.companyName) {
                    currentEntity.companyName = validValue
                    self.validity[1] = true
                } else {
                    self.validity[1] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[1]
            })
        case 2:
            var value = ""
            if currentEntity.hasDataValue(for: Shipper.phone) {
                if let phone = currentEntity.phone {
                    value = "\(phone)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Shipper.phone, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.phone = nil
                    self.validity[2] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Shipper.phone) {
                        currentEntity.phone = validValue
                        self.validity[2] = true
                    } else {
                        self.validity[2] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[2]
            })
        default:
            return cellForDefault(tableView: tableView, indexPath: indexPath)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func createEntityWithDefaultValues() -> Shipper {
        let newEntity = Shipper()
        newEntity.shipperID = defaultValueFor(Shipper.shipperID)
        newEntity.companyName = defaultValueFor(Shipper.companyName)
        return newEntity
    }

    // Check if all text fields are valid
    private func barButtonShouldBeEnabled() {
        let anyFieldInvalid = self.validity.first { (field) -> Bool in
            return field == false
        }
        self.rightBarButton.isEnabled = anyFieldInvalid == nil
    }
}
