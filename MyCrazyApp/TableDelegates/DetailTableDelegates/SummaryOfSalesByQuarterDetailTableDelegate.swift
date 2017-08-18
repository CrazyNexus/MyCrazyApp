//
// SummaryOfSalesByQuarterDetailTableDelegate.swift
// MyCrazyApp
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 05/05/17
//
import Foundation
import UIKit
import SAPOData
import SAPCommon

class SummaryOfSalesByQuarterDetailTableDelegate: NSObject, DetailTableDelegate {
    private let dataAccess: NorthwindEntitiesDataAccess!
    private var _entity: SummaryOfSalesByQuarter?
    var entity: EntityValue {
        get {
            if _entity == nil {
                _entity = createEntityWithDefaultValues()
            }
            return _entity!
        }
        set {
            _entity = newValue as? SummaryOfSalesByQuarter
        }
    }
    var rightBarButton: UIBarButtonItem
    private var validity = Array(repeating: true, count: 3)

    init(dataAccess: NorthwindEntitiesDataAccess, rightBarButton: UIBarButtonItem) {
        self.dataAccess = dataAccess
        self.rightBarButton = rightBarButton
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let currentEntity = self.entity as? SummaryOfSalesByQuarter else {
            return cellForDefault(tableView: tableView, indexPath: indexPath)
        }
        switch indexPath.row {
        case 0:
            var value = ""
            if currentEntity.hasDataValue(for: SummaryOfSalesByQuarter.shippedDate) {
                if let shippedDate = currentEntity.shippedDate {
                    value = "\(shippedDate)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: SummaryOfSalesByQuarter.shippedDate, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.shippedDate = nil
                    self.validity[0] = true
                } else {
                    if let validValue = TypeValidator.validGlobalDateTime(from: newValue) { // This is just a simple solution to handle UTC only
                        currentEntity.shippedDate = validValue
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
            if currentEntity.hasDataValue(for: SummaryOfSalesByQuarter.orderID) {
                value = "\(currentEntity.orderID)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: SummaryOfSalesByQuarter.orderID, value: value, changeHandler: { (newValue: String) -> Bool in
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
            if currentEntity.hasDataValue(for: SummaryOfSalesByQuarter.subtotal) {
                if let subtotal = currentEntity.subtotal {
                    value = "\(subtotal)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: SummaryOfSalesByQuarter.subtotal, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.subtotal = nil
                    self.validity[2] = true
                } else {
                    if let validValue = TypeValidator.validBigDecimal(from: newValue) {
                        currentEntity.subtotal = validValue
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

    func createEntityWithDefaultValues() -> SummaryOfSalesByQuarter {
        let newEntity = SummaryOfSalesByQuarter()
        newEntity.orderID = defaultValueFor(SummaryOfSalesByQuarter.orderID)
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
