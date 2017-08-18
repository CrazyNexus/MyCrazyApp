//
// ProductsByCategoryDetailTableDelegate.swift
// MyCrazyApp
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 05/05/17
//
import Foundation
import UIKit
import SAPOData
import SAPCommon

class ProductsByCategoryDetailTableDelegate: NSObject, DetailTableDelegate {
    private let dataAccess: NorthwindEntitiesDataAccess!
    private var _entity: ProductsByCategory?
    var entity: EntityValue {
        get {
            if _entity == nil {
                _entity = createEntityWithDefaultValues()
            }
            return _entity!
        }
        set {
            _entity = newValue as? ProductsByCategory
        }
    }
    var rightBarButton: UIBarButtonItem
    private var validity = Array(repeating: true, count: 5)

    init(dataAccess: NorthwindEntitiesDataAccess, rightBarButton: UIBarButtonItem) {
        self.dataAccess = dataAccess
        self.rightBarButton = rightBarButton
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let currentEntity = self.entity as? ProductsByCategory else {
            return cellForDefault(tableView: tableView, indexPath: indexPath)
        }
        switch indexPath.row {
        case 0:
            var value = ""
            if currentEntity.hasDataValue(for: ProductsByCategory.categoryName) {
                value = "\(currentEntity.categoryName)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: ProductsByCategory.categoryName, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validString(from: newValue, for: ProductsByCategory.categoryName) {
                    currentEntity.categoryName = validValue
                    self.validity[0] = true
                } else {
                    self.validity[0] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[0]
            })
        case 1:
            var value = ""
            if currentEntity.hasDataValue(for: ProductsByCategory.productName) {
                value = "\(currentEntity.productName)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: ProductsByCategory.productName, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validString(from: newValue, for: ProductsByCategory.productName) {
                    currentEntity.productName = validValue
                    self.validity[1] = true
                } else {
                    self.validity[1] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[1]
            })
        case 2:
            var value = ""
            if currentEntity.hasDataValue(for: ProductsByCategory.quantityPerUnit) {
                if let quantityPerUnit = currentEntity.quantityPerUnit {
                    value = "\(quantityPerUnit)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: ProductsByCategory.quantityPerUnit, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.quantityPerUnit = nil
                    self.validity[2] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: ProductsByCategory.quantityPerUnit) {
                        currentEntity.quantityPerUnit = validValue
                        self.validity[2] = true
                    } else {
                        self.validity[2] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[2]
            })
        case 3:
            var value = ""
            if currentEntity.hasDataValue(for: ProductsByCategory.unitsInStock) {
                if let unitsInStock = currentEntity.unitsInStock {
                    value = "\(unitsInStock)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: ProductsByCategory.unitsInStock, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.unitsInStock = nil
                    self.validity[3] = true
                } else {
                    if let validValue = TypeValidator.validInteger(from: newValue) {
                        currentEntity.unitsInStock = validValue
                        self.validity[3] = true
                    } else {
                        self.validity[3] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[3]
            })
        case 4:
            var value = ""
            if currentEntity.hasDataValue(for: ProductsByCategory.discontinued) {
                value = "\(currentEntity.discontinued)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: ProductsByCategory.discontinued, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validBoolean(from: newValue) {
                    currentEntity.discontinued = validValue
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

    func createEntityWithDefaultValues() -> ProductsByCategory {
        let newEntity = ProductsByCategory()
        newEntity.categoryName = defaultValueFor(ProductsByCategory.categoryName)
        newEntity.productName = defaultValueFor(ProductsByCategory.productName)
        newEntity.discontinued = defaultValueFor(ProductsByCategory.discontinued)
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
