//
// SalesByCategoryDetailTableDelegate.swift
// MyCrazyApp
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 05/05/17
//
import Foundation
import UIKit
import SAPOData
import SAPCommon

class SalesByCategoryDetailTableDelegate: NSObject, DetailTableDelegate {
    private let dataAccess: NorthwindEntitiesDataAccess!
    private var _entity: SalesByCategory?
    var entity: EntityValue {
        get {
            if _entity == nil {
                _entity = createEntityWithDefaultValues()
            }
            return _entity!
        }
        set {
            _entity = newValue as? SalesByCategory
        }
    }
    var rightBarButton: UIBarButtonItem
    private var validity = Array(repeating: true, count: 4)

    init(dataAccess: NorthwindEntitiesDataAccess, rightBarButton: UIBarButtonItem) {
        self.dataAccess = dataAccess
        self.rightBarButton = rightBarButton
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let currentEntity = self.entity as? SalesByCategory else {
            return cellForDefault(tableView: tableView, indexPath: indexPath)
        }
        switch indexPath.row {
        case 0:
            var value = ""
            if currentEntity.hasDataValue(for: SalesByCategory.categoryID) {
                value = "\(currentEntity.categoryID)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: SalesByCategory.categoryID, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validInteger(from: newValue) {
                    currentEntity.categoryID = validValue
                    self.validity[0] = true
                } else {
                    self.validity[0] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[0]
            })
        case 1:
            var value = ""
            if currentEntity.hasDataValue(for: SalesByCategory.categoryName) {
                value = "\(currentEntity.categoryName)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: SalesByCategory.categoryName, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validString(from: newValue, for: SalesByCategory.categoryName) {
                    currentEntity.categoryName = validValue
                    self.validity[1] = true
                } else {
                    self.validity[1] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[1]
            })
        case 2:
            var value = ""
            if currentEntity.hasDataValue(for: SalesByCategory.productName) {
                value = "\(currentEntity.productName)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: SalesByCategory.productName, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validString(from: newValue, for: SalesByCategory.productName) {
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
            if currentEntity.hasDataValue(for: SalesByCategory.productSales) {
                if let productSales = currentEntity.productSales {
                    value = "\(productSales)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: SalesByCategory.productSales, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.productSales = nil
                    self.validity[3] = true
                } else {
                    if let validValue = TypeValidator.validBigDecimal(from: newValue) {
                        currentEntity.productSales = validValue
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

    func createEntityWithDefaultValues() -> SalesByCategory {
        let newEntity = SalesByCategory()
        newEntity.categoryID = defaultValueFor(SalesByCategory.categoryID)
        newEntity.categoryName = defaultValueFor(SalesByCategory.categoryName)
        newEntity.productName = defaultValueFor(SalesByCategory.productName)
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
