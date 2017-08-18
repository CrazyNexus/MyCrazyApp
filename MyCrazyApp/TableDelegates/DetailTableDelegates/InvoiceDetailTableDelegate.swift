//
// InvoiceDetailTableDelegate.swift
// MyCrazyApp
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 05/05/17
//
import Foundation
import UIKit
import SAPOData
import SAPCommon

class InvoiceDetailTableDelegate: NSObject, DetailTableDelegate {
    private let dataAccess: NorthwindEntitiesDataAccess!
    private var _entity: Invoice?
    var entity: EntityValue {
        get {
            if _entity == nil {
                _entity = createEntityWithDefaultValues()
            }
            return _entity!
        }
        set {
            _entity = newValue as? Invoice
        }
    }
    var rightBarButton: UIBarButtonItem
    private var validity = Array(repeating: true, count: 26)

    init(dataAccess: NorthwindEntitiesDataAccess, rightBarButton: UIBarButtonItem) {
        self.dataAccess = dataAccess
        self.rightBarButton = rightBarButton
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let currentEntity = self.entity as? Invoice else {
            return cellForDefault(tableView: tableView, indexPath: indexPath)
        }
        switch indexPath.row {
        case 0:
            var value = ""
            if currentEntity.hasDataValue(for: Invoice.shipName) {
                if let shipName = currentEntity.shipName {
                    value = "\(shipName)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Invoice.shipName, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.shipName = nil
                    self.validity[0] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Invoice.shipName) {
                        currentEntity.shipName = validValue
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
            if currentEntity.hasDataValue(for: Invoice.shipAddress) {
                if let shipAddress = currentEntity.shipAddress {
                    value = "\(shipAddress)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Invoice.shipAddress, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.shipAddress = nil
                    self.validity[1] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Invoice.shipAddress) {
                        currentEntity.shipAddress = validValue
                        self.validity[1] = true
                    } else {
                        self.validity[1] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[1]
            })
        case 2:
            var value = ""
            if currentEntity.hasDataValue(for: Invoice.shipCity) {
                if let shipCity = currentEntity.shipCity {
                    value = "\(shipCity)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Invoice.shipCity, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.shipCity = nil
                    self.validity[2] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Invoice.shipCity) {
                        currentEntity.shipCity = validValue
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
            if currentEntity.hasDataValue(for: Invoice.shipRegion) {
                if let shipRegion = currentEntity.shipRegion {
                    value = "\(shipRegion)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Invoice.shipRegion, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.shipRegion = nil
                    self.validity[3] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Invoice.shipRegion) {
                        currentEntity.shipRegion = validValue
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
            if currentEntity.hasDataValue(for: Invoice.shipPostalCode) {
                if let shipPostalCode = currentEntity.shipPostalCode {
                    value = "\(shipPostalCode)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Invoice.shipPostalCode, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.shipPostalCode = nil
                    self.validity[4] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Invoice.shipPostalCode) {
                        currentEntity.shipPostalCode = validValue
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
            if currentEntity.hasDataValue(for: Invoice.shipCountry) {
                if let shipCountry = currentEntity.shipCountry {
                    value = "\(shipCountry)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Invoice.shipCountry, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.shipCountry = nil
                    self.validity[5] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Invoice.shipCountry) {
                        currentEntity.shipCountry = validValue
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
            if currentEntity.hasDataValue(for: Invoice.customerID) {
                if let customerID = currentEntity.customerID {
                    value = "\(customerID)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Invoice.customerID, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.customerID = nil
                    self.validity[6] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Invoice.customerID) {
                        currentEntity.customerID = validValue
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
            if currentEntity.hasDataValue(for: Invoice.customerName) {
                value = "\(currentEntity.customerName)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Invoice.customerName, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validString(from: newValue, for: Invoice.customerName) {
                    currentEntity.customerName = validValue
                    self.validity[7] = true
                } else {
                    self.validity[7] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[7]
            })
        case 8:
            var value = ""
            if currentEntity.hasDataValue(for: Invoice.address) {
                if let address = currentEntity.address {
                    value = "\(address)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Invoice.address, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.address = nil
                    self.validity[8] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Invoice.address) {
                        currentEntity.address = validValue
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
            if currentEntity.hasDataValue(for: Invoice.city) {
                if let city = currentEntity.city {
                    value = "\(city)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Invoice.city, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.city = nil
                    self.validity[9] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Invoice.city) {
                        currentEntity.city = validValue
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
            if currentEntity.hasDataValue(for: Invoice.region) {
                if let region = currentEntity.region {
                    value = "\(region)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Invoice.region, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.region = nil
                    self.validity[10] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Invoice.region) {
                        currentEntity.region = validValue
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
            if currentEntity.hasDataValue(for: Invoice.postalCode) {
                if let postalCode = currentEntity.postalCode {
                    value = "\(postalCode)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Invoice.postalCode, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.postalCode = nil
                    self.validity[11] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Invoice.postalCode) {
                        currentEntity.postalCode = validValue
                        self.validity[11] = true
                    } else {
                        self.validity[11] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[11]
            })
        case 12:
            var value = ""
            if currentEntity.hasDataValue(for: Invoice.country) {
                if let country = currentEntity.country {
                    value = "\(country)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Invoice.country, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.country = nil
                    self.validity[12] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: Invoice.country) {
                        currentEntity.country = validValue
                        self.validity[12] = true
                    } else {
                        self.validity[12] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[12]
            })
        case 13:
            var value = ""
            if currentEntity.hasDataValue(for: Invoice.salesperson) {
                value = "\(currentEntity.salesperson)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Invoice.salesperson, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validString(from: newValue, for: Invoice.salesperson) {
                    currentEntity.salesperson = validValue
                    self.validity[13] = true
                } else {
                    self.validity[13] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[13]
            })
        case 14:
            var value = ""
            if currentEntity.hasDataValue(for: Invoice.orderID) {
                value = "\(currentEntity.orderID)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Invoice.orderID, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validInteger(from: newValue) {
                    currentEntity.orderID = validValue
                    self.validity[14] = true
                } else {
                    self.validity[14] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[14]
            })
        case 15:
            var value = ""
            if currentEntity.hasDataValue(for: Invoice.orderDate) {
                if let orderDate = currentEntity.orderDate {
                    value = "\(orderDate)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Invoice.orderDate, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.orderDate = nil
                    self.validity[15] = true
                } else {
                    if let validValue = TypeValidator.validGlobalDateTime(from: newValue) { // This is just a simple solution to handle UTC only
                        currentEntity.orderDate = validValue
                        self.validity[15] = true
                    } else {
                        self.validity[15] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[15]
            })
        case 16:
            var value = ""
            if currentEntity.hasDataValue(for: Invoice.requiredDate) {
                if let requiredDate = currentEntity.requiredDate {
                    value = "\(requiredDate)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Invoice.requiredDate, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.requiredDate = nil
                    self.validity[16] = true
                } else {
                    if let validValue = TypeValidator.validGlobalDateTime(from: newValue) { // This is just a simple solution to handle UTC only
                        currentEntity.requiredDate = validValue
                        self.validity[16] = true
                    } else {
                        self.validity[16] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[16]
            })
        case 17:
            var value = ""
            if currentEntity.hasDataValue(for: Invoice.shippedDate) {
                if let shippedDate = currentEntity.shippedDate {
                    value = "\(shippedDate)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Invoice.shippedDate, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.shippedDate = nil
                    self.validity[17] = true
                } else {
                    if let validValue = TypeValidator.validGlobalDateTime(from: newValue) { // This is just a simple solution to handle UTC only
                        currentEntity.shippedDate = validValue
                        self.validity[17] = true
                    } else {
                        self.validity[17] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[17]
            })
        case 18:
            var value = ""
            if currentEntity.hasDataValue(for: Invoice.shipperName) {
                value = "\(currentEntity.shipperName)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Invoice.shipperName, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validString(from: newValue, for: Invoice.shipperName) {
                    currentEntity.shipperName = validValue
                    self.validity[18] = true
                } else {
                    self.validity[18] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[18]
            })
        case 19:
            var value = ""
            if currentEntity.hasDataValue(for: Invoice.productID) {
                value = "\(currentEntity.productID)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Invoice.productID, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validInteger(from: newValue) {
                    currentEntity.productID = validValue
                    self.validity[19] = true
                } else {
                    self.validity[19] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[19]
            })
        case 20:
            var value = ""
            if currentEntity.hasDataValue(for: Invoice.productName) {
                value = "\(currentEntity.productName)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Invoice.productName, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validString(from: newValue, for: Invoice.productName) {
                    currentEntity.productName = validValue
                    self.validity[20] = true
                } else {
                    self.validity[20] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[20]
            })
        case 21:
            var value = ""
            if currentEntity.hasDataValue(for: Invoice.unitPrice) {
                value = "\(currentEntity.unitPrice)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Invoice.unitPrice, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validBigDecimal(from: newValue) {
                    currentEntity.unitPrice = validValue
                    self.validity[21] = true
                } else {
                    self.validity[21] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[21]
            })
        case 22:
            var value = ""
            if currentEntity.hasDataValue(for: Invoice.quantity) {
                value = "\(currentEntity.quantity)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Invoice.quantity, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validInteger(from: newValue) {
                    currentEntity.quantity = validValue
                    self.validity[22] = true
                } else {
                    self.validity[22] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[22]
            })
        case 23:
            var value = ""
            if currentEntity.hasDataValue(for: Invoice.discount) {
                value = "\(currentEntity.discount)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Invoice.discount, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validFloat(from: newValue) {
                    currentEntity.discount = validValue
                    self.validity[23] = true
                } else {
                    self.validity[23] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[23]
            })
        case 24:
            var value = ""
            if currentEntity.hasDataValue(for: Invoice.extendedPrice) {
                if let extendedPrice = currentEntity.extendedPrice {
                    value = "\(extendedPrice)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Invoice.extendedPrice, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.extendedPrice = nil
                    self.validity[24] = true
                } else {
                    if let validValue = TypeValidator.validBigDecimal(from: newValue) {
                        currentEntity.extendedPrice = validValue
                        self.validity[24] = true
                    } else {
                        self.validity[24] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[24]
            })
        case 25:
            var value = ""
            if currentEntity.hasDataValue(for: Invoice.freight) {
                if let freight = currentEntity.freight {
                    value = "\(freight)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: Invoice.freight, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.freight = nil
                    self.validity[25] = true
                } else {
                    if let validValue = TypeValidator.validBigDecimal(from: newValue) {
                        currentEntity.freight = validValue
                        self.validity[25] = true
                    } else {
                        self.validity[25] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[25]
            })
        default:
            return cellForDefault(tableView: tableView, indexPath: indexPath)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 26
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func createEntityWithDefaultValues() -> Invoice {
        let newEntity = Invoice()
        newEntity.customerName = defaultValueFor(Invoice.customerName)
        newEntity.salesperson = defaultValueFor(Invoice.salesperson)
        newEntity.orderID = defaultValueFor(Invoice.orderID)
        newEntity.shipperName = defaultValueFor(Invoice.shipperName)
        newEntity.productID = defaultValueFor(Invoice.productID)
        newEntity.productName = defaultValueFor(Invoice.productName)
        newEntity.unitPrice = defaultValueFor(Invoice.unitPrice)
        newEntity.quantity = defaultValueFor(Invoice.quantity)
        newEntity.discount = defaultValueFor(Invoice.discount)
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
