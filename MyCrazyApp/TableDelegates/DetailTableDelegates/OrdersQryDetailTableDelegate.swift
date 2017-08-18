//
// OrdersQryDetailTableDelegate.swift
// MyCrazyApp
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 05/05/17
//
import Foundation
import UIKit
import SAPOData
import SAPCommon

class OrdersQryDetailTableDelegate: NSObject, DetailTableDelegate {
    private let dataAccess: NorthwindEntitiesDataAccess!
    private var _entity: OrdersQry?
    var entity: EntityValue {
        get {
            if _entity == nil {
                _entity = createEntityWithDefaultValues()
            }
            return _entity!
        }
        set {
            _entity = newValue as? OrdersQry
        }
    }
    var rightBarButton: UIBarButtonItem
    private var validity = Array(repeating: true, count: 20)

    init(dataAccess: NorthwindEntitiesDataAccess, rightBarButton: UIBarButtonItem) {
        self.dataAccess = dataAccess
        self.rightBarButton = rightBarButton
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let currentEntity = self.entity as? OrdersQry else {
            return cellForDefault(tableView: tableView, indexPath: indexPath)
        }
        switch indexPath.row {
        case 0:
            var value = ""
            if currentEntity.hasDataValue(for: OrdersQry.orderID) {
                value = "\(currentEntity.orderID)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrdersQry.orderID, value: value, changeHandler: { (newValue: String) -> Bool in
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
            if currentEntity.hasDataValue(for: OrdersQry.customerID) {
                if let customerID = currentEntity.customerID {
                    value = "\(customerID)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrdersQry.customerID, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.customerID = nil
                    self.validity[1] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: OrdersQry.customerID) {
                        currentEntity.customerID = validValue
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
            if currentEntity.hasDataValue(for: OrdersQry.employeeID) {
                if let employeeID = currentEntity.employeeID {
                    value = "\(employeeID)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrdersQry.employeeID, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.employeeID = nil
                    self.validity[2] = true
                } else {
                    if let validValue = TypeValidator.validInteger(from: newValue) {
                        currentEntity.employeeID = validValue
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
            if currentEntity.hasDataValue(for: OrdersQry.orderDate) {
                if let orderDate = currentEntity.orderDate {
                    value = "\(orderDate)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrdersQry.orderDate, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.orderDate = nil
                    self.validity[3] = true
                } else {
                    if let validValue = TypeValidator.validGlobalDateTime(from: newValue) { // This is just a simple solution to handle UTC only
                        currentEntity.orderDate = validValue
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
            if currentEntity.hasDataValue(for: OrdersQry.requiredDate) {
                if let requiredDate = currentEntity.requiredDate {
                    value = "\(requiredDate)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrdersQry.requiredDate, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.requiredDate = nil
                    self.validity[4] = true
                } else {
                    if let validValue = TypeValidator.validGlobalDateTime(from: newValue) { // This is just a simple solution to handle UTC only
                        currentEntity.requiredDate = validValue
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
            if currentEntity.hasDataValue(for: OrdersQry.shippedDate) {
                if let shippedDate = currentEntity.shippedDate {
                    value = "\(shippedDate)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrdersQry.shippedDate, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.shippedDate = nil
                    self.validity[5] = true
                } else {
                    if let validValue = TypeValidator.validGlobalDateTime(from: newValue) { // This is just a simple solution to handle UTC only
                        currentEntity.shippedDate = validValue
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
            if currentEntity.hasDataValue(for: OrdersQry.shipVia) {
                if let shipVia = currentEntity.shipVia {
                    value = "\(shipVia)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrdersQry.shipVia, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.shipVia = nil
                    self.validity[6] = true
                } else {
                    if let validValue = TypeValidator.validInteger(from: newValue) {
                        currentEntity.shipVia = validValue
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
            if currentEntity.hasDataValue(for: OrdersQry.freight) {
                if let freight = currentEntity.freight {
                    value = "\(freight)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrdersQry.freight, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.freight = nil
                    self.validity[7] = true
                } else {
                    if let validValue = TypeValidator.validBigDecimal(from: newValue) {
                        currentEntity.freight = validValue
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
            if currentEntity.hasDataValue(for: OrdersQry.shipName) {
                if let shipName = currentEntity.shipName {
                    value = "\(shipName)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrdersQry.shipName, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.shipName = nil
                    self.validity[8] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: OrdersQry.shipName) {
                        currentEntity.shipName = validValue
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
            if currentEntity.hasDataValue(for: OrdersQry.shipAddress) {
                if let shipAddress = currentEntity.shipAddress {
                    value = "\(shipAddress)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrdersQry.shipAddress, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.shipAddress = nil
                    self.validity[9] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: OrdersQry.shipAddress) {
                        currentEntity.shipAddress = validValue
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
            if currentEntity.hasDataValue(for: OrdersQry.shipCity) {
                if let shipCity = currentEntity.shipCity {
                    value = "\(shipCity)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrdersQry.shipCity, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.shipCity = nil
                    self.validity[10] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: OrdersQry.shipCity) {
                        currentEntity.shipCity = validValue
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
            if currentEntity.hasDataValue(for: OrdersQry.shipRegion) {
                if let shipRegion = currentEntity.shipRegion {
                    value = "\(shipRegion)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrdersQry.shipRegion, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.shipRegion = nil
                    self.validity[11] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: OrdersQry.shipRegion) {
                        currentEntity.shipRegion = validValue
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
            if currentEntity.hasDataValue(for: OrdersQry.shipPostalCode) {
                if let shipPostalCode = currentEntity.shipPostalCode {
                    value = "\(shipPostalCode)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrdersQry.shipPostalCode, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.shipPostalCode = nil
                    self.validity[12] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: OrdersQry.shipPostalCode) {
                        currentEntity.shipPostalCode = validValue
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
            if currentEntity.hasDataValue(for: OrdersQry.shipCountry) {
                if let shipCountry = currentEntity.shipCountry {
                    value = "\(shipCountry)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrdersQry.shipCountry, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.shipCountry = nil
                    self.validity[13] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: OrdersQry.shipCountry) {
                        currentEntity.shipCountry = validValue
                        self.validity[13] = true
                    } else {
                        self.validity[13] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[13]
            })
        case 14:
            var value = ""
            if currentEntity.hasDataValue(for: OrdersQry.companyName) {
                value = "\(currentEntity.companyName)"
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrdersQry.companyName, value: value, changeHandler: { (newValue: String) -> Bool in
                if let validValue = TypeValidator.validString(from: newValue, for: OrdersQry.companyName) {
                    currentEntity.companyName = validValue
                    self.validity[14] = true
                } else {
                    self.validity[14] = false
                }
                self.barButtonShouldBeEnabled()
                return self.validity[14]
            })
        case 15:
            var value = ""
            if currentEntity.hasDataValue(for: OrdersQry.address) {
                if let address = currentEntity.address {
                    value = "\(address)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrdersQry.address, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.address = nil
                    self.validity[15] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: OrdersQry.address) {
                        currentEntity.address = validValue
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
            if currentEntity.hasDataValue(for: OrdersQry.city) {
                if let city = currentEntity.city {
                    value = "\(city)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrdersQry.city, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.city = nil
                    self.validity[16] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: OrdersQry.city) {
                        currentEntity.city = validValue
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
            if currentEntity.hasDataValue(for: OrdersQry.region) {
                if let region = currentEntity.region {
                    value = "\(region)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrdersQry.region, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.region = nil
                    self.validity[17] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: OrdersQry.region) {
                        currentEntity.region = validValue
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
            if currentEntity.hasDataValue(for: OrdersQry.postalCode) {
                if let postalCode = currentEntity.postalCode {
                    value = "\(postalCode)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrdersQry.postalCode, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.postalCode = nil
                    self.validity[18] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: OrdersQry.postalCode) {
                        currentEntity.postalCode = validValue
                        self.validity[18] = true
                    } else {
                        self.validity[18] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[18]
            })
        case 19:
            var value = ""
            if currentEntity.hasDataValue(for: OrdersQry.country) {
                if let country = currentEntity.country {
                    value = "\(country)"
                }
            }
            return cellForProperty(tableView: tableView, indexPath: indexPath, property: OrdersQry.country, value: value, changeHandler: { (newValue: String) -> Bool in
                // The property is optional, so nil value can be accepted
                if newValue.isEmpty {
                    currentEntity.country = nil
                    self.validity[19] = true
                } else {
                    if let validValue = TypeValidator.validString(from: newValue, for: OrdersQry.country) {
                        currentEntity.country = validValue
                        self.validity[19] = true
                    } else {
                        self.validity[19] = false
                    }
                }
                self.barButtonShouldBeEnabled()
                return self.validity[19]
            })
        default:
            return cellForDefault(tableView: tableView, indexPath: indexPath)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func createEntityWithDefaultValues() -> OrdersQry {
        let newEntity = OrdersQry()
        newEntity.orderID = defaultValueFor(OrdersQry.orderID)
        newEntity.companyName = defaultValueFor(OrdersQry.companyName)
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
