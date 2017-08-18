//
// SupplierDetailTableDelegate.swift
// MyCrazyApp
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 05/05/17
//
import Foundation
import UIKit
import SAPOData
import SAPCommon

class SupplierDetailTableDelegate: NSObject, DetailTableDelegate {
    private let dataAccess: NorthwindEntitiesDataAccess!
    private var _entity: Supplier?
    var entity: EntityValue {
        get {
            if _entity == nil {
                _entity = createEntityWithDefaultValues()
            }
            return _entity!
        }
        set {
            _entity = newValue as? Supplier
        }
    }
    var rightBarButton: UIBarButtonItem
    private var validity = Array(repeating: true, count: 12)

    init(dataAccess: NorthwindEntitiesDataAccess, rightBarButton: UIBarButtonItem) {
        self.dataAccess = dataAccess
        self.rightBarButton = rightBarButton
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let currentEntity = self.entity as? Supplier else {
            return cellForDefault(tableView: tableView, indexPath: indexPath)
        }
        switch indexPath.row {
        case 0:
            var value = ""
            if currentEntity.hasDataValue(for: Supplier.supplierID) {
                value = "\(currentEntity.supplierID)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Supplier.supplierID, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validInteger(from: newValue) {
                    currentEntity.supplierID = validValue
                    self.validity[0] = true
                } else {
                    self.validity[0] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[0]
            })
        case 1:
            var value = ""
            if currentEntity.hasDataValue(for: Supplier.companyName) {
                value = "\(currentEntity.companyName)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Supplier.companyName, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validString(from: newValue, for: Supplier.companyName) {
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
            if currentEntity.hasDataValue(for: Supplier.contactName) {
                if let contactName = currentEntity.contactName {
                    value = "\(contactName)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Supplier.contactName, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.contactName = nil
                    self.validity[2] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Supplier.contactName) {
                        currentEntity.contactName = validValue
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
            if currentEntity.hasDataValue(for: Supplier.contactTitle) {
                if let contactTitle = currentEntity.contactTitle {
                    value = "\(contactTitle)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Supplier.contactTitle, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.contactTitle = nil
                    self.validity[3] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Supplier.contactTitle) {
                        currentEntity.contactTitle = validValue
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
            if currentEntity.hasDataValue(for: Supplier.address) {
                if let address = currentEntity.address {
                    value = "\(address)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Supplier.address, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.address = nil
                    self.validity[4] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Supplier.address) {
                        currentEntity.address = validValue
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
            if currentEntity.hasDataValue(for: Supplier.city) {
                if let city = currentEntity.city {
                    value = "\(city)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Supplier.city, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.city = nil
                    self.validity[5] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Supplier.city) {
                        currentEntity.city = validValue
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
            if currentEntity.hasDataValue(for: Supplier.region) {
                if let region = currentEntity.region {
                    value = "\(region)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Supplier.region, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.region = nil
                    self.validity[6] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Supplier.region) {
                        currentEntity.region = validValue
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
            if currentEntity.hasDataValue(for: Supplier.postalCode) {
                if let postalCode = currentEntity.postalCode {
                    value = "\(postalCode)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Supplier.postalCode, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.postalCode = nil
                    self.validity[7] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Supplier.postalCode) {
                        currentEntity.postalCode = validValue
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
            if currentEntity.hasDataValue(for: Supplier.country) {
                if let country = currentEntity.country {
                    value = "\(country)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Supplier.country, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.country = nil
                    self.validity[8] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Supplier.country) {
                        currentEntity.country = validValue
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
            if currentEntity.hasDataValue(for: Supplier.phone) {
                if let phone = currentEntity.phone {
                    value = "\(phone)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Supplier.phone, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.phone = nil
                    self.validity[9] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Supplier.phone) {
                        currentEntity.phone = validValue
                        self.validity[9] = true
                    } else {
                        self.validity[9] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[9]
            })
        case 10:
            var value = ""
            if currentEntity.hasDataValue(for: Supplier.fax) {
                if let fax = currentEntity.fax {
                    value = "\(fax)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Supplier.fax, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.fax = nil
                    self.validity[10] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Supplier.fax) {
                        currentEntity.fax = validValue
                        self.validity[10] = true
                    } else {
                        self.validity[10] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[10]
            })
        case 11:
            var value = ""
            if currentEntity.hasDataValue(for: Supplier.homePage) {
                if let homePage = currentEntity.homePage {
                    value = "\(homePage)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Supplier.homePage, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.homePage = nil
                    self.validity[11] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Supplier.homePage) {
                        currentEntity.homePage = validValue
                        self.validity[11] = true
                    } else {
                        self.validity[11] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[11]
            })
        default:
            return cellForDefault(tableView: tableView, indexPath: indexPath)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func createEntityWithDefaultValues() -> Supplier {
        let newEntity = Supplier()
        newEntity.supplierID = defaultValueFor(Supplier.supplierID)
        newEntity.companyName = defaultValueFor(Supplier.companyName)
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
