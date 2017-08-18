//
// AlphabeticalListOfProductDetailTableDelegate.swift
// MyCrazyApp
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 05/05/17
//
import Foundation
import UIKit
import SAPOData
import SAPCommon

class AlphabeticalListOfProductDetailTableDelegate: NSObject, DetailTableDelegate {
    private let dataAccess: NorthwindEntitiesDataAccess!
    private var _entity: AlphabeticalListOfProduct?
    var entity: EntityValue {
        get {
            if _entity == nil {
                _entity = createEntityWithDefaultValues()
            }
            return _entity!
        }
        set {
            _entity = newValue as? AlphabeticalListOfProduct
        }
    }
    var rightBarButton: UIBarButtonItem
    private var validity = Array(repeating: true, count: 11)

    init(dataAccess: NorthwindEntitiesDataAccess, rightBarButton: UIBarButtonItem) {
        self.dataAccess = dataAccess
        self.rightBarButton = rightBarButton
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let currentEntity = self.entity as? AlphabeticalListOfProduct else {
            return cellForDefault(tableView: tableView, indexPath: indexPath)
        }
        switch indexPath.row {
        case 0:
            var value = ""
            if currentEntity.hasDataValue(for: AlphabeticalListOfProduct.productID) {
                value = "\(currentEntity.productID)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: AlphabeticalListOfProduct.productID, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validInteger(from: newValue) {
                    currentEntity.productID = validValue
                    self.validity[0] = true
                } else {
                    self.validity[0] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[0]
            })
        case 1:
            var value = ""
            if currentEntity.hasDataValue(for: AlphabeticalListOfProduct.productName) {
                value = "\(currentEntity.productName)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: AlphabeticalListOfProduct.productName, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validString(from: newValue, for: AlphabeticalListOfProduct.productName) {
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
            if currentEntity.hasDataValue(for: AlphabeticalListOfProduct.supplierID) {
                if let supplierID = currentEntity.supplierID {
                    value = "\(supplierID)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: AlphabeticalListOfProduct.supplierID, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.supplierID = nil
                    self.validity[2] = true
                } else {
                    if let validValue = TypeValidator.validInteger(from: newValue) {
                        currentEntity.supplierID = validValue
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
            if currentEntity.hasDataValue(for: AlphabeticalListOfProduct.categoryID) {
                if let categoryID = currentEntity.categoryID {
                    value = "\(categoryID)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: AlphabeticalListOfProduct.categoryID, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.categoryID = nil
                    self.validity[3] = true
                } else {
                    if let validValue = TypeValidator.validInteger(from: newValue) {
                        currentEntity.categoryID = validValue
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
            if currentEntity.hasDataValue(for: AlphabeticalListOfProduct.quantityPerUnit) {
                if let quantityPerUnit = currentEntity.quantityPerUnit {
                    value = "\(quantityPerUnit)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: AlphabeticalListOfProduct.quantityPerUnit, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.quantityPerUnit = nil
                    self.validity[4] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: AlphabeticalListOfProduct.quantityPerUnit) {
                        currentEntity.quantityPerUnit = validValue
                        self.validity[4] = true
                    } else {
                        self.validity[4] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[4]
            })
        case 5:
            var value = ""
            if currentEntity.hasDataValue(for: AlphabeticalListOfProduct.unitPrice) {
                if let unitPrice = currentEntity.unitPrice {
                    value = "\(unitPrice)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: AlphabeticalListOfProduct.unitPrice, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.unitPrice = nil
                    self.validity[5] = true
                } else {
                    if let validValue = TypeValidator.validBigDecimal(from: newValue) {
                        currentEntity.unitPrice = validValue
                        self.validity[5] = true
                    } else {
                        self.validity[5] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[5]
            })
        case 6:
            var value = ""
            if currentEntity.hasDataValue(for: AlphabeticalListOfProduct.unitsInStock) {
                if let unitsInStock = currentEntity.unitsInStock {
                    value = "\(unitsInStock)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: AlphabeticalListOfProduct.unitsInStock, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.unitsInStock = nil
                    self.validity[6] = true
                } else {
                    if let validValue = TypeValidator.validInteger(from: newValue) {
                        currentEntity.unitsInStock = validValue
                        self.validity[6] = true
                    } else {
                        self.validity[6] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[6]
            })
        case 7:
            var value = ""
            if currentEntity.hasDataValue(for: AlphabeticalListOfProduct.unitsOnOrder) {
                if let unitsOnOrder = currentEntity.unitsOnOrder {
                    value = "\(unitsOnOrder)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: AlphabeticalListOfProduct.unitsOnOrder, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.unitsOnOrder = nil
                    self.validity[7] = true
                } else {
                    if let validValue = TypeValidator.validInteger(from: newValue) {
                        currentEntity.unitsOnOrder = validValue
                        self.validity[7] = true
                    } else {
                        self.validity[7] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[7]
            })
        case 8:
            var value = ""
            if currentEntity.hasDataValue(for: AlphabeticalListOfProduct.reorderLevel) {
                if let reorderLevel = currentEntity.reorderLevel {
                    value = "\(reorderLevel)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: AlphabeticalListOfProduct.reorderLevel, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.reorderLevel = nil
                    self.validity[8] = true
                } else {
                    if let validValue = TypeValidator.validInteger(from: newValue) {
                        currentEntity.reorderLevel = validValue
                        self.validity[8] = true
                    } else {
                        self.validity[8] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[8]
            })
        case 9:
            var value = ""
            if currentEntity.hasDataValue(for: AlphabeticalListOfProduct.discontinued) {
                value = "\(currentEntity.discontinued)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: AlphabeticalListOfProduct.discontinued, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validBoolean(from: newValue) {
                    currentEntity.discontinued = validValue
                    self.validity[9] = true
                } else {
                    self.validity[9] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[9]
            })
        case 10:
            var value = ""
            if currentEntity.hasDataValue(for: AlphabeticalListOfProduct.categoryName) {
                value = "\(currentEntity.categoryName)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: AlphabeticalListOfProduct.categoryName, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validString(from: newValue, for: AlphabeticalListOfProduct.categoryName) {
                    currentEntity.categoryName = validValue
                    self.validity[10] = true
                } else {
                    self.validity[10] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[10]
            })
        default:
            return cellForDefault(tableView: tableView, indexPath: indexPath)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func createEntityWithDefaultValues() -> AlphabeticalListOfProduct {
        let newEntity = AlphabeticalListOfProduct()
        newEntity.productID = defaultValueFor(AlphabeticalListOfProduct.productID)
        newEntity.productName = defaultValueFor(AlphabeticalListOfProduct.productName)
        newEntity.discontinued = defaultValueFor(AlphabeticalListOfProduct.discontinued)
        newEntity.categoryName = defaultValueFor(AlphabeticalListOfProduct.categoryName)
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
