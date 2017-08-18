//
// SalesTotalsByAmountDetailTableDelegate.swift
// MyCrazyApp
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 05/05/17
//
import Foundation
import UIKit
import SAPOData
import SAPCommon

class SalesTotalsByAmountDetailTableDelegate: NSObject, DetailTableDelegate {
    private let dataAccess: NorthwindEntitiesDataAccess!
    private var _entity: SalesTotalsByAmount?
    var entity: EntityValue {
        get {
            if _entity == nil {
                _entity = createEntityWithDefaultValues()
            }
            return _entity!
        }
        set {
            _entity = newValue as? SalesTotalsByAmount
        }
    }
    var rightBarButton: UIBarButtonItem
    private var validity = Array(repeating: true, count: 4)

    init(dataAccess: NorthwindEntitiesDataAccess, rightBarButton: UIBarButtonItem) {
        self.dataAccess = dataAccess
        self.rightBarButton = rightBarButton
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let currentEntity = self.entity as? SalesTotalsByAmount else {
            return cellForDefault(tableView: tableView, indexPath: indexPath)
        }
        switch indexPath.row {
        case 0:
            var value = ""
            if currentEntity.hasDataValue(for: SalesTotalsByAmount.saleAmount) {
                if let saleAmount = currentEntity.saleAmount {
                    value = "\(saleAmount)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: SalesTotalsByAmount.saleAmount, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.saleAmount = nil
                    self.validity[0] = true
                } else {
                    if let validValue = TypeValidator.validBigDecimal(from: newValue) {
                        currentEntity.saleAmount = validValue
                        self.validity[0] = true
                    } else {
                        self.validity[0] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[0]
            })
        case 1:
            var value = ""
            if currentEntity.hasDataValue(for: SalesTotalsByAmount.orderID) {
                value = "\(currentEntity.orderID)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: SalesTotalsByAmount.orderID, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validInteger(from: newValue) {
                    currentEntity.orderID = validValue
                    self.validity[1] = true
                } else {
                    self.validity[1] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[1]
            })
        case 2:
            var value = ""
            if currentEntity.hasDataValue(for: SalesTotalsByAmount.companyName) {
                value = "\(currentEntity.companyName)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: SalesTotalsByAmount.companyName, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validString(from: newValue, for: SalesTotalsByAmount.companyName) {
                    currentEntity.companyName = validValue
                    self.validity[2] = true
                } else {
                    self.validity[2] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[2]
            })
        case 3:
            var value = ""
            if currentEntity.hasDataValue(for: SalesTotalsByAmount.shippedDate) {
                if let shippedDate = currentEntity.shippedDate {
                    value = "\(shippedDate)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: SalesTotalsByAmount.shippedDate, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.shippedDate = nil
                    self.validity[3] = true
                } else {
                    if let validValue = TypeValidator.validGlobalDateTime(from: newValue) { // This is just a simple solution to handle UTC only
                        currentEntity.shippedDate = validValue
                        self.validity[3] = true
                    } else {
                        self.validity[3] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[3]
            })
        default:
            return cellForDefault(tableView: tableView, indexPath: indexPath)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func createEntityWithDefaultValues() -> SalesTotalsByAmount {
        let newEntity = SalesTotalsByAmount()
        newEntity.orderID = defaultValueFor(SalesTotalsByAmount.orderID)
        newEntity.companyName = defaultValueFor(SalesTotalsByAmount.companyName)
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
