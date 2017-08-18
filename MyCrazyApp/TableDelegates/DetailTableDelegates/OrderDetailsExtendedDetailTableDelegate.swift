//
// OrderDetailsExtendedDetailTableDelegate.swift
// MyCrazyApp
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 05/05/17
//
import Foundation
import UIKit
import SAPOData
import SAPCommon

class OrderDetailsExtendedDetailTableDelegate: NSObject, DetailTableDelegate {
    private let dataAccess: NorthwindEntitiesDataAccess!
    private var _entity: OrderDetailsExtended?
    var entity: EntityValue {
        get {
            if _entity == nil {
                _entity = createEntityWithDefaultValues()
            }
            return _entity!
        }
        set {
            _entity = newValue as? OrderDetailsExtended
        }
    }
    var rightBarButton: UIBarButtonItem
    private var validity = Array(repeating: true, count: 7)

    init(dataAccess: NorthwindEntitiesDataAccess, rightBarButton: UIBarButtonItem) {
        self.dataAccess = dataAccess
        self.rightBarButton = rightBarButton
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let currentEntity = self.entity as? OrderDetailsExtended else {
            return cellForDefault(tableView: tableView, indexPath: indexPath)
        }
        switch indexPath.row {
        case 0:
            var value = ""
            if currentEntity.hasDataValue(for: OrderDetailsExtended.orderID) {
                value = "\(currentEntity.orderID)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrderDetailsExtended.orderID, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validInteger(from: newValue) {
                    currentEntity.orderID = validValue
                    self.validity[0] = true
                } else {
                    self.validity[0] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[0]
            })
        case 1:
            var value = ""
            if currentEntity.hasDataValue(for: OrderDetailsExtended.productID) {
                value = "\(currentEntity.productID)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrderDetailsExtended.productID, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validInteger(from: newValue) {
                    currentEntity.productID = validValue
                    self.validity[1] = true
                } else {
                    self.validity[1] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[1]
            })
        case 2:
            var value = ""
            if currentEntity.hasDataValue(for: OrderDetailsExtended.productName) {
                value = "\(currentEntity.productName)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrderDetailsExtended.productName, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validString(from: newValue, for: OrderDetailsExtended.productName) {
                    currentEntity.productName = validValue
                    self.validity[2] = true
                } else {
                    self.validity[2] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[2]
            })
        case 3:
            var value = ""
            if currentEntity.hasDataValue(for: OrderDetailsExtended.unitPrice) {
                value = "\(currentEntity.unitPrice)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrderDetailsExtended.unitPrice, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validBigDecimal(from: newValue) {
                    currentEntity.unitPrice = validValue
                    self.validity[3] = true
                } else {
                    self.validity[3] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[3]
            })
        case 4:
            var value = ""
            if currentEntity.hasDataValue(for: OrderDetailsExtended.quantity) {
                value = "\(currentEntity.quantity)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrderDetailsExtended.quantity, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validInteger(from: newValue) {
                    currentEntity.quantity = validValue
                    self.validity[4] = true
                } else {
                    self.validity[4] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[4]
            })
        case 5:
            var value = ""
            if currentEntity.hasDataValue(for: OrderDetailsExtended.discount) {
                value = "\(currentEntity.discount)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrderDetailsExtended.discount, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validFloat(from: newValue) {
                    currentEntity.discount = validValue
                    self.validity[5] = true
                } else {
                    self.validity[5] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[5]
            })
        case 6:
            var value = ""
            if currentEntity.hasDataValue(for: OrderDetailsExtended.extendedPrice) {
                if let extendedPrice = currentEntity.extendedPrice {
                    value = "\(extendedPrice)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrderDetailsExtended.extendedPrice, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.extendedPrice = nil
                    self.validity[6] = true
                } else {
                    if let validValue = TypeValidator.validBigDecimal(from: newValue) {
                        currentEntity.extendedPrice = validValue
                        self.validity[6] = true
                    } else {
                        self.validity[6] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[6]
            })
        default:
            return cellForDefault(tableView: tableView, indexPath: indexPath)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func createEntityWithDefaultValues() -> OrderDetailsExtended {
        let newEntity = OrderDetailsExtended()
        newEntity.orderID = defaultValueFor(OrderDetailsExtended.orderID)
        newEntity.productID = defaultValueFor(OrderDetailsExtended.productID)
        newEntity.productName = defaultValueFor(OrderDetailsExtended.productName)
        newEntity.unitPrice = defaultValueFor(OrderDetailsExtended.unitPrice)
        newEntity.quantity = defaultValueFor(OrderDetailsExtended.quantity)
        newEntity.discount = defaultValueFor(OrderDetailsExtended.discount)
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
