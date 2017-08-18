//
// OrderDetailDetailTableDelegate.swift
// MyCrazyApp
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 05/05/17
//
import Foundation
import UIKit
import SAPOData
import SAPCommon

class OrderDetailDetailTableDelegate: NSObject, DetailTableDelegate {
    private let dataAccess: NorthwindEntitiesDataAccess!
    private var _entity: OrderDetail?
    var entity: EntityValue {
        get {
            if _entity == nil {
                _entity = createEntityWithDefaultValues()
            }
            return _entity!
        }
        set {
            _entity = newValue as? OrderDetail
        }
    }
    var rightBarButton: UIBarButtonItem
    private var validity = Array(repeating: true, count: 5)

    init(dataAccess: NorthwindEntitiesDataAccess, rightBarButton: UIBarButtonItem) {
        self.dataAccess = dataAccess
        self.rightBarButton = rightBarButton
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let currentEntity = self.entity as? OrderDetail else {
            return cellForDefault(tableView: tableView, indexPath: indexPath)
        }
        switch indexPath.row {
        case 0:
            var value = ""
            if currentEntity.hasDataValue(for: OrderDetail.orderID) {
                value = "\(currentEntity.orderID)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrderDetail.orderID, value: value, changeHandler: { (newValue: String) -> Bool in
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
            if currentEntity.hasDataValue(for: OrderDetail.productID) {
                value = "\(currentEntity.productID)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrderDetail.productID, value: value, changeHandler: { (newValue: String) -> Bool in
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
            if currentEntity.hasDataValue(for: OrderDetail.unitPrice) {
                value = "\(currentEntity.unitPrice)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrderDetail.unitPrice, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validBigDecimal(from: newValue) {
                    currentEntity.unitPrice = validValue
                    self.validity[2] = true
                } else {
                    self.validity[2] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[2]
            })
        case 3:
            var value = ""
            if currentEntity.hasDataValue(for: OrderDetail.quantity) {
                value = "\(currentEntity.quantity)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrderDetail.quantity, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validInteger(from: newValue) {
                    currentEntity.quantity = validValue
                    self.validity[3] = true
                } else {
                    self.validity[3] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[3]
            })
        case 4:
            var value = ""
            if currentEntity.hasDataValue(for: OrderDetail.discount) {
                value = "\(currentEntity.discount)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrderDetail.discount, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validFloat(from: newValue) {
                    currentEntity.discount = validValue
                    self.validity[4] = true
                } else {
                    self.validity[4] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[4]
            })
        default:
            return cellForDefault(tableView: tableView, indexPath: indexPath)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func createEntityWithDefaultValues() -> OrderDetail {
        let newEntity = OrderDetail()
        newEntity.orderID = defaultValueFor(OrderDetail.orderID)
        newEntity.productID = defaultValueFor(OrderDetail.productID)
        newEntity.unitPrice = defaultValueFor(OrderDetail.unitPrice)
        newEntity.quantity = defaultValueFor(OrderDetail.quantity)
        newEntity.discount = defaultValueFor(OrderDetail.discount)
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
